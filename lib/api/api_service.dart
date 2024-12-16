import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart';

class ApiService {
  Future<String> sendMessage(String message) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final body = jsonEncode({
      "messages": [
        {"role": "user", "content": message}
      ]
    });

    // Depuración: Imprime los valores antes de enviar la solicitud
    print('Headers: $headers');
    print('Body: $body');

    try {
      final response = await http.post(Uri.parse(apiUrl), headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        // Depuración: Imprime la respuesta de error
        print('Error Response (${response.statusCode}): ${response.body}');
        throw Exception('Error al comunicarse con la API: ${response.statusCode}');
      }
    } catch (e) {
      // Depuración: Muestra cualquier otro error
      print('Error: $e');
      rethrow;
    }
  }
}
