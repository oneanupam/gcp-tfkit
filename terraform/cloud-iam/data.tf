/******************************************
 # Authincate using - gcloud auth application-default login
 # 1. store the env variable permanently using -
 # echo 'export GOOGLE_CLOUD_PROJECT="extended-ward-500913-i6"' >> ~/.zshrc
 # and then refresh the zsh run command config file using - source ~/.zshrc
 # 2. store the env variable for the current shell -
 # export GOOGLE_CLOUD_PROJECT="extended-ward-500913-i6"
 # export GOOGLE_CLOUD_PROJECT=$(gcloud config get-value project)
 *****************************************/

# data block to get the data of existing resources
data "google_project" "current_project" {
  # pass nothing to pick the value from env variable
}
