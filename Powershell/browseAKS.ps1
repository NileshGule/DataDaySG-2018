Param(
    [parameter(Mandatory=$false)]
    [string]$resourceGroupName="DD2018SGResourceGroup",
    [parameter(Mandatory=$false)]
    [string]$clusterName="DD2018SGAKSCluster"
)

# Browse AKS dashboard
Write-Host "Browse AKS cluster $clusterName" -ForegroundColor Yellow
az aks browse `
--resource-group=$resourceGroupName `
--name=$clusterName