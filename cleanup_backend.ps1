# Script para limpiar backend/ de carpetas incorrectas
# Este script elimina solo las carpetas que NO pertenecen al proyecto Control Fit

Write-Host "=== LIMPIEZA SEGURA DE BACKEND ===" -ForegroundColor Cyan
Write-Host "Este script eliminará carpetas incorrectas de backend/" -ForegroundColor Yellow
Write-Host ""

$backendPath = "D:\PROYECTOS CURSOR\control fit app v1\Control fit app v1\backend"

# Verificar que backend existe
if (-not (Test-Path $backendPath)) {
    Write-Host "ERROR: No se encuentra la carpeta backend en la ubicación esperada" -ForegroundColor Red
    exit 1
}

Write-Host "Carpetas actuales en backend/:" -ForegroundColor Green
Get-ChildItem -Path $backendPath -Directory | ForEach-Object {
    Write-Host "  - $($_.Name)" -ForegroundColor White
}

Write-Host "`nCarpetas que se ELIMINARÁN (no pertenecen a Control Fit):" -ForegroundColor Yellow
$foldersToRemove = @(
    "Control fit app v1",
    "PDF a MP3 - Conversor de Libros",
    "Transcribir audios"
)

foreach ($folder in $foldersToRemove) {
    $fullPath = Join-Path $backendPath $folder
    if (Test-Path $fullPath) {
        Write-Host "  - $folder" -ForegroundColor Red
    } else {
        Write-Host "  - $folder (no existe, se omitirá)" -ForegroundColor Gray
    }
}

Write-Host "`nCarpetas que se MANTENDRÁN (pertenecen a Control Fit):" -ForegroundColor Green
$foldersToKeep = @(
    "app",
    "storage"
)

foreach ($folder in $foldersToKeep) {
    $fullPath = Join-Path $backendPath $folder
    if (Test-Path $fullPath) {
        Write-Host "  - $folder" -ForegroundColor Green
    }
}

Write-Host "`n¿Deseas continuar? (S/N): " -ForegroundColor Yellow -NoNewline
$response = Read-Host

if ($response -ne "S" -and $response -ne "s") {
    Write-Host "Operación cancelada." -ForegroundColor Yellow
    exit 0
}

Write-Host "`nEliminando carpetas incorrectas..." -ForegroundColor Yellow

foreach ($folder in $foldersToRemove) {
    $fullPath = Join-Path $backendPath $folder
    if (Test-Path $fullPath) {
        Write-Host "Eliminando: $folder" -ForegroundColor Yellow
        Remove-Item -Path $fullPath -Recurse -Force -ErrorAction SilentlyContinue
        if (-not (Test-Path $fullPath)) {
            Write-Host "  ✓ Eliminado correctamente" -ForegroundColor Green
        } else {
            Write-Host "  ✗ Error al eliminar" -ForegroundColor Red
        }
    }
}

Write-Host "`n=== LIMPIEZA COMPLETADA ===" -ForegroundColor Green
Write-Host "`nEstructura final de backend/:" -ForegroundColor Cyan
Get-ChildItem -Path $backendPath -Directory | ForEach-Object {
    Write-Host "  - $($_.Name)" -ForegroundColor White
}

Write-Host "`nAhora ejecuta: git add -A && git commit -m 'Clean: Remove incorrect folders from backend' && git push" -ForegroundColor Yellow
