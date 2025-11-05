import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/schedule_entity.dart';
import '../widgets/horizontal_date_picker.dart';
import '../widgets/schedule_event_card.dart';
import '../../../../core/widgets/navigation/app_drawer.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late DateTime _selectedDate;
  int _selectedTabIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  /// Datos de ejemplo del horario
  List<ScheduleEntity> _getEventsForDate(DateTime date) {
    final dayOfWeek = date.weekday; // 1 = Lunes, 7 = Domingo

    // Datos de ejemplo para diferentes días
    if (dayOfWeek == 1) { // Lunes
      return [
        ScheduleEntity(
          id: '1',
          title: 'Cálculo Diferencial e Integral',
          description: 'Clase de cálculo',
          startTime: DateTime(date.year, date.month, date.day, 10, 0),
          endTime: DateTime(date.year, date.month, date.day, 11, 30),
          location: 'Bloque C - Aula 305',
          professor: 'Dr. López',
          type: ScheduleEventType.clase,
          colorIndex: 0,
        ),
        ScheduleEntity(
          id: '2',
          title: 'Programación Orientada a Objetos',
          description: 'Clase de programación',
          startTime: DateTime(date.year, date.month, date.day, 13, 0),
          endTime: DateTime(date.year, date.month, date.day, 14, 30),
          location: 'Bloque A - Lab 201',
          professor: 'Dra. Martínez',
          type: ScheduleEventType.clase,
          colorIndex: 1,
        ),
      ];
    } else if (dayOfWeek == 2) { // Martes
      return [
        ScheduleEntity(
          id: '3',
          title: 'Examen Parcial - Física II',
          description: 'Examen parcial',
          startTime: DateTime(date.year, date.month, date.day, 8, 0),
          endTime: DateTime(date.year, date.month, date.day, 10, 0),
          location: 'Bloque B - Aula 102',
          professor: 'Dr. Ramírez',
          type: ScheduleEventType.examen,
          colorIndex: 2,
        ),
        ScheduleEntity(
          id: '4',
          title: 'Estructuras de Datos',
          description: 'Clase de estructuras',
          startTime: DateTime(date.year, date.month, date.day, 11, 0),
          endTime: DateTime(date.year, date.month, date.day, 12, 30),
          location: 'Bloque C - Aula 401',
          professor: 'Ing. García',
          type: ScheduleEventType.clase,
          colorIndex: 3,
        ),
      ];
    } else if (dayOfWeek == 3) { // Miércoles
      return [
        ScheduleEntity(
          id: '5',
          title: 'Métodos Numéricos',
          description: 'Clase de métodos',
          startTime: DateTime(date.year, date.month, date.day, 9, 0),
          endTime: DateTime(date.year, date.month, date.day, 10, 30),
          location: 'Bloque D - Lab 102',
          professor: 'Dra. López',
          type: ScheduleEventType.clase,
          colorIndex: 4,
        ),
      ];
    } else if (dayOfWeek == 4) { // Jueves
      return [
        ScheduleEntity(
          id: '6',
          title: 'Entrega Proyecto Final',
          description: 'Proyecto de semestre',
          startTime: DateTime(date.year, date.month, date.day, 14, 0),
          endTime: DateTime(date.year, date.month, date.day, 16, 0),
          location: 'Bloque A - Aula 301',
          professor: 'Dr. Martín',
          type: ScheduleEventType.evento,
          colorIndex: 3,
        ),
      ];
    } else if (dayOfWeek == 5) { // Viernes
      return [
        ScheduleEntity(
          id: '7',
          title: 'Seminario de Investigación',
          description: 'Seminario académico',
          startTime: DateTime(date.year, date.month, date.day, 10, 0),
          endTime: DateTime(date.year, date.month, date.day, 12, 0),
          location: 'Auditorio Principal',
          professor: 'Dra. González',
          type: ScheduleEventType.evento,
          colorIndex: 5,
        ),
      ];
    }
    return [];
  }

  List<ScheduleEntity> _getFilteredEvents() {
    final allEvents = _getEventsForDate(_selectedDate);

    switch (_selectedTabIndex) {
      case 0: // Todos
        return allEvents;
      case 1: // Clases
        return allEvents
            .where((e) => e.type == ScheduleEventType.clase)
            .toList();
      case 2: // Exámenes
        return allEvents
            .where((e) => e.type == ScheduleEventType.examen)
            .toList();
      case 3: // Eventos
        return allEvents
            .where((e) => e.type == ScheduleEventType.evento)
            .toList();
      default:
        return allEvents;
    }
  }

  @override
  Widget build(BuildContext context) {
    final events = _getFilteredEvents();

    return Scaffold(
      key: _scaffoldKey,
      drawer: const AppDrawer(),
      body: Column(
        children: [
          // Header con calendario
          Container(
            color: const Color(0xFF1E3A8A),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Botón de menú
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 8),
                    child: IconButton(
                      onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Date Picker
                  HorizontalDatePicker(
                    selectedDate: _selectedDate,
                    onDateChanged: (date) {
                      setState(() => _selectedDate = date);
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          // Tabs
          Container(
            color: const Color(0xFF1E3A8A),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildTab('Todos', 0),
                  const SizedBox(width: 12),
                  _buildTab('Clases', 1),
                  const SizedBox(width: 12),
                  _buildTab('Exámenes', 2),
                  const SizedBox(width: 12),
                  _buildTab('Eventos', 3),
                ],
              ),
            ),
          ),
          // Lista de eventos
          Expanded(
            child: events.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 64,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No hay eventos para este día',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return ScheduleEventCard(
                        event: events[index],
                        onTap: () {
                          _showEventDetails(context, events[index]);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    final isSelected = _selectedTabIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _selectedTabIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF3B82F6) : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  void _showEventDetails(BuildContext context, ScheduleEntity event) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    event.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => context.pop(),
                  child: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _detailRow(Icons.access_time, 'Hora',
                '${event.startTime.hour}:${event.startTime.minute.toString().padLeft(2, '0')} - ${event.endTime.hour}:${event.endTime.minute.toString().padLeft(2, '0')}'),
            const SizedBox(height: 12),
            _detailRow(Icons.location_on, 'Ubicación', event.location),
            const SizedBox(height: 12),
            _detailRow(Icons.person, 'Profesor', event.professor),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.pop(),
                child: const Text('Cerrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.grey),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
