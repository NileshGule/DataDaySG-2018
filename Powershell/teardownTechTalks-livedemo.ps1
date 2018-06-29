Write-Host "Starting deletion of TechTalks application and services" -ForegroundColor Yellow

Write-Host "Deleting Tech Talks API service" -ForegroundColor Yellow
Set-Location ~/projects/DataDaySG-2018/k8s/AKS-livedemo/TechTalksAPI
kubectl delete --recursive --filename . 

Write-Host "Tech talks API service deleted successfully" -ForegroundColor Cyan

Write-Host "Deleting Tech Talks DB service" -ForegroundColor Yellow
Set-Location ~/projects/DataDaySG-2018/k8s/AKS-livedemo/TechTalksDB
kubectl delete --recursive --filename . 

Write-Host "Tech talks DB service deleted successfully" -ForegroundColor Cyan

Set-Location ~/projects/DataDaySG-2018/k8s/AKS-livedemo

Write-Host "Deleting Persistant Volume Claim" -ForegroundColor Yellow
kubectl delete --filename 02_PersistantVolumeClaim.yml
Write-Host "Persistant Volume Claim deleted successfully" -ForegroundColor Cyan

Write-Host "Deleting storage class" -ForegroundColor Yellow
kubectl delete --filename 01_StorageClass.yml
Write-Host "Storage class deleted successfully" -ForegroundColor Cyan

Write-Host "Deleting namespace"  -ForegroundColor Yellow
kubectl delete --filename 00_DDNamespace.yml
Write-Host "Namespace deleted successfully" -ForegroundColor Cyan

Write-Host "All the services related to Tech Talks application have been successfully deleted" -ForegroundColor Cyan

Set-Location ~/projects/DataDaySG-2018/Powershell