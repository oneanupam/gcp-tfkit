# Variable values
region = "europe-west2"
zone   = "europe-west2-a"

project_access = {
  "roles/storage.objectViewer" = [
    "user:anupam@int.oneanupam.in",
    "serviceAccount:infra-prov-svc-acc@extended-ward-500913-i6.iam.gserviceaccount.com"
  ]
  "roles/storage.viewer" = [
    "serviceAccount:infra-prov-svc-acc@extended-ward-500913-i6.iam.gserviceaccount.com"
  ]
}
