# 📋 PLAN DE REORGANIZACIÓN SEGURA

## 🎯 Objetivo
Limpiar la estructura del repositorio sin romper el proyecto funcional.

## ⚠️ PROBLEMAS DETECTADOS

### En GitHub (backend/):
- ❌ `Control fit app v1/` (duplicado, no debería estar)
- ❌ `PDF a MP3 - Conversor de Libros/` (otro proyecto)
- ❌ `Transcribir audios/` (otro proyecto)

### En Local:
- ⚠️ Hay `backend/` y `frontend/` duplicados (en raíz y dentro de `Control fit app v1/`)

## ✅ ESTRUCTURA CORRECTA DESEADA

```
Control fit app v1/
├── backend/
│   ├── app/              ✅ (código del backend)
│   ├── storage/           ✅ (fotos)
│   ├── README.md         ✅
│   └── requirements.txt  ✅
├── frontend/
│   ├── app/              ✅
│   ├── components/       ✅
│   └── ...               ✅
└── [documentación .md]   ✅
```

## 🔒 PLAN DE ACCIÓN SEGURO

### FASE 1: Preparación (SIN TOCAR NADA)
1. ✅ Verificar que el proyecto funciona actualmente
2. ✅ Hacer backup del estado actual
3. ✅ Verificar rutas en código (config.py, etc.)

### FASE 2: Limpieza Local
1. Ejecutar `cleanup_backend.ps1` para eliminar carpetas incorrectas de `backend/`
2. Verificar que solo quedan `app/` y `storage/` en `backend/`

### FASE 3: Limpieza en Git
1. `git add -A`
2. `git commit -m "Clean: Remove incorrect folders from backend"`
3. `git push origin main`

### FASE 4: Verificación
1. Verificar en GitHub que `backend/` solo tiene `app/` y `storage/`
2. Probar que el proyecto sigue funcionando
3. Verificar que las rutas de storage siguen funcionando

## 🛡️ PROTECCIONES

### Rutas que NO se tocarán:
- ✅ `backend/app/` - Código del backend (intocable)
- ✅ `backend/storage/` - Fotos de usuarios (intocable)
- ✅ `frontend/` - Código del frontend (intocable)
- ✅ Archivos de configuración (config.py, etc.)

### Solo se eliminarán:
- ❌ `backend/Control fit app v1/` (duplicado)
- ❌ `backend/PDF a MP3 - Conversor de Libros/` (otro proyecto)
- ❌ `backend/Transcribir audios/` (otro proyecto)

## 📝 NOTAS IMPORTANTES

1. **NO se moverán** los otros proyectos (`PDF a MP3`, `Transcribir audios`) - solo se eliminarán de `backend/`
2. **NO se tocará** el código funcional
3. **NO se cambiarán** rutas en config.py (usa rutas relativas `./storage/photos`)
4. El script `cleanup_backend.ps1` pide confirmación antes de eliminar

## ✅ VERIFICACIÓN POST-LIMPIEZA

Después de la limpieza, verificar:
- [ ] `backend/` solo tiene `app/`, `storage/`, `README.md`
- [ ] El servidor backend inicia correctamente
- [ ] Las fotos se pueden subir y ver
- [ ] El frontend se conecta al backend
- [ ] GitHub muestra la estructura correcta
