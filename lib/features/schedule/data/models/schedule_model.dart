import '../../domain/entities/schedule_entity.dart';

/// Modelo de datos para un evento en el horario
class ScheduleModel {
  final String id;
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final String location;
  final String professor;
  final ScheduleEventType type;
  final String? room;
  final String? building;
  final int colorIndex;

  const ScheduleModel({
    required this.id,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.professor,
    required this.type,
    this.room,
    this.building,
    this.colorIndex = 0,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      location: json['location'] as String,
      professor: json['professor'] as String,
      type: ScheduleEventType.values[json['type'] as int? ?? 0],
      room: json['room'] as String?,
      building: json['building'] as String?,
      colorIndex: json['colorIndex'] as int? ?? 0,
    );
  }

  factory ScheduleModel.fromEntity(ScheduleEntity entity) {
    return ScheduleModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      startTime: entity.startTime,
      endTime: entity.endTime,
      location: entity.location,
      professor: entity.professor,
      type: entity.type,
      room: entity.room,
      building: entity.building,
      colorIndex: entity.colorIndex,
    );
  }

  ScheduleEntity toEntity() {
    return ScheduleEntity(
      id: id,
      title: title,
      description: description,
      startTime: startTime,
      endTime: endTime,
      location: location,
      professor: professor,
      type: type,
      room: room,
      building: building,
      colorIndex: colorIndex,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'location': location,
      'professor': professor,
      'type': type.index,
      'room': room,
      'building': building,
      'colorIndex': colorIndex,
    };
  }
}
