# Mock Server Setup

Este proyecto incluye un servidor mock local usando json-server para desarrollo.

## 🚀 Configuración Rápida

### 1. Instalar json-server
```bash
npm install -g json-server
```

### 2. Levantar el servidor
```bash
json-server --watch db.json --port 3000
```

### 3. Verificar que funciona
```bash
curl http://localhost:3000/courses
```

## 📊 Endpoints Disponibles

| Endpoint | Descripción | Ejemplo |
|----------|-------------|---------|
| `GET /courses` | Lista todos los cursos | `http://localhost:3000/courses` |
| `GET /courses/1` | Obtener curso específico | `http://localhost:3000/courses/1` |
| `GET /mentors` | Lista todos los mentores | `http://localhost:3000/mentors` |
| `GET /categories` | Lista todas las categorías | `http://localhost:3000/categories` |
| `GET /profile` | Perfil del usuario | `http://localhost:3000/profile` |
| `GET /promote` | Promociones activas | `http://localhost:3000/promote` |
| `GET /lessons` | Lista de lecciones | `http://localhost:3000/lessons` |
| `GET /reviews` | Reseñas de cursos | `http://localhost:3000/reviews` |
| `GET /searchHistory` | Historial de búsquedas | `http://localhost:3000/searchHistory` |

## 🔧 Funcionalidades de json-server

- **GET**: Obtener datos
- **POST**: Crear nuevos datos
- **PUT/PATCH**: Actualizar datos
- **DELETE**: Eliminar datos
- **Filtros**: `?category=Mobile Development`
- **Ordenamiento**: `?_sort=rating&_order=desc`
- **Paginación**: `?_page=1&_limit=10`

## 📝 Estructura de Datos

El archivo `db.json` contiene datos dummy para:

- **Cursos**: Con precios, ratings, mentores, etc.
- **Mentores**: Con información profesional y especialidades
- **Categorías**: Para organizar cursos
- **Perfil**: Información del usuario
- **Promociones**: Ofertas especiales
- **Lecciones**: Contenido de cursos con videos
- **Reseñas**: Opiniones de usuarios
- **Historial**: Búsquedas recientes

## 🎯 Uso en Desarrollo

1. **Iniciar servidor mock**:
   ```bash
   json-server --watch db.json --port 3000
   ```

2. **Ejecutar aplicación Flutter**:
   ```bash
   flutter run --flavor dev --target=lib/main_dev.dart
   ```

3. **La app se conectará automáticamente** a `http://localhost:3000`

## 🛠️ Personalización

Para modificar los datos:

1. Edita el archivo `db.json`
2. json-server detectará cambios automáticamente
3. Haz hot reload en Flutter para ver cambios

## 📱 Endpoints Específicos de la App

La aplicación espera estos endpoints específicos:

- `GET /courses/popular` - Cursos populares
- `GET /mentors` - Lista de mentores
- `GET /categories` - Categorías de cursos
- `GET /profile` - Perfil del usuario
- `GET /promote` - Promociones activas

## 🔍 Debugging

Para ver las requests de la app:
1. Abre DevTools de Flutter
2. Ve a la pestaña "Network"
3. Todas las requests a `localhost:3000` serán visibles

## 📋 Notas

- El servidor se reinicia automáticamente cuando cambias `db.json`
- Los datos se mantienen en memoria (se resetean al reiniciar)
- Para datos persistentes, usa `--watch db.json --port 3000 --delay 1000`
