LOCATION='australiaeast'
RESOURCE_GROUP_NAME='challenge-06-rg'
DEPLOYMENT_NAME='challenge-06-deployment'

az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

CLOUD_INIT_SCRIPT=$(cat ../scripts/cloud-init.txt)

az deployment group create \
	--name $DEPLOYMENT_NAME \
    --resource-group $RESOURCE_GROUP_NAME \
    --template-file challenge-06.bicep \
	--parameters challenge-06.parameters.json \
    --parameters cloudInitScript="$CLOUD_INIT_SCRIPT"
