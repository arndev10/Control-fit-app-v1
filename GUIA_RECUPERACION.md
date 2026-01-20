# Guía de Recuperación del Proyecto Control Fit App v1

Esta guía te ayudará a recuperar y configurar el proyecto desde cero en una nueva máquina o después de clonarlo desde GitHub.

## 📋 Requisitos Previos

Antes de comenzar, asegúrate de tener instalado:

- **Python 3.8+** ([Descargar Python](https://www.python.org/downloads/))
- **Node.js 18+** ([Descargar Node.js](https://nodejs.org/))
- **Git** ([Descargar Git](https://git-scm.com/downloads))
- **PowerShell** (viene preinstalado en Windows 10/11)

## 🚀 Pasos para Recuperar el Proyecto

### 1. Clonar el Repositorio

```powershell
# Navegar a donde quieres guardar el proyecto
cd D:\PROYECTOS

# Clonar el repositorio
git clone https://github.com/arndev10/Control-fit-app-v1.git

# Entrar al directorio del proyecto
cd Control-fit-app-v1
```

### 2. Configurar el Backend

```powershell
# Entrar al directorio del backend
cd backend

# Crear entorno virtual (opcional pero recomendado)
py -m venv venv

# Activar entorno virtual
.\venv\Scripts\Activate.ps1

# Instalar dependencias
pip install -r requirements.txt

# Verificar que se instaló correctamente
py -c "import fastapi; print('FastAPI instalado correctamente')"
```

### 3. Configurar el Frontend

```powershell
# Volver a la raíz del proyecto
cd ..

# Entrar al directorio del frontend
cd frontend

# Instalar dependencias
npm install

# Verificar instalación
npm --version
```

### 4. Configurar Base de Datos

La base de datos se creará automáticamente cuando inicies el backend por primera vez. Si necesitas crear la estructura manualmente:

```powershell
# Desde el directorio backend
cd backend

# Ejecutar migraciones (si las hay)
# py -m alembic upgrade head

# O simplemente iniciar el servidor, que creará las tablas automáticamente
```

### 5. Iniciar los Servidores

#### Opción A: Usar el Script Automático (Recomendado)

```powershell
# Desde la raíz del proyecto
.\start.ps1
```

Este script:
- Verifica dependencias
- Inicia el backend en puerto 8000
- Inicia el frontend en puerto 3000
- Abre el navegador automáticamente

#### Opción B: Iniciar Manualmente

**Terminal 1 - Backend:**
```powershell
cd backend
py -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

**Terminal 2 - Frontend:**
```powershell
cd frontend
npm run dev
```

### 6. Verificar que Todo Funciona

1. **Backend**: Abre http://localhost:8000/docs
   - Deberías ver la documentación interactiva de la API

2. **Frontend**: Abre http://localhost:3000
   - Deberías ver la página de inicio de Control Fit

3. **Registro de Usuario**:
   - Ve a http://localhost:3000/register
   - Crea una cuenta de prueba

4. **Login**:
   - Ve a http://localhost:3000/login
   - Inicia sesión con tu cuenta

## 📁 Estructura del Proyecto

```
Control-fit-app-v1/
├── backend/                 # API FastAPI
│   ├── app/
│   │   ├── api/           # Rutas de la API
│   │   ├── db/            # Modelos y sesión de base de datos
│   │   ├── domain/        # Lógica de negocio
│   │   ├── schemas/       # Esquemas Pydantic
│   │   ├── services/      # Servicios (LLM, análisis de imágenes)
│   │   └── main.py        # Punto de entrada
│   ├── requirements.txt   # Dependencias Python
│   └── storage/           # Almacenamiento de fotos
├── frontend/              # Aplicación Next.js
│   ├── app/              # Páginas y rutas
│   ├── components/       # Componentes React
│   ├── lib/             # Utilidades y API client
│   └── package.json     # Dependencias Node.js
└── start.ps1            # Script de inicio automático
```

## 🔧 Solución de Problemas Comunes

### Error: "Python no se reconoce como comando"
- Verifica que Python esté instalado: `py --version`
- Asegúrate de agregar Python al PATH durante la instalación

### Error: "npm no se reconoce como comando"
- Verifica que Node.js esté instalado: `node --version`
- Reinstala Node.js si es necesario

### Error: "Puerto 8000 ya está en uso"
```powershell
# Encontrar y detener el proceso
netstat -ano | findstr :8000
taskkill /PID <PID> /F
```

### Error: "Puerto 3000 ya está en uso"
```powershell
# Encontrar y detener el proceso
netstat -ano | findstr :3000
taskkill /PID <PID> /F
```

### Error: "Module not found" en Python
```powershell
cd backend
pip install -r requirements.txt
```

### Error: "Module not found" en Node.js
```powershell
cd frontend
npm install
```

### La base de datos no se crea
- Asegúrate de que el backend tenga permisos de escritura
- Verifica que no haya otro proceso usando la base de datos
- Elimina `backend/control_fit.db` y reinicia el servidor

## 📝 Variables de Entorno (Opcional)

Si necesitas configurar variables de entorno, crea un archivo `.env` en la raíz del proyecto:

```env
# Backend
DATABASE_URL=sqlite:///./control_fit.db
PHOTOS_STORAGE_PATH=./backend/storage/photos

# Frontend
NEXT_PUBLIC_API_URL=http://localhost:8000
```

## 🔄 Actualizar el Proyecto

Para obtener las últimas actualizaciones desde GitHub:

```powershell
# Desde la raíz del proyecto
git pull origin main

# Actualizar dependencias del backend
cd backend
pip install -r requirements.txt --upgrade

# Actualizar dependencias del frontend
cd ../frontend
npm install
```

## 📚 Recursos Adicionales

- **API Documentation**: http://localhost:8000/docs (cuando el backend esté corriendo)
- **Repositorio GitHub**: https://github.com/arndev10/Control-fit-app-v1
- **FastAPI Docs**: https://fastapi.tiangolo.com/
- **Next.js Docs**: https://nextjs.org/docs

## ✅ Checklist de Verificación

Después de seguir estos pasos, verifica que:

- [ ] Backend responde en http://localhost:8000/health
- [ ] Frontend carga en http://localhost:3000
- [ ] Puedes registrarte como nuevo usuario
- [ ] Puedes iniciar sesión
- [ ] Puedes crear un registro diario
- [ ] Puedes subir una foto
- [ ] Las fechas se guardan correctamente (sin desfase)

## 🆘 Soporte

Si encuentras problemas:

1. Revisa los logs en las ventanas de PowerShell
2. Verifica la consola del navegador (F12)
3. Revisa los logs del backend en http://localhost:8000/docs
4. Consulta esta guía nuevamente

---

**Última actualización**: Enero 2026
**Versión del proyecto**: v1.0.0
