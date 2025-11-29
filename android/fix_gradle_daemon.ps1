# Script para arreglar el error del daemon de Gradle/Kotlin
Write-Host "Deteniendo todos los daemons de Gradle..." -ForegroundColor Yellow
cd android
.\gradlew.bat --stop

Write-Host "Limpiando cache de Gradle..." -ForegroundColor Yellow
Remove-Item -Recurse -Force "$env:USERPROFILE\.gradle\caches" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$env:USERPROFILE\.gradle\daemon" -ErrorAction SilentlyContinue

Write-Host "Limpiando build del proyecto..." -ForegroundColor Yellow
.\gradlew.bat clean

Write-Host "`n¡Listo! Ahora intenta ejecutar tu app nuevamente." -ForegroundColor Green
Write-Host "Si el problema persiste, reinicia Android Studio." -ForegroundColor Green

