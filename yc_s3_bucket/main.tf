# Создание Yandex Managed Service for YDB
resource "yandex_ydb_database_serverless" "tf_state_lock" {
  name = "tf_state_lock"
}

# Создание сервисного аккаунта 
resource "yandex_iam_service_account" "bucket_sa" {
  name = "bucket_sa"
}

# Назначение роли сервисному аккаунту
resource "yandex_resourcemanager_folder_iam_member" "storage_editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.bucket_sa.id}"
}

# Создание статического ключа доступа
resource "yandex_iam_service_account_static_access_key" "bucket_sa_key" {
  service_account_id = yandex_iam_service_account.bucket_sa.id
  description        = "static access key for object storage"
}

# Создание бакета 
resource "yandex_storage_bucket" "tf_bucket" {
  bucket   = "tf_bucket_${random_string.random.result}"
  max_size = 100000000
  access_key = yandex_iam_service_account_static_access_key.bucket_sa_key.access_key
  secret_key = yandex_iam_service_account_static_access_key.bucket_sa_key.secret_key
  
  # depends_on = [ yandex_resourcemanager_folder_iam_member.storage_editor ]
}

# Генерация рандомного суффикса для имени бакета
resource "random_string" "random" {
  length  = 6
  special = false
  upper   = false
}