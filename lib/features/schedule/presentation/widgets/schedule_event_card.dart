import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/schedule_entity.dart';

/// Widget que muestra un evento en el horario
class ScheduleEventCard extends StatelessWidget {
  final ScheduleEntity event;
  final VoidCallback? onTap;

  const ScheduleEventCard({
    super.key,
    required this.event,
    this.onTap,
  });

  Color _getEventColor() {
    final colors = [
      const Color(0xFF2563EB), // Azul
      const Color(0xFF9333EA), // Púrpura
      const Color(0xFFDC2626), // Rojo
      const Color(0xFF16A34A), // Verde
      const Color(0xFFF59E0B), // Naranja
      const Color(0xFF0891B2), // Cian
    ];
    return colors[event.colorIndex % colors.length];
  }

  String _getEventTypeLabel() {
    switch (event.type) {
      case ScheduleEventType.clase:
        return 'Clase';
      case ScheduleEventType.examen:
        return 'Examen';
      case ScheduleEventType.tarea:
        return 'Tarea';
      case ScheduleEventType.evento:
        return 'Evento';
    }
  }

  Color _getEventTypeBgColor() {
    switch (event.type) {
      case ScheduleEventType.clase:
        return Colors.blue.shade100;
      case ScheduleEventType.examen:
        return Colors.red.shade100;
      case ScheduleEventType.tarea:
        return Colors.yellow.shade100;
      case ScheduleEventType.evento:
        return Colors.green.shade100;
    }
  }

  Color _getEventTypeTextColor() {
    switch (event.type) {
      case ScheduleEventType.clase:
        return Colors.blue.shade700;
      case ScheduleEventType.examen:
        return Colors.red.shade700;
      case ScheduleEventType.tarea:
        return Colors.yellow.shade700;
      case ScheduleEventType.evento:
        return Colors.green.shade700;
    }
  }

  @override
  Widget build(BuildContext context) {
    final startTime = DateFormat('HH:mm').format(event.startTime);
    final endTime = DateFormat('HH:mm').format(event.endTime);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 4,
              decoration: BoxDecoration(
                color: _getEventColor(),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          event.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _getEventTypeBgColor(),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          _getEventTypeLabel(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: _getEventTypeTextColor(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        '$startTime - $endTime',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          event.location,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.person, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          event.professor,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
