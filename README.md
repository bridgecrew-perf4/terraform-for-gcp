Prerequisite:
export GOOGLE_APPLICATION_CREDENTIALS=<insert path of service account credential>

export TF_VAR_SSH_CRED=<insert public key path>

export TF_VAR_SSH_USER=<insert username for sign in/any name can be considered>
==================================================================================
git clone https://github.com/kumarshreyansh/terraform-for-gcp.git
cd terraform-for-gcp/
terraform plan
terraform apply
