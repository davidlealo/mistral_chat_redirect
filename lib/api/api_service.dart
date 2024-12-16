import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  Future<String> sendMessage(String message) async {
    final String apiKey = dotenv.env['MISTRAL_API_KEY'] ?? ''; // Carga la clave API directamente
    const String apiUrl = 'https://api.mistral.ai/v1/chat/completions';

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final body = jsonEncode({
      "messages": [
        {"role": "user", "content": message}
      ]
    });

    print('Headers: $headers');
    print('Body: $body');

    try {
      final response = await http.post(Uri.parse(apiUrl), headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        print('Error Response (${response.statusCode}): ${response.body}');
        throw Exception('Error al comunicarse con la API: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
