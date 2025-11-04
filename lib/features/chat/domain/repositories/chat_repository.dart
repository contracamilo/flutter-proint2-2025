import '../entities/message_entity.dart';

/// Interfaz del repositorio de chat
abstract class ChatRepository {
  /// Envía un mensaje y obtiene respuesta del asistente
  Future<MessageEntity> sendMessage(String message);
  
  /// Obtiene el historial de mensajes
  Future<List<MessageEntity>> getHistory();
  
  /// Limpia el historial de mensajes
  Future<void> clearHistory();
}
