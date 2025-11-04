import 'package:equatable/equatable.dart';

/// Tipos de eventos en el horario
enum ScheduleEventType {
  clase,      // Clase regular
  examen,     // Examen
  tarea,      // Tarea
  evento      // Evento general
}

/// Entidad que representa un evento en el horario
class ScheduleEntity extends Equatable {
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

  const ScheduleEntity({
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

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        startTime,
        endTime,
        location,
        professor,
        type,
        room,
        building,
        colorIndex,
      ];
}

/// Entidad que agrupa eventos por día
class DayScheduleEntity extends Equatable {
  final DateTime date;
  final List<ScheduleEntity> events;

  const DayScheduleEntity({
    required this.date,
    required this.events,
  });

  @override
  List<Object?> get props => [date, events];
}
