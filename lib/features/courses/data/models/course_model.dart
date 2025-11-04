import '../../domain/entities/course_entity.dart';

class CourseModel extends CourseEntity {
  const CourseModel({
    required String id,
    required String title,
    required String code,
    required String professor,
    required double progress,
    required double grade,
    required double onTimeDeliveries,
    required int pendingTasks,
    String? template,
    required CourseCategory category,
    List<CourseTag> tags = const [],
    int notificationCount = 0,
    int colorIndex = 0,
  }) : super(
    id: id,
    title: title,
    code: code,
    professor: professor,
    progress: progress,
    grade: grade,
    onTimeDeliveries: onTimeDeliveries,
    pendingTasks: pendingTasks,
    template: template,
    category: category,
    tags: tags,
    notificationCount: notificationCount,
    colorIndex: colorIndex,
  );

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: (json['id'] ?? '') as String,
      title: (json['title'] ?? '') as String,
      code: (json['code'] ?? '') as String,
      professor: (json['professor'] ?? '') as String,
      progress: ((json['progress'] ?? 0.0) as num).toDouble(),
      grade: ((json['grade'] ?? 0.0) as num).toDouble(),
      onTimeDeliveries: ((json['onTimeDeliveries'] ?? 0.0) as num).toDouble(),
      pendingTasks: (json['pendingTasks'] ?? 0) as int,
      template: json['template'] as String?,
      category: _parseCourseCategory((json['category'] ?? 'otros') as String),
      tags: _parseCourseTags((json['tags'] ?? <dynamic>[]) as List<dynamic>),
      notificationCount: (json['notificationCount'] ?? 0) as int,
      colorIndex: (json['colorIndex'] ?? 0) as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'code': code,
      'professor': professor,
      'progress': progress,
      'grade': grade,
      'onTimeDeliveries': onTimeDeliveries,
      'pendingTasks': pendingTasks,
      'template': template,
      'category': category.toString(),
      'tags': tags.map((e) => e.toString()).toList(),
      'notificationCount': notificationCount,
      'colorIndex': colorIndex,
    };
  }

  CourseEntity toEntity() {
    return CourseEntity(
      id: id,
      title: title,
      code: code,
      professor: professor,
      progress: progress,
      grade: grade,
      onTimeDeliveries: onTimeDeliveries,
      pendingTasks: pendingTasks,
      template: template,
      category: category,
      tags: tags,
      notificationCount: notificationCount,
      colorIndex: colorIndex,
    );
  }

  static CourseCategory _parseCourseCategory(String value) {
    switch (value) {
      case 'CourseCategory.matematicas':
        return CourseCategory.matematicas;
      case 'CourseCategory.programacion':
        return CourseCategory.programacion;
      case 'CourseCategory.fisica':
        return CourseCategory.fisica;
      case 'CourseCategory.humanidades':
        return CourseCategory.humanidades;
      case 'CourseCategory.ciencias':
        return CourseCategory.ciencias;
      default:
        return CourseCategory.otros;
    }
  }

  static List<CourseTag> _parseCourseTags(List<dynamic> tags) {
    return tags.map((tag) {
      switch (tag) {
        case 'CourseTag.entregasPendientes':
          return CourseTag.entregasPendientes;
        case 'CourseTag.alDia':
          return CourseTag.alDia;
        case 'CourseTag.plantilla':
          return CourseTag.plantilla;
        case 'CourseTag.metodo':
          return CourseTag.metodo;
        default:
          return CourseTag.otros;
      }
    }).toList();
  }
}
