import 'package:crypto/crypto.dart';
import 'dart:convert';

class AvatarHelper {
  static const String _diceBearBaseUrl =
      'https://api.dicebear.com/7.x/notionists-neutral/svg';

  /// Genera una URL de avatar de DiceBear usando el estilo "notionists-neutral"
  ///
  /// [seed] - Identificador único para generar el avatar (email, id, nombre, etc.)
  /// [size] - Tamaño del avatar en píxeles (opcional, por defecto 200)
  /// [backgroundColor] - Color de fondo en formato hexadecimal sin # (opcional)
  /// [scale] - Escala del avatar (opcional, por defecto 100)
  /// [radius] - Radio de las esquinas redondeadas (opcional, por defecto 0)
  static String generateAvatarUrl({
    required String seed,
    int size = 200,
    String? backgroundColor,
    int scale = 100,
    int radius = 0,
  }) {
    // Crear un hash del seed para asegurar consistencia
    final bytes = utf8.encode(seed);
    final digest = md5.convert(bytes);
    final hashedSeed = digest.toString();

    // Construir la URL con parámetros
    final uri = Uri.parse(_diceBearBaseUrl).replace(queryParameters: {
      'seed': hashedSeed,
      'size': size.toString(),
      'scale': scale.toString(),
      'radius': radius.toString(),
      if (backgroundColor != null) 'backgroundColor': backgroundColor,
    });

    return uri.toString();
  }

  /// Genera una URL de avatar basada en el email del usuario
  static String generateAvatarFromEmail(String email, {int size = 200}) {
    return generateAvatarUrl(
      seed: email,
      size: size,
      backgroundColor: 'f0f0f0', // Color gris claro
      scale: 100,
      radius: 50, // Esquinas redondeadas para círculo
    );
  }

  /// Genera una URL de avatar basada en el ID del usuario
  static String generateAvatarFromId(String userId, {int size = 200}) {
    return generateAvatarUrl(
      seed: userId,
      size: size,
      backgroundColor: 'f0f0f0',
      scale: 100,
      radius: 50,
    );
  }

  /// Genera una URL de avatar basada en el nombre completo del usuario
  static String generateAvatarFromName(String fullName, {int size = 200}) {
    return generateAvatarUrl(
      seed: fullName,
      size: size,
      backgroundColor: 'f0f0f0',
      scale: 100,
      radius: 50,
    );
  }

  /// Verifica si una URL es una imagen válida o está vacía
  static bool isValidImageUrl(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) return false;

    // Verificar que sea una URL válida
    try {
      final uri = Uri.parse(imageUrl);
      return uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https');
    } catch (e) {
      return false;
    }
  }

  /// Obtiene la URL del avatar, usando DiceBear como fallback si no hay imagen
  static String getAvatarUrl({
    String? userImageUrl,
    String? email,
    String? userId,
    String? fullName,
    int size = 200,
  }) {
    // Si hay una imagen válida del usuario, usarla
    if (isValidImageUrl(userImageUrl)) {
      return userImageUrl!;
    }

    // Generar avatar de DiceBear usando el mejor identificador disponible
    if (email != null && email.isNotEmpty) {
      return generateAvatarFromEmail(email, size: size);
    } else if (userId != null && userId.isNotEmpty) {
      return generateAvatarFromId(userId, size: size);
    } else if (fullName != null && fullName.isNotEmpty) {
      return generateAvatarFromName(fullName, size: size);
    }

    // Fallback final con un seed genérico
    return generateAvatarUrl(seed: 'default-user', size: size);
  }
}

