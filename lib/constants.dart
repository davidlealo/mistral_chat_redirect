import 'package:flutter_dotenv/flutter_dotenv.dart';

final String apiKey = dotenv.env['MISTRAL_API_KEY'] ?? ''; // Clave API cargada desde .env
const String apiUrl = 'https://api.mistral.ai/v1/chat/completions'; // URL fija
