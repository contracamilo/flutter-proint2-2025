import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../domain/entities/message_entity.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/openai_datasource.dart';
import '../models/message_model.dart';

/// Implementación del repositorio de chat usando OpenAI
class ChatRepositoryOpenAI implements ChatRepository {
  static const String _historyKey = 'chat_history_openai';
  final OpenAIDataSource _dataSource;
  final List<MessageEntity> _messages = [];

  ChatRepositoryOpenAI({OpenAIDataSource? dataSource})
      : _dataSource = dataSource ?? OpenAIDataSource();

  @override
  Future<MessageEntity> sendMessage(String message) async {
    try {
      // Guardar el mensaje del usuario
      final userMessage = MessageEntity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        content: message,
        isUser: true,
        timestamp: DateTime.now(),
        status: MessageStatus.sent,
      );
      _messages.add(userMessage);
      
      // Construir historial de conversación para contexto
      final conversationHistory = _messages
          .map((msg) => {
                'role': msg.isUser ? 'user' : 'assistant',
                'content': msg.content,
              })
          .toList();

      // Obtener respuesta de OpenAI
      final responseContent = await _dataSource.sendMessage(
        message,
        conversationHistory,
      );

      final responseMessage = MessageEntity(
        id: (DateTime.now().millisecondsSinceEpoch + 1).toString(),
        content: responseContent,
        isUser: false,
        timestamp: DateTime.now(),
        status: MessageStatus.sent,
      );

      _messages.add(responseMessage);
      await _saveHistory();

      return responseMessage;
    } catch (e) {
      // En caso de error, devolver mensaje de error
      final errorMessage = MessageEntity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        content: 'Lo siento, hubo un error al procesar tu mensaje. Por favor, intenta de nuevo.',
        isUser: false,
        timestamp: DateTime.now(),
        status: MessageStatus.error,
      );

      return errorMessage;
    }
  }

  @override
  Future<List<MessageEntity>> getHistory() async {
    if (_messages.isEmpty) {
      await _loadHistory();
    }
    return List.unmodifiable(_messages);
  }

  @override
  Future<void> clearHistory() async {
    _messages.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_historyKey);
  }

  Future<void> _saveHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final messagesJson = _messages
          .map((msg) => MessageModel.fromEntity(msg).toJson())
          .toList();
      await prefs.setString(_historyKey, json.encode(messagesJson));
    } catch (e) {
      // Ignorar errores de guardado
    }
  }

  Future<void> _loadHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final historyString = prefs.getString(_historyKey);
      if (historyString != null) {
        final messagesJson = json.decode(historyString) as List<dynamic>;
        _messages.addAll(
          messagesJson.map((json) => MessageModel.fromJson(json as Map<String, dynamic>)),
        );
      }
    } catch (e) {
      // Ignorar errores de carga
    }
  }
}
