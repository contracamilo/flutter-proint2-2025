import '../../domain/entities/message_entity.dart';

/// Modelo de mensaje que extiende la entidad
class MessageModel extends MessageEntity {
  const MessageModel({
    required super.id,
    required super.content,
    required super.isUser,
    required super.timestamp,
    super.status,
  });

  /// Crea un MessageModel desde JSON
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'] as String,
      content: json['content'] as String,
      isUser: json['isUser'] as bool,
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: MessageStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => MessageStatus.sent,
      ),
    );
  }

  /// Convierte el MessageModel a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'isUser': isUser,
      'timestamp': timestamp.toIso8601String(),
      'status': status.name,
    };
  }

  /// Crea un MessageModel desde una entidad
  factory MessageModel.fromEntity(MessageEntity entity) {
    return MessageModel(
      id: entity.id,
      content: entity.content,
      isUser: entity.isUser,
      timestamp: entity.timestamp,
      status: entity.status,
    );
  }
}
