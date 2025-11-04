import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Data source para comunicación con OpenAI API
class OpenAIDataSource {
  final Dio _dio;
  final String? _apiKey;

  OpenAIDataSource({Dio? dio, String? apiKey})
      : _dio = dio ?? Dio(),
        _apiKey = apiKey;

  /// Envía un mensaje a OpenAI y obtiene la respuesta
  Future<String> sendMessage(String message, List<Map<String, String>> conversationHistory) async {
    final apiKey = _apiKey ?? dotenv.env['OPENAI_API_KEY'] ?? '';
    
    if (apiKey.isEmpty) {
      throw Exception('OpenAI API key not configured in .env file');
    }

    try {
      final response = await _dio.post<Map<String, dynamic>>(
        'https://api.openai.com/v1/chat/completions',
        options: Options(
          headers: {
            'Authorization': 'Bearer $apiKey',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'model': 'gpt-3.5-turbo', // Modelo más económico
          'messages': [
            {
              'role': 'system',
              'content': '''Eres JuanIA, el asistente académico inteligente de la Universidad de La Salle.
Tu objetivo es ayudar a estudiantes universitarios con:
- Dudas académicas y conceptos
- Organización de tareas y horarios
- Técnicas de estudio
- Recursos de la biblioteca
- Información general de la universidad

Responde de forma amigable, concisa y útil. Usa un tono cercano pero profesional.'''
            },
            ...conversationHistory,
            {
              'role': 'user',
              'content': message,
            },
          ],
          'max_tokens': 500, // Limitar tokens para controlar costos
          'temperature': 0.7,
        },
      );

      if (response.data == null) {
        throw Exception('Empty response from OpenAI');
      }

      final choices = response.data!['choices'] as List<dynamic>?;
      if (choices == null || choices.isEmpty) {
        throw Exception('No response choices from OpenAI');
      }

      final messageContent = choices[0]['message']['content'] as String?;
      if (messageContent == null) {
        throw Exception('No message content in OpenAI response');
      }

      return messageContent.trim();
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Invalid OpenAI API key');
      } else if (e.response?.statusCode == 429) {
        throw Exception('OpenAI API rate limit exceeded');
      } else if (e.response?.statusCode == 500) {
        throw Exception('OpenAI service error');
      }
      throw Exception('Failed to get OpenAI response: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
