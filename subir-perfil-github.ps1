# Script para crear y subir el README del perfil de GitHub
# Este script crea un repositorio llamado 'arndev10' y sube el README.md

Write-Host "🚀 Preparando README para perfil de GitHub..." -ForegroundColor Cyan
Write-Host ""

# Ruta del README actual
$readmePath = Join-Path $PSScriptRoot "README.md"

# Verificar que el README existe
if (-not (Test-Path $readmePath)) {
    Write-Host "❌ Error: No se encontró README.md en la carpeta actual" -ForegroundColor Red
    exit 1
}

Write-Host "✅ README.md encontrado" -ForegroundColor Green

# Crear directorio temporal para el repositorio de perfil
$parentDir = Split-Path -Parent $PSScriptRoot
$profileRepoPath = Join-Path $parentDir "arndev10-profile"
$profileRepoPath = [System.IO.Path]::GetFullPath($profileRepoPath)

Write-Host ""
Write-Host "📁 Creando directorio para repositorio de perfil..." -ForegroundColor Cyan
Write-Host "   Ruta: $profileRepoPath" -ForegroundColor Gray

# Si el directorio ya existe, eliminarlo
if (Test-Path $profileRepoPath) {
    Write-Host "⚠️  El directorio ya existe. Eliminando..." -ForegroundColor Yellow
    Remove-Item -Path $profileRepoPath -Recurse -Force
}

New-Item -ItemType Directory -Path $profileRepoPath -Force | Out-Null

# Copiar README al nuevo directorio
Copy-Item -Path $readmePath -Destination $profileRepoPath -Force
Write-Host "✅ README copiado al nuevo directorio" -ForegroundColor Green

# Inicializar git
Write-Host ""
Write-Host "🔧 Inicializando repositorio Git..." -ForegroundColor Cyan
Set-Location $profileRepoPath
git init | Out-Null
git add README.md
git commit -m "Add profile README" | Out-Null
Write-Host "✅ Repositorio Git inicializado" -ForegroundColor Green

Write-Host ""
Write-Host ("=" * 60) -ForegroundColor Cyan
Write-Host "📋 PRÓXIMOS PASOS MANUALES:" -ForegroundColor Yellow
Write-Host ("=" * 60) -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Ve a GitHub y crea un nuevo repositorio:" -ForegroundColor White
Write-Host "   https://github.com/new" -ForegroundColor Cyan
Write-Host ""
Write-Host "2. Configuración del repositorio:" -ForegroundColor White
Write-Host "   - Nombre: arndev10 (exactamente igual a tu username)" -ForegroundColor Yellow
Write-Host "   - Descripción: PMP® Certified Project Manager | Full-Stack Developer" -ForegroundColor Yellow
Write-Host "   - Visibilidad: PÚBLICO ✅" -ForegroundColor Yellow
Write-Host "   - NO marques 'Add a README file'" -ForegroundColor Yellow
Write-Host ""
Write-Host "3. Después de crear el repositorio, ejecuta estos comandos:" -ForegroundColor White
Write-Host ""
Write-Host "   cd `"$profileRepoPath`"" -ForegroundColor Cyan
Write-Host "   git remote add origin https://github.com/arndev10/arndev10.git" -ForegroundColor Cyan
Write-Host "   git branch -M main" -ForegroundColor Cyan
Write-Host "   git push -u origin main" -ForegroundColor Cyan
Write-Host ""
Write-Host "4. ¡Listo! Tu perfil mostrará el README automáticamente." -ForegroundColor Green
Write-Host ""
Write-Host ("=" * 60) -ForegroundColor Cyan
Write-Host ""
Write-Host "💡 El repositorio está preparado en:" -ForegroundColor Cyan
Write-Host "   $profileRepoPath" -ForegroundColor Gray
Write-Host ""
