# 📦 Resumen Rápido: Cómo Recuperar el Proyecto

## 🚀 Pasos Rápidos

### 1. Clonar el Repositorio
```powershell
git clone https://github.com/arndev10/Control-fit-app-v1.git
cd Control-fit-app-v1
```

### 2. Configurar Backend
```powershell
cd backend
pip install -r requirements.txt
```

### 3. Configurar Frontend
```powershell
cd ../frontend
npm install
```

### 4. Iniciar la Aplicación
```powershell
# Desde la raíz del proyecto
.\start.ps1
```

O manualmente:
```powershell
# Terminal 1 - Backend
cd backend
py -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000

# Terminal 2 - Frontend
cd frontend
npm run dev
```

### 5. Acceder a la Aplicación
- **Frontend**: http://localhost:3000
- **Backend API Docs**: http://localhost:8000/docs

## 📋 Requisitos
- Python 3.8+
- Node.js 18+
- Git

## 📚 Documentación Completa
Ver `GUIA_RECUPERACION.md` para instrucciones detalladas y solución de problemas.

## 🔗 Enlaces
- **Repositorio**: https://github.com/arndev10/Control-fit-app-v1
- **API Docs**: http://localhost:8000/docs (cuando el backend esté corriendo)
