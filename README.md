# 🏋️ Control Fit App v1

Aplicación web completa para monitoreo de grasa corporal, peso y progreso físico. Sistema diseñado para entender cómo la grasa corporal, inflamación, retención de líquidos y consistencia afectan el progreso percibido.

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![Python](https://img.shields.io/badge/Python-3.8+-green.svg)
![Next.js](https://img.shields.io/badge/Next.js-14.0-black.svg)
![FastAPI](https://img.shields.io/badge/FastAPI-0.100+-green.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

## 📋 Tabla de Contenidos

- [Características](#-características)
- [Tecnologías](#-tecnologías)
- [Instalación](#-instalación)
- [Uso](#-uso)
- [Estructura del Proyecto](#-estructura-del-proyecto)
- [API Documentation](#-api-documentation)
- [Capturas de Pantalla](#-capturas-de-pantalla)
- [Contribución](#-contribución)
- [Licencia](#-licencia)

## ✨ Características

### 📊 Monitoreo Diario
- **Registro de peso**: Seguimiento diario con visualización de tendencias
- **Horas de sueño**: Monitoreo de calidad de descanso
- **Entrenamiento**: Registro de días de entrenamiento realizados
- **Calorías**: Seguimiento de consumo calórico (manual o estimado)
- **Notas personalizadas**: Anotaciones adicionales por día

### 📸 Análisis de Fotos Corporales
- **Subida de fotos**: Almacenamiento seguro de fotos corporales
- **Marcado de mejor estado**: Identificación de fotos que representan tu mejor condición física
- **Edición de metadatos**: Fecha, notas y estado físico editable
- **Análisis de grasa corporal**: Estimación de porcentaje de grasa (rango)

### 🍔 Registro de Comidas Trampa
- **Registro cualitativo**: Descripción de comidas trampa
- **Análisis de impacto**: Evaluación automática del impacto en el progreso
- **Agrupación por semanas**: Visualización organizada por períodos semanales

### 📈 Feedback Semanal
- **Análisis automático**: Generación de feedback basado en datos semanales
- **Tendencias de peso**: Identificación de patrones y cambios
- **Análisis de consistencia**: Evaluación de adherencia al plan
- **Interpretación de resultados**: Explicación del progreso considerando múltiples factores

### 👤 Gestión de Perfiles
- **Perfiles versionados**: Historial completo de cambios en el perfil de entrenamiento
- **Información básica**: Edad, altura, peso inicial
- **Contexto de entrenamiento**: Días por semana, tipo de entrenamiento, nivel de actividad
- **Notas personalizadas**: Información adicional sobre el contexto

### 📅 Organización por Semanas
- **Numeración automática**: Días numerados del 1 al 7 por semana
- **Agrupación inteligente**: Registros organizados automáticamente por semanas
- **Visualización clara**: Interfaz intuitiva para revisar el progreso semanal

## 🛠️ Tecnologías

### Backend
- **FastAPI**: Framework web moderno y rápido para Python
- **SQLAlchemy**: ORM para gestión de base de datos
- **Pydantic**: Validación de datos y configuración
- **Python 3.8+**: Lenguaje de programación
- **SQLite**: Base de datos (fácil migración a PostgreSQL)

### Frontend
- **Next.js 14**: Framework React con App Router
- **TypeScript**: Tipado estático para JavaScript
- **React 18**: Biblioteca para interfaces de usuario
- **Axios**: Cliente HTTP para llamadas a la API
- **CSS Inline**: Estilos sin dependencias externas

### Servicios
- **LLM Integration**: Análisis inteligente de datos (preparado para integración)
- **Image Analysis**: Análisis de imágenes corporales (preparado para integración)
- **Background Jobs**: Procesamiento asíncrono de tareas

## 🚀 Instalación

### Requisitos Previos

- **Python 3.8+** ([Descargar](https://www.python.org/downloads/))
- **Node.js 18+** ([Descargar](https://nodejs.org/))
- **Git** ([Descargar](https://git-scm.com/downloads))

### Pasos de Instalación

1. **Clonar el repositorio**
   ```bash
   git clone https://github.com/arndev10/Control-fit-app-v1.git
   cd Control-fit-app-v1
   ```

2. **Configurar el Backend**
   ```bash
   cd backend
   pip install -r requirements.txt
   ```

3. **Configurar el Frontend**
   ```bash
   cd ../frontend
   npm install
   ```

4. **Iniciar la aplicación**
   
   **Opción A: Script automático (Recomendado)**
   ```powershell
   # Desde la raíz del proyecto
   .\start.ps1
   ```
   
   **Opción B: Manual**
   ```bash
   # Terminal 1 - Backend
   cd backend
   python -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
   
   # Terminal 2 - Frontend
   cd frontend
   npm run dev
   ```

5. **Acceder a la aplicación**
   - Frontend: http://localhost:3000
   - Backend API Docs: http://localhost:8000/docs

## 📖 Uso

### Primeros Pasos

1. **Registro de Usuario**
   - Ve a http://localhost:3000/register
   - Crea una cuenta con tu email y contraseña

2. **Crear Perfil de Entrenamiento**
   - Navega a "Perfil" en el menú
   - Completa tu información básica y contexto de entrenamiento

3. **Registrar tu Primer Log Diario**
   - Ve a "Logs" en el menú
   - Haz clic en "+ Nuevo Registro"
   - Completa peso, sueño, entrenamiento y calorías

4. **Subir Fotos**
   - Ve a "Fotos" en el menú
   - Sube fotos corporales para seguimiento visual
   - Marca las que representan tu mejor estado físico

5. **Generar Feedback Semanal**
   - Ve a "Feedback" en el menú
   - Selecciona el rango de fechas
   - Genera análisis automático de tu progreso

### Características Avanzadas

- **Edición Retroactiva**: Puedes editar cualquier registro pasado
- **Numeración por Semanas**: Los días se numeran del 1 al 7 por semana automáticamente
- **Gráficos de Peso**: Visualización de tendencias en el Dashboard
- **Historial Completo**: Acceso a todos tus datos históricos

## 📁 Estructura del Proyecto

```
Control-fit-app-v1/
├── backend/                    # API Backend (FastAPI)
│   ├── app/
│   │   ├── api/              # Rutas de la API
│   │   │   └── routes/       # Endpoints por módulo
│   │   ├── db/               # Base de datos
│   │   │   ├── models.py     # Modelos SQLAlchemy
│   │   │   └── session.py   # Configuración de sesión
│   │   ├── domain/           # Lógica de negocio
│   │   │   ├── feedback_engine.py
│   │   │   ├── trend_analysis.py
│   │   │   └── body_analysis.py
│   │   ├── schemas/          # Esquemas Pydantic
│   │   ├── services/         # Servicios externos
│   │   │   ├── llm_service.py
│   │   │   └── image_analysis.py
│   │   ├── workers/          # Tareas en background
│   │   └── main.py           # Punto de entrada
│   ├── requirements.txt      # Dependencias Python
│   └── storage/              # Almacenamiento de archivos
│       └── photos/           # Fotos de usuarios
│
├── frontend/                  # Aplicación Frontend (Next.js)
│   ├── app/                  # Páginas y rutas (App Router)
│   │   ├── dashboard/        # Dashboard principal
│   │   ├── logs/            # Registros diarios
│   │   ├── photos/          # Gestión de fotos
│   │   ├── feedback/        # Feedback semanal
│   │   ├── profile/         # Perfiles de usuario
│   │   └── ...
│   ├── components/           # Componentes React reutilizables
│   ├── lib/                  # Utilidades y helpers
│   │   ├── api.ts           # Cliente API
│   │   ├── dateUtils.ts     # Utilidades de fechas
│   │   └── weekUtils.ts     # Utilidades de semanas
│   ├── types/                # Definiciones TypeScript
│   └── package.json          # Dependencias Node.js
│
├── start.ps1                 # Script de inicio automático
├── GUIA_RECUPERACION.md      # Guía detallada de recuperación
└── README.md                 # Este archivo
```

## 📚 API Documentation

La documentación interactiva de la API está disponible cuando el backend está corriendo:

**Swagger UI**: http://localhost:8000/docs

**ReDoc**: http://localhost:8000/redoc

### Endpoints Principales

- `POST /api/auth/register` - Registro de usuario
- `POST /api/auth/login` - Inicio de sesión
- `GET /api/daily-logs` - Listar registros diarios
- `POST /api/daily-logs` - Crear registro diario
- `GET /api/photos` - Listar fotos
- `POST /api/photos` - Subir foto
- `POST /api/feedback/weekly` - Generar feedback semanal
- `GET /api/profile/active` - Obtener perfil activo

Ver la documentación completa en http://localhost:8000/docs

## 📸 Capturas de Pantalla

> **Nota**: Las capturas de pantalla se agregarán próximamente. El proyecto está listo para producción y todas las funcionalidades están implementadas.

### Funcionalidades Visuales

- **Dashboard**: Vista general con estadísticas y gráficos
- **Registros Diarios**: Tabla organizada por semanas con numeración automática
- **Galería de Fotos**: Visualización de fotos con opción de edición
- **Feedback Semanal**: Análisis detallado del progreso

## 🔧 Configuración

### Variables de Entorno (Opcional)

Crea un archivo `.env` en la raíz del proyecto:

```env
# Backend
DATABASE_URL=sqlite:///./control_fit.db
PHOTOS_STORAGE_PATH=./backend/storage/photos

# Frontend
NEXT_PUBLIC_API_URL=http://localhost:8000
```

### Base de Datos

Por defecto, la aplicación usa SQLite. La base de datos se crea automáticamente al iniciar el backend por primera vez.

Para usar PostgreSQL u otra base de datos, modifica `DATABASE_URL` en `backend/app/config.py`.

## 🐛 Solución de Problemas

### Problemas Comunes

**Puerto ya en uso**
```bash
# Windows
netstat -ano | findstr :8000
taskkill /PID <PID> /F
```

**Dependencias no instaladas**
```bash
# Backend
cd backend && pip install -r requirements.txt

# Frontend
cd frontend && npm install
```

**Base de datos no se crea**
- Verifica permisos de escritura
- Elimina `backend/control_fit.db` y reinicia el servidor

Para más ayuda, consulta `GUIA_RECUPERACION.md`

## 🤝 Contribución

Las contribuciones son bienvenidas. Por favor:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📝 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

## 👤 Autor

**Arndev10**

- GitHub: [@arndev10](https://github.com/arndev10)
- Repositorio: [Control-fit-app-v1](https://github.com/arndev10/Control-fit-app-v1)

## 🙏 Agradecimientos

- FastAPI por el excelente framework
- Next.js por la increíble experiencia de desarrollo
- La comunidad de código abierto

## 📞 Soporte

Si tienes preguntas o necesitas ayuda:

1. Revisa la documentación en `GUIA_RECUPERACION.md`
2. Abre un issue en GitHub
3. Consulta la documentación de la API en http://localhost:8000/docs

---

⭐ Si este proyecto te resulta útil, considera darle una estrella en GitHub!
