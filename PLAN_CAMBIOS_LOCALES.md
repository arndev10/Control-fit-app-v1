# 📋 PLAN DE CAMBIOS EN CARPETAS LOCALES

## 🔍 ESTRUCTURA ACTUAL

```
D:\PROYECTOS CURSOR\control fit app v1\
├── backend/
│   ├── app/              ✅ (existe)
│   └── control_fit.db    ✅ (existe)
├── frontend/             ✅ (existe pero parece incompleto)
├── cleanup_backend.ps1
├── GUIA_TRABAJO_ORDENADO.md
├── PLAN_CORRECCION_REPO_PUBLICO.md
├── PLAN_REORGANIZACION.md
├── reorganize.ps1
└── RESUMEN_CAMBIOS_GITHUB.md
```

## ❌ PROBLEMAS DETECTADOS

1. **Falta `backend/storage/`** - Necesario para almacenar fotos
2. **Falta `backend/README.md`** - Documentación del backend
3. **Falta `backend/requirements.txt`** - Dependencias Python
4. **Archivos de documentación/scripts en raíz** - Deberían estar organizados
5. **Frontend parece incompleto** - Solo tiene `next-env.d.ts` y `node_modules`

## ✅ CAMBIOS PROPUESTOS

### 1. Crear carpetas faltantes en backend/
- ✅ Crear `backend/storage/photos/` (para fotos de usuarios)
- ✅ Crear `backend/README.md` (si no existe, copiar desde el repo remoto)
- ✅ Verificar `backend/requirements.txt` (si no existe, crearlo)

### 2. Organizar archivos de documentación
- ✅ Mover archivos `.md` de planificación a una carpeta `docs/` o mantenerlos en raíz
- ✅ Los scripts `.ps1` pueden quedarse en raíz (son útiles)

### 3. Verificar estructura de frontend
- ✅ Verificar que `frontend/` tenga todos los archivos necesarios
- ✅ Si falta código, copiarlo desde el repositorio remoto

### 4. Estructura final deseada

```
D:\PROYECTOS CURSOR\control fit app v1\
├── backend/
│   ├── app/                  ✅
│   ├── storage/               ✅ (CREAR)
│   │   └── photos/           ✅ (CREAR)
│   ├── README.md             ✅ (VERIFICAR/CREAR)
│   └── requirements.txt      ✅ (VERIFICAR/CREAR)
├── frontend/                  ✅ (VERIFICAR contenido)
├── .gitignore                ✅ (VERIFICAR)
├── README.md                  ✅ (VERIFICAR)
└── [scripts .ps1]             ✅ (mantener en raíz)
```

## 🎯 ACCIONES ESPECÍFICAS

1. **Crear `backend/storage/photos/`**
   - Carpeta para almacenar fotos de usuarios
   - Crear `.gitkeep` para que Git la rastree

2. **Verificar/Crear `backend/README.md`**
   - Documentación del backend
   - Si no existe, crear uno básico

3. **Verificar/Crear `backend/requirements.txt`**
   - Dependencias Python del proyecto
   - Si no existe, crearlo con las dependencias básicas

4. **Verificar estructura de frontend**
   - Asegurar que tenga `app/`, `components/`, `lib/`, etc.

## ⚠️ NOTAS

- No se eliminará ningún archivo existente
- Solo se crearán carpetas/archivos faltantes
- Se verificarán archivos importantes antes de crear nuevos
