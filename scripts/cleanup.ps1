$tempFiles = Get-ChildItem -Path "C:\Users\start\ShoperyOrganic\temp" -Recurse -Force
foreach ($file in $tempFiles) {
    Remove-Item -Path $file.FullName -Force
}

Write-Output "Temporary files cleaned up."
