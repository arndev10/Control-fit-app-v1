# Script para reorganizar Control Fit App v1
# Ejecutar después de cerrar todos los procesos que usen los archivos

Write-Host "Reorganizando Control Fit App v1..." -ForegroundColor Green

$rootPath = "D:\PROYECTOS CURSOR\control fit app v1"
$targetPath = Join-Path $rootPath "Control fit app v1"

# Crear carpeta destino si no existe
if (-not (Test-Path $targetPath)) {
    New-Item -ItemType Directory -Path $targetPath -Force
}

# Mover backend
if (Test-Path (Join-Path $rootPath "backend")) {
    if (-not (Test-Path (Join-Path $targetPath "backend"))) {
        Write-Host "Moviendo backend..." -ForegroundColor Yellow
        Move-Item -Path (Join-Path $rootPath "backend") -Destination $targetPath -Force
    }
}

# Mover frontend
if (Test-Path (Join-Path $rootPath "frontend")) {
    if (-not (Test-Path (Join-Path $targetPath "frontend"))) {
        Write-Host "Moviendo frontend..." -ForegroundColor Yellow
        Move-Item -Path (Join-Path $rootPath "frontend") -Destination $targetPath -Force
    }
}

# Mover storage si está en raiz
if (Test-Path (Join-Path $rootPath "storage")) {
    if (-not (Test-Path (Join-Path $targetPath "storage"))) {
        Write-Host "Moviendo storage..." -ForegroundColor Yellow
        Move-Item -Path (Join-Path $rootPath "storage") -Destination $targetPath -Force
    }
}

# Mover archivos .md y otros archivos del proyecto
Get-ChildItem -Path $rootPath -File | Where-Object {
    $_.Name -match "\.(md|txt)$" -or 
    $_.Name -eq ".gitignore" -or
    $_.Name -eq "requirements.txt" -or
    $_.Name -match "\.(bat|ps1)$"
} | ForEach-Object {
    if (-not (Test-Path (Join-Path $targetPath $_.Name))) {
        Write-Host "Moviendo $($_.Name)..." -ForegroundColor Yellow
        Move-Item -Path $_.FullName -Destination $targetPath -Force -ErrorAction SilentlyContinue
    }
}

# Mover app si está en raiz (parte del backend)
if (Test-Path (Join-Path $rootPath "app")) {
    $backendAppPath = Join-Path $targetPath "backend\app"
    if (-not (Test-Path $backendAppPath)) {
        Write-Host "Moviendo app a backend..." -ForegroundColor Yellow
        Move-Item -Path (Join-Path $rootPath "app") -Destination (Join-Path $targetPath "backend") -Force
    }
}

# Mover control_fit.db si está en raiz
if (Test-Path (Join-Path $rootPath "control_fit.db")) {
    if (-not (Test-Path (Join-Path $targetPath "control_fit.db"))) {
        Write-Host "Moviendo control_fit.db..." -ForegroundColor Yellow
        Move-Item -Path (Join-Path $rootPath "control_fit.db") -Destination $targetPath -Force -ErrorAction SilentlyContinue
    }
}

Write-Host "`nReorganización completada!" -ForegroundColor Green
Write-Host "`nEstructura final:" -ForegroundColor Cyan
Get-ChildItem -Path $targetPath -Directory | Select-Object Name
