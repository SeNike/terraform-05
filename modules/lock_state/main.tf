resource "random_string" "unique_id" {
  length  = 8
  upper   = false
  lower   = true
  numeric = true
  special = false
}

// Create SA
resource "yandex_iam_service_account" "sa" {
  folder_id = var.folder_id
  name      = "tfstate-sa"
}

// Grant permissions
resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

// Create Static Access Keys
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "static access key for object storage"
}

resource "yandex_iam_service_account_iam_binding" "ydb_sa_binding" {
  service_account_id = yandex_iam_service_account.sa.id
  role               = "ydb.editor"
  members            = ["serviceAccount:${yandex_iam_service_account.sa.id}"]
}

resource "yandex_resourcemanager_folder_iam_member" "storage_admin" {
  folder_id = var.folder_id
  role      = "ydb.editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"

  depends_on = [yandex_iam_service_account_static_access_key.sa-static-key]
}

resource "yandex_storage_bucket" "tfstate" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  max_size = var.max_size
  bucket = "tfstate-${random_string.unique_id.result}"
}

resource "yandex_ydb_database_serverless" "tfstate-db" {
  name      = "tfstate-db"
  deletion_protection = false
  serverless_database {
    storage_size_limit          = 1
  }
}

resource "null_resource" "database_table" {
  provisioner "local-exec" {
    command = <<-EOF
export AWS_ACCESS_KEY_ID=${yandex_iam_service_account_static_access_key.sa-static-key.access_key}
export AWS_SECRET_ACCESS_KEY=${yandex_iam_service_account_static_access_key.sa-static-key.secret_key}
export AWS_DEFAULT_REGION=${var.region}
aws dynamodb create-table \
  --table-name "tfstate-lock" \
  --attribute-definitions \
    AttributeName=LockID,AttributeType=S \
  --key-schema \
    AttributeName=LockID,KeyType=HASH \
  --endpoint ${yandex_ydb_database_serverless.tfstate-db.document_api_endpoint}
EOF
  }
}

