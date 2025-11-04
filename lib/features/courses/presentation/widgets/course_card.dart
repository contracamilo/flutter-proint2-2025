import 'package:flutter/material.dart';
import '../../domain/entities/course_entity.dart';

class CourseCard extends StatelessWidget {
  final CourseEntity course;
  final VoidCallback? onTap;

  const CourseCard({
    Key? key,
    required this.course,
    this.onTap,
  }) : super(key: key);

  Color _getCategoryColor() {
    switch (course.category) {
      case CourseCategory.matematicas:
        return const Color(0xFF2196F3);
      case CourseCategory.programacion:
        return const Color(0xFF00BCD4);
      case CourseCategory.fisica:
        return const Color(0xFF9C27B0);
      case CourseCategory.humanidades:
        return const Color(0xFFF57C00);
      case CourseCategory.ciencias:
        return const Color(0xFF4CAF50);
      case CourseCategory.otros:
        return const Color(0xFF607D8B);
    }
  }

  String _getTagLabel(CourseTag tag) {
    switch (tag) {
      case CourseTag.entregasPendientes:
        return 'Entregas Pendientes';
      case CourseTag.alDia:
        return 'Al día';
      case CourseTag.plantilla:
        return 'Plantilla';
      case CourseTag.metodo:
        return 'Al día';
      case CourseTag.otros:
        return 'Otro';
    }
  }

  Color _getTagColor(CourseTag tag) {
    switch (tag) {
      case CourseTag.entregasPendientes:
        return const Color(0xFFDC2626);
      case CourseTag.alDia:
        return const Color(0xFF16A34A);
      case CourseTag.plantilla:
        return const Color(0xFF7C3AED);
      case CourseTag.metodo:
        return const Color(0xFF1F2937);
      case CourseTag.otros:
        return const Color(0xFF6B7280);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border(
            top: BorderSide(
              color: _getCategoryColor(),
              width: 8,
            ),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with title and notification badge
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F2937),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${course.code} • ${course.professor}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF6B7280),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  if (course.notificationCount > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDC2626),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${course.notificationCount}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),

              // Progress bar
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Progreso del curso',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      Text(
                        '${course.progress.toStringAsFixed(0)}%',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: course.progress / 100,
                      minHeight: 6,
                      backgroundColor: const Color(0xFFE5E7EB),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _getCategoryColor(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Stats row: On-time deliveries and Grade
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          size: 18,
                          color: Color(0xFF16A34A),
                        ),
                        const SizedBox(width: 6),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Entregas a tiempo',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                            Text(
                              '${course.onTimeDeliveries.toStringAsFixed(0)}%',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.school,
                          size: 18,
                          color: Color(0xFF0EA5E9),
                        ),
                        const SizedBox(width: 6),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Calificación',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                            Text(
                              course.grade.toStringAsFixed(1),
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F2937),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Template and tags
              if (course.template != null)
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.description,
                        size: 16,
                        color: Color(0xFF2563EB),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          'Template: ${course.template}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF2563EB),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),

              // Tags row
              if (course.tags.isNotEmpty)
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ...course.tags.map((tag) {
                      if (tag == CourseTag.entregasPendientes) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEE2E2),
                            border: Border.all(
                              color: const Color(0xFFFCA5A5),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.schedule,
                                size: 14,
                                color: Color(0xFFDC2626),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${course.pendingTasks} tareas pendientes',
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFFDC2626),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _getTagColor(tag),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          _getTagLabel(tag),
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                    if (course.tags.any((t) =>
                            t == CourseTag.entregasPendientes) &&
                        course.tags.any((t) => t == CourseTag.plantilla))
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1F2937),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'Programación',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
