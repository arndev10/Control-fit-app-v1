# 📚 GUÍA: CÓMO TRABAJAR DE FORMA ORDENADA

## 🎯 PRINCIPIO FUNDAMENTAL

**GitHub = Almacén central (backup y colaboración)**  
**Carpeta local = Tu espacio de trabajo activo**

## 🔄 FLUJO DE TRABAJO RECOMENDADO

### ✅ OPCIÓN 1: Trabajar desde Cursor (RECOMENDADO)

**Cuándo usar:** Cuando quieres continuar trabajando en un proyecto que ya tienes abierto en Cursor.

**Pasos:**
1. Abre Cursor
2. Abre la carpeta del proyecto: `D:\PROYECTOS CURSOR\control fit app v1\Control fit app v1`
3. Trabaja normalmente
4. Cuando termines cambios importantes:
   ```bash
   git add -A
   git commit -m "Descripción de cambios"
   git push origin main
   ```

**Ventajas:**
- ✅ Continúas donde lo dejaste
- ✅ Tienes todo el contexto de Cursor
- ✅ No necesitas clonar nada
- ✅ Más rápido

---

### ✅ OPCIÓN 2: Trabajar desde GitHub (NUEVO PROYECTO)

**Cuándo usar:** Cuando quieres empezar en una computadora nueva o después de mucho tiempo.

**Pasos:**
1. Ve a GitHub: https://github.com/arndev10/Arndev-projects/tree/main/Control%20fit%20app%20v1
2. Copia la URL del repositorio
3. En Cursor, abre terminal y ejecuta:
   ```bash
   cd D:\PROYECTOS CURSOR
   git clone https://github.com/arndev10/Arndev-projects.git
   cd Arndev-projects/Control\ fit\ app\ v1
   ```
4. Abre esa carpeta en Cursor
5. Trabaja normalmente

**Ventajas:**
- ✅ Siempre tienes la versión más reciente
- ✅ Funciona en cualquier computadora
- ✅ Puedes tener múltiples copias

---

## 🚨 REGLAS DE ORO PARA NO MEZCLAR PROYECTOS

### 1. **UNA CARPETA = UN PROYECTO**

```
D:\PROYECTOS CURSOR\
├── control fit app v1\          ← Proyecto Control Fit
│   └── Control fit app v1\      ← Carpeta del proyecto
├── PDF a MP3 - Conversor\       ← Otro proyecto (separado)
└── Transcribir audios\          ← Otro proyecto (separado)
```

**NUNCA mezcles código de un proyecto dentro de otro.**

---

### 2. **SIEMPRE TRABAJA DENTRO DE LA CARPETA DEL PROYECTO**

Para Control Fit App, siempre abre:
```
D:\PROYECTOS CURSOR\control fit app v1\Control fit app v1
```

**NO trabajes desde:**
- ❌ `D:\PROYECTOS CURSOR\control fit app v1` (raíz del repo)
- ❌ `D:\PROYECTOS CURSOR\control fit app v1\backend` (solo backend)

---

### 3. **ANTES DE TRABAJAR, VERIFICA DÓNDE ESTÁS**

En Cursor, verifica la carpeta abierta:
- ✅ Debe ser: `Control fit app v1` (dentro de la carpeta del proyecto)
- ✅ Debe tener: `backend/`, `frontend/`, `README.md`

---

### 4. **GIT PUSH = GUARDAR EN GITHUB**

Cada vez que haces `git push`, estás:
- ✅ Guardando tu trabajo en GitHub
- ✅ Creando un backup
- ✅ Permitiendo que otros (o tú en otra PC) vean los cambios

**Haz push frecuentemente** (después de cambios importantes).

---

## 📋 CHECKLIST ANTES DE TRABAJAR

Antes de empezar a trabajar, verifica:

- [ ] ¿Estoy en la carpeta correcta del proyecto?
- [ ] ¿Tengo la versión más reciente? (`git pull` si trabajaste en otra PC)
- [ ] ¿Estoy trabajando dentro de `Control fit app v1/`?
- [ ] ¿No estoy mezclando con otros proyectos?

---

## 🔍 CÓMO SABER DÓNDE ESTÁS

### En Cursor:
1. Mira la barra de título de la ventana
2. O mira el explorador de archivos (panel izquierdo)
3. Debe mostrar: `Control fit app v1` como carpeta raíz

### En Terminal:
```bash
pwd  # Muestra dónde estás
# Debe mostrar: D:\PROYECTOS CURSOR\control fit app v1\Control fit app v1
```

---

## 💡 TIPS PRÁCTICOS

### Si trabajas en la misma PC:
1. **Siempre abre la misma carpeta en Cursor**
2. **No clones el repo cada vez** (solo la primera vez)
3. **Haz `git pull`** si trabajaste en otra PC antes

### Si trabajas en otra PC:
1. **Clona el repo desde GitHub** (primera vez)
2. **Abre esa carpeta en Cursor**
3. **Trabaja normalmente**
4. **Haz `git push`** cuando termines

### Si no estás seguro:
1. **Cierra Cursor**
2. **Abre Cursor de nuevo**
3. **Abre la carpeta correcta**: `Control fit app v1`
4. **Verifica que ves `backend/` y `frontend/`**

---

## 🎯 RESUMEN RÁPIDO

**Para continuar trabajando:**
- ✅ Abre Cursor
- ✅ Abre: `D:\PROYECTOS CURSOR\control fit app v1\Control fit app v1`
- ✅ Trabaja
- ✅ `git push` cuando termines

**Para empezar en otra PC:**
- ✅ Clona desde GitHub
- ✅ Abre la carpeta clonada en Cursor
- ✅ Trabaja
- ✅ `git push` cuando termines

**NUNCA:**
- ❌ Mezcles proyectos
- ❌ Trabajes desde la raíz del repo
- ❌ Olvides hacer `git push`

---

## 📞 SI ALGO SALE MAL

Si mezclaste algo o no estás seguro:
1. **NO hagas push**
2. **Pregúntame primero**
3. **Revisa dónde estás trabajando**
4. **Verifica la estructura de carpetas**
