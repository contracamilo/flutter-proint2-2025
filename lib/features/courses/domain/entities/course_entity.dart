import 'package:equatable/equatable.dart';

enum CourseCategory {
  matematicas,
  programacion,
  fisica,
  humanidades,
  ciencias,
  otros,
}

enum CourseTag {
  entregasPendientes,
  alDia,
  plantilla,
  metodo,
  otros,
}

class CourseEntity extends Equatable {
  final String id;
  final String title;
  final String code;
  final String professor;
  final double progress; // 0.0 - 100.0
  final double grade; // 0.0 - 5.0
  final double onTimeDeliveries; // 0.0 - 100.0
  final int pendingTasks;
  final String? template;
  final CourseCategory category;
  final List<CourseTag> tags;
  final int notificationCount; // Badge count
  final int colorIndex; // For color coding

  const CourseEntity({
    required this.id,
    required this.title,
    required this.code,
    required this.professor,
    required this.progress,
    required this.grade,
    required this.onTimeDeliveries,
    required this.pendingTasks,
    this.template,
    required this.category,
    this.tags = const [],
    this.notificationCount = 0,
    this.colorIndex = 0,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        code,
        professor,
        progress,
        grade,
        onTimeDeliveries,
        pendingTasks,
        template,
        category,
        tags,
        notificationCount,
        colorIndex,
      ];
}
