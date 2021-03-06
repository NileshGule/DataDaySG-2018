Param(
    [parameter(Mandatory=$false)]
    [string]$subscriptionName="Visual Studio Enterprise",
    [parameter(Mandatory=$false)]
    [string]$resourceGroupName="DD2018SGResourceGroup",
    [parameter(Mandatory=$false)]
    [string]$resourceGroupLocaltion="East US",
    [parameter(Mandatory=$false)]
    [string]$clusterName="DD2018SGAKSCluster",
    [parameter(Mandatory=$false)]
    [int16]$workerNodeCount=2,
    [parameter(Mandatory=$false)]
    [string]$kubernetesVersion="1.9.2"
    
)

# Set Azure subscription name
Write-Host "Setting Azure subscription to $subscriptionName"  -ForegroundColor Yellow
az account set --subscription=$subscriptionName

# Create resource group name
Write-Host "Creating resource group $resourceGroupName in region $resourceGroupLocaltion" -ForegroundColor Yellow
az group create `
--name=$resourceGroupName `
--location=$resourceGroupLocaltion `
--output=jsonc

# Create AKS cluster
Write-Host "Creating AKS cluster $clusterName with resource group $resourceGroupName in region $resourceGroupLocaltion" -ForegroundColor Yellow
time az aks create `
--resource-group=$resourceGroupName `
--name=$clusterName `
--node-count=$workerNodeCount `
--kubernetes-version=$kubernetesVersion `
--output=jsonc

# Get credentials for newly created cluster
Write-Host "Getting credentials for cluster $clusterName" -ForegroundColor Yellow
az aks get-credentials `
--resource-group=$resourceGroupName `
--name=$clusterName

Write-Host "Successfully created cluster $clusterName with kubernetes version $kubernetesVersion and $workerNodeCount node(s)" -ForegroundColor Green