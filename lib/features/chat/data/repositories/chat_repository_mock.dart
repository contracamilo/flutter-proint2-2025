import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../domain/entities/message_entity.dart';
import '../../domain/repositories/chat_repository.dart';
import '../models/message_model.dart';

/// Implementación mock del repositorio de chat con respuestas inteligentes
class ChatRepositoryMock implements ChatRepository {
  static const String _historyKey = 'chat_history';
  final List<MessageEntity> _messages = [];

  @override
  Future<MessageEntity> sendMessage(String message) async {
    // Guardar el mensaje del usuario
    final userMessage = MessageEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: message,
      isUser: true,
      timestamp: DateTime.now(),
      status: MessageStatus.sent,
    );
    _messages.add(userMessage);
    
    // Simular delay de red
    await Future<void>.delayed(const Duration(milliseconds: 800));

    // Generar respuesta basada en palabras clave
    final response = _generateResponse(message.toLowerCase());

    final responseMessage = MessageEntity(
      id: (DateTime.now().millisecondsSinceEpoch + 1).toString(),
      content: response,
      isUser: false,
      timestamp: DateTime.now(),
      status: MessageStatus.sent,
    );

    _messages.add(responseMessage);
    await _saveHistory();

    return responseMessage;
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

  String _generateResponse(String message) {
    // Respuestas contextuales basadas en palabras clave
    if (message.contains('horario') || message.contains('clase')) {
      return '¡Con gusto te ayudo con tu horario! 📅 Puedes ver tu horario completo en la pestaña "Horario". Si necesitas agregar recordatorios para tus clases, puedo ayudarte con eso.';
    }

    if (message.contains('tarea') || message.contains('proyecto')) {
      return 'Para organizar tus tareas te recomiendo:\n\n1. Prioriza por fecha de entrega\n2. Divide proyectos grandes en tareas pequeñas\n3. Usa la técnica Pomodoro (25 min trabajo, 5 min descanso)\n\n¿Necesitas ayuda con alguna tarea específica?';
    }

    if (message.contains('recordatorio') || message.contains('recordar')) {
      return '¡Perfecto! Puedo ayudarte a crear recordatorios. 🔔 ¿Qué necesitas recordar? Por ejemplo: "Recordatorio para entregar proyecto de cálculo el viernes"';
    }

    if (message.contains('biblioteca') || message.contains('libro')) {
      return 'La biblioteca de la Universidad de La Salle ofrece:\n\n📚 Préstamo de libros físicos y digitales\n💻 Bases de datos académicas\n📖 Salas de estudio\n🤝 Asesoría bibliográfica\n\n¿Buscas algún libro en particular?';
    }

    if (message.contains('estudio') || message.contains('estudiar')) {
      return 'Aquí van algunas técnicas de estudio efectivas:\n\n✨ Técnica Feynman: Explica el tema como si enseñaras\n🎯 Método Cornell: Divide tus notas en secciones\n🔄 Repaso espaciado: Revisa el material en intervalos\n🧠 Mapas mentales: Visualiza conceptos\n\n¿Sobre qué tema necesitas estudiar?';
    }

    if (message.contains('calculo') || message.contains('matemática') || message.contains('matemáticas')) {
      return '¡El cálculo puede ser desafiante pero fascinante! 📐 Te recomiendo:\n\n• Practicar muchos ejercicios\n• Ver video-tutoriales de Khan Academy\n• Formar grupos de estudio\n• Asistir a tutorías\n\n¿Hay algún tema específico de cálculo con el que necesites ayuda?';
    }

    if (message.contains('hola') || message.contains('buenos') || message.contains('qué tal')) {
      return '¡Hola! 👋 Soy JuanIA, tu asistente académico. Puedo ayudarte con dudas académicas, recursos de la biblioteca, organización de tareas y más. ¿En qué puedo ayudarte hoy?';
    }

    if (message.contains('gracias')) {
      return '¡De nada! 😊 Estoy aquí para ayudarte cuando lo necesites. ¿Hay algo más en lo que pueda asistirte?';
    }

    // Respuesta por defecto
    return 'Interesante pregunta. Aunque soy un asistente en modo demostración, en la versión completa podría ayudarte con:\n\n📚 Dudas académicas\n📅 Gestión de horarios\n✅ Organización de tareas\n💡 Técnicas de estudio\n🔍 Recursos de biblioteca\n\n¿Te gustaría saber más sobre alguno de estos temas?';
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
