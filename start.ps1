# Script de inicio para Control Fit App
# Inicia ambos servidores (Backend y Frontend) de manera limpia

Write-Host "=== CONTROL FIT APP - INICIO ===" -ForegroundColor Cyan
Write-Host ""

# Verificar que estamos en el directorio correcto
$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $projectRoot

# Verificar dependencias
Write-Host "Verificando dependencias..." -ForegroundColor Yellow

# Verificar Python
try {
    $pythonVersion = py --version 2>&1
    Write-Host "✓ Python encontrado: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Python no encontrado. Por favor instala Python." -ForegroundColor Red
    exit 1
}

# Verificar Node.js
try {
    $nodeVersion = node --version 2>&1
    Write-Host "✓ Node.js encontrado: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Node.js no encontrado. Por favor instala Node.js." -ForegroundColor Red
    exit 1
}

Write-Host ""

# Detener procesos existentes si están corriendo
Write-Host "Deteniendo procesos existentes..." -ForegroundColor Yellow
Get-Process | Where-Object { 
    ($_.ProcessName -in @("python", "py", "node")) -and 
    ($_.MainWindowTitle -like "*uvicorn*" -or $_.MainWindowTitle -like "*next*" -or $_.CommandLine -like "*uvicorn*" -or $_.CommandLine -like "*next*")
} | Stop-Process -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2

# Verificar puertos
$port8000 = Get-NetTCPConnection -LocalPort 8000 -ErrorAction SilentlyContinue
$port3000 = Get-NetTCPConnection -LocalPort 3000 -ErrorAction SilentlyContinue

if ($port8000) {
    Write-Host "⚠ Puerto 8000 ya está en uso. Deteniendo proceso..." -ForegroundColor Yellow
    Stop-Process -Id $port8000.OwningProcess -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 1
}

if ($port3000) {
    Write-Host "⚠ Puerto 3000 ya está en uso. Deteniendo proceso..." -ForegroundColor Yellow
    Stop-Process -Id $port3000.OwningProcess -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 1
}

Write-Host ""

# Iniciar Backend
Write-Host "Iniciando Backend (FastAPI)..." -ForegroundColor Cyan
$backendScript = @"
cd '$projectRoot\backend'
Write-Host '=== BACKEND FASTAPI ===' -ForegroundColor Cyan
Write-Host 'Puerto: 8000' -ForegroundColor Gray
Write-Host 'Docs: http://localhost:8000/docs' -ForegroundColor Gray
Write-Host ''
py -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
"@

Start-Process powershell -ArgumentList "-NoExit", "-Command", $backendScript
Start-Sleep -Seconds 3

# Iniciar Frontend
Write-Host "Iniciando Frontend (Next.js)..." -ForegroundColor Cyan
$frontendScript = @"
cd '$projectRoot\frontend'
Write-Host '=== FRONTEND NEXT.JS ===' -ForegroundColor Cyan
Write-Host 'Puerto: 3000' -ForegroundColor Gray
Write-Host 'URL: http://localhost:3000' -ForegroundColor Gray
Write-Host ''
npm run dev
"@

Start-Process powershell -ArgumentList "-NoExit", "-Command", $frontendScript
Start-Sleep -Seconds 5

# Esperar a que los servidores inicien
Write-Host ""
Write-Host "Esperando a que los servidores inicien..." -ForegroundColor Yellow
Start-Sleep -Seconds 15

# Verificar servidores
Write-Host ""
Write-Host "=== VERIFICACIÓN ===" -ForegroundColor Cyan
$backendOk = $false
$frontendOk = $false

try {
    $response = Invoke-WebRequest -Uri "http://localhost:8000/health" -UseBasicParsing -TimeoutSec 5 -ErrorAction Stop
    Write-Host "✓ Backend: FUNCIONANDO (http://localhost:8000)" -ForegroundColor Green
    $backendOk = $true
} catch {
    Write-Host "✗ Backend: No responde aún" -ForegroundColor Red
}

try {
    $response = Invoke-WebRequest -Uri "http://localhost:3000" -UseBasicParsing -TimeoutSec 5 -ErrorAction Stop
    Write-Host "✓ Frontend: FUNCIONANDO (http://localhost:3000)" -ForegroundColor Green
    $frontendOk = $true
} catch {
    Write-Host "✗ Frontend: No responde aún (puede estar compilando)" -ForegroundColor Yellow
}

Write-Host ""

# Abrir navegador
if ($frontendOk -or $backendOk) {
    Write-Host "Abriendo navegador..." -ForegroundColor Cyan
    Start-Process "http://localhost:3000"
}

Write-Host ""
Write-Host "=== LISTO ===" -ForegroundColor Green
Write-Host ""
Write-Host "Servidores iniciados en ventanas separadas de PowerShell." -ForegroundColor White
Write-Host ""
Write-Host "URLs:" -ForegroundColor Yellow
Write-Host "  • Frontend: http://localhost:3000" -ForegroundColor White
Write-Host "  • Backend API: http://localhost:8000" -ForegroundColor White
Write-Host "  • API Docs: http://localhost:8000/docs" -ForegroundColor White
Write-Host ""
Write-Host "NOTA: Las ventanas de PowerShell son normales para desarrollo." -ForegroundColor Gray
Write-Host "      Muestran los logs de los servidores y permiten ver errores." -ForegroundColor Gray
Write-Host ""
Write-Host "Para detener los servidores, cierra las ventanas de PowerShell." -ForegroundColor Gray
