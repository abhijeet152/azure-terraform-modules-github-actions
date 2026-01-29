# create resource group
resourceGroup="MyResourceGroup"
storageAccount="mystorageaccount20260123"
location="eastus"

az group create \
  --name $resourceGroup \
  --location $location

# create storage account
az storage account create \
  --name $storageAccount \
  --resource-group $resourceGroup \
  --location $location \
  --sku Standard_LRS

# create container in storage account
az storage container create \
  --name mycontainer \
  --account-name $storageAccount  

# Create an App Registration (Service Principal) and create federated identity with scenario "Github Actions deploy Azure resources"
az ad app create \
  --display-name "github-actions-deploy-app"


# capture appId from the output
APP_ID=$(az ad app list --display-name "github-actions-deploy-app" --query "[0].appId" -o tsv)
echo "App ID: $APP_ID"




# manually Create federated identity with scenario "Github Actions deploy Azure resources"
# dont add comment in json parameters
# myorg="abhijeet152"
# myrepo="terraform-githubactions-diff-env"
# mybranch="main"

# az ad app federated-credential create \
#   --id $APP_ID \
#   --parameters '{
#     "name": "github-actions-federated-cred",
#     "issuer": "https://token.actions.githubusercontent.com",
#     "organizationId": "$myorg",
#     "repository": "$myrepo",
#     "entityType": "Branch",
#     "branch": "$mybranch",
#     "subject": "repo:$myorg/$myrepo:ref:refs/heads/$mybranch",
#     "description": "Federated credential for GitHub Actions",
#     "audiences": ["api://AzureADTokenExchange"],    
#     "scenarios": ["GitHubActionsDeployAzureResources"]
#   }'

# Instead of using variables inside json parameters, directly put the values here and run the command.
# make sure to create new app registration and federated identity for new repo configurations.

myorg="abhijeet152"
myrepo="terraform-githubactions-diff-env"
mybranch="main"

az ad app federated-credential create \
  --id $APP_ID \
  --parameters '{
    "name": "github-actions-federated-cred-1",
    "issuer": "https://token.actions.githubusercontent.com",
    "organizationId": "abhijeet152",
    "repository": "terraform-githubactions-diff-env",
    "entityType": "Branch",
    "branch": "main",
    "subject": "repo:abhijeet152/terraform-githubactions-diff-env:ref:refs/heads/main",
    "description": "Federated credential for GitHub Actions",
    "audiences": ["api://AzureADTokenExchange"],    
    "scenarios": ["GitHubActionsDeployAzureResources"]
  }'


# link the service principal with appropriate role assignments
az ad sp create --id dbd2bdc2-70ac-48


# Assign role to the service principal at the resource group level or subscription level as needed


mysubscriptionId="fee3badb-32"
myresourceGroup="MyResourceGroup"


# alternatively, assign role at subscription level
az role assignment create \
  --assignee $APP_ID \
  --role "Contributor" \
  --scope /subscriptions/$mysubscriptionId


###
# assign role at resource group level
az role assignment create \
  --assignee $APP_ID \
  --role "Contributor" \
  --scope /subscriptions/$mysubscriptionId/resourceGroups/$myresourceGroup


# terraform commands to deploy resources
terraform init

terraform plan -var-file env_01_dev.tfvars

terraform plan -var-file env_02_qa.tfvars

terraform apply -var-file env_01_dev.tfvars

terraform apply -var-file env_02_qa.tfvars
