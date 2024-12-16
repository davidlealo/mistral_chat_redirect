import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  Future<String> sendMessage(String message) async {
    final String apiKey =
        dotenv.env['MISTRAL_API_KEY'] ?? ''; // Carga la clave API directamente
    const String apiUrl = 'https://api.mistral.ai/v1/chat/completions';

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final body = jsonEncode({
  "model": "mistral-large-latest",
  "messages": [
    {
      "role": "user",
      "content": "Elige una de las siguientes opciones según mi mensaje: \n"
          "1. ADMINISTRADOR INTELIGENTE DE COLEGIOS\n"
          "2. DESARROLLO PROYECTOS ABP\n"
          "3. EVENTO ABP\n\n"
          "Responde únicamente con la opción más adecuada: 'ADMINISTRADOR INTELIGENTE DE COLEGIOS', "
          "'DESARROLLO PROYECTOS ABP' o 'EVENTO ABP'.\n"
          "Mi mensaje: \"$message\""
    }
  ]
});

    debugPrint('Headers: $headers');
    debugPrint('Body: $body');

    try {
      final response =
          await http.post(Uri.parse(apiUrl), headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        debugPrint('Error Response (${response.statusCode}): ${response.body}');
        throw Exception(
            'Error al comunicarse con la API: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
      rethrow;
    }
  }
}
