# 🎨 Implementación de Avatares DiceBear - Estilo Notionist Neutral

## 📋 Descripción

Esta implementación proporciona avatares automáticos para usuarios que no tienen imagen de perfil, utilizando el servicio DiceBear con el estilo "notionists-neutral".

## 🚀 Características

- **Estilo Notionist Neutral**: Avatares minimalistas y profesionales
- **Generación Automática**: Se crean automáticamente basados en email, ID o nombre
- **Consistencia**: Mismo avatar siempre para el mismo usuario
- **Fallback Inteligente**: Usa imagen del usuario si está disponible
- **Soporte SVG**: Optimizado para avatares vectoriales

## 🛠️ Componentes Implementados

### 1. **AvatarHelper** (`lib/base/helper/avatar_helper.dart`)

Clase utilitaria para generar URLs de avatares DiceBear:

```dart
// Generar avatar desde email
String avatarUrl = AvatarHelper.generateAvatarFromEmail('user@example.com');

// Generar avatar con parámetros personalizados
String avatarUrl = AvatarHelper.generateAvatarUrl(
  seed: 'unique-identifier',
  size: 200,
  backgroundColor: 'f0f0f0',
  scale: 100,
  radius: 50,
);

// Obtener avatar con fallback inteligente
String avatarUrl = AvatarHelper.getAvatarUrl(
  userImageUrl: user.avatar,  // Imagen del usuario (opcional)
  email: user.email,          // Email para generar avatar
  userId: user.id,           // ID como alternativa
  fullName: user.fullName,   // Nombre como última opción
  size: 120,
);
```

### 2. **DiceBearAvatarWidget** (`lib/ui/widgets/avatar/dicebear_avatar_widget.dart`)

Widget reutilizable para mostrar avatares:

```dart
// Avatar simple
DiceBearAvatarWidget(
  email: 'user@example.com',
  size: 120,
)

// Avatar con botón de edición
DiceBearAvatarWidget(
  userImageUrl: user.avatar,
  email: user.email,
  size: 120,
  showEditIcon: true,
  onEditTap: () => _editAvatar(),
)
```

### 3. **CommonImageView Mejorado**

Actualizado para manejar tanto imágenes regulares como SVGs de DiceBear:

- Detección automática de URLs SVG
- Renderizado optimizado para avatares vectoriales
- Placeholder consistente

## 📱 Uso en ProfilePage

El `ProfileAvatarWidget` ahora usa automáticamente avatares DiceBear:

```dart
CommonImageView.circle(
  imageUrl: AvatarHelper.getAvatarUrl(
    userImageUrl: user.avatar,
    email: user.email,
    userId: user.id,
    fullName: user.fullName,
    size: 120,
  ),
  size: 120,
),
```

## 🎯 Casos de Uso

### Usuario sin imagen
- Se genera avatar automáticamente desde email
- Avatar consistente en toda la aplicación
- Estilo profesional y minimalista

### Usuario con imagen personalizada
- Se usa la imagen del usuario
- Fallback a DiceBear si la imagen falla

### Usuario con datos limitados
- Prioridad: email → userId → fullName → 'default-user'
- Siempre se genera un avatar

## 🔧 Configuración

### Parámetros Disponibles

```dart
AvatarHelper.generateAvatarUrl(
  seed: 'unique-identifier',     // Identificador único
  size: 200,                    // Tamaño en píxeles
  backgroundColor: 'f0f0f0',    // Color de fondo (hex sin #)
  scale: 100,                   // Escala del avatar (50-200)
  radius: 50,                   // Esquinas redondeadas
);
```

### Estilo Notionist Neutral

- **Características**: Minimalista, profesional, neutro
- **Colores**: Tonos suaves y apagados
- **Formas**: Geometrías simples
- **Ideal para**: Aplicaciones corporativas y educativas

## 🌐 API DiceBear

La implementación usa la API pública de DiceBear:
- **Base URL**: `https://api.dicebear.com/7.x/notionists-neutral/svg`
- **Parámetros**: seed, size, scale, radius, backgroundColor
- **Formato**: SVG (vectorial, escalable)

## 📊 Ejemplos de URLs Generadas

```
https://api.dicebear.com/7.x/notionists-neutral/svg?seed=a1b2c3d4&size=120&backgroundColor=f0f0f0&scale=100&radius=50
```

## 🔄 Flujo de Funcionamiento

1. **Verificar imagen del usuario**
   - Si existe y es válida → usar imagen del usuario
   - Si no existe o falla → continuar

2. **Generar avatar DiceBear**
   - Crear hash del identificador (email/ID/nombre)
   - Construir URL con parámetros
   - Retornar URL del avatar

3. **Renderizar avatar**
   - CommonImageView detecta si es SVG
   - Renderiza con SvgPicture o CachedNetworkImage
   - Muestra placeholder mientras carga

## ✅ Beneficios

- **Experiencia consistente**: Todos los usuarios tienen avatar
- **Rendimiento**: SVGs ligeros y escalables
- **Profesionalismo**: Estilo apropiado para e-learning
- **Mantenimiento**: No requiere almacenamiento de imágenes
- **Personalización**: Cada usuario tiene avatar único pero consistente

## 🚀 Próximos Pasos

1. **Implementar en otras pantallas**: Home, cursos, comentarios
2. **Personalización**: Permitir que usuarios elijan colores
3. **Caché local**: Almacenar avatares generados
4. **Estilos adicionales**: Implementar otros estilos de DiceBear

---

**Implementado por**: Assistant  
**Fecha**: $(date)  
**Versión**: 1.0.0

