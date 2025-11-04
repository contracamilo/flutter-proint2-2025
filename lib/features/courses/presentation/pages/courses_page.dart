import 'package:flutter/material.dart';
import '../../domain/entities/course_entity.dart';
import '../../data/models/course_model.dart';
import '../widgets/course_card.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'todos';
  String _selectedTag = 'todos';

  final List<CourseEntity> _allCourses = [
    const CourseModel(
      id: '1',
      title: 'Cálculo Diferencial e Integral',
      code: 'MAT-101',
      professor: 'Dr. López',
      progress: 80,
      grade: 4.2,
      onTimeDeliveries: 80,
      pendingTasks: 2,
      template: 'Método Cornell',
      category: CourseCategory.matematicas,
      tags: [CourseTag.entregasPendientes, CourseTag.plantilla],
      notificationCount: 2,
      colorIndex: 0,
    ),
    const CourseModel(
      id: '2',
      title: 'Programación Orientada a Objetos',
      code: 'CSC-202',
      professor: 'Ing. Martínez',
      progress: 95,
      grade: 4.8,
      onTimeDeliveries: 95,
      pendingTasks: 0,
      template: 'Práctica Activa',
      category: CourseCategory.programacion,
      tags: [CourseTag.alDia, CourseTag.metodo],
      notificationCount: 0,
      colorIndex: 1,
    ),
    const CourseModel(
      id: '3',
      title: 'Física II',
      code: 'FIS-150',
      professor: 'Dr. Ramírez',
      progress: 70,
      grade: 3.9,
      onTimeDeliveries: 75,
      pendingTasks: 1,
      template: null,
      category: CourseCategory.fisica,
      tags: [CourseTag.entregasPendientes],
      notificationCount: 1,
      colorIndex: 2,
    ),
    const CourseModel(
      id: '4',
      title: 'Métodos Numéricos',
      code: 'MAT-210',
      professor: 'Dra. López',
      progress: 85,
      grade: 4.5,
      onTimeDeliveries: 90,
      pendingTasks: 0,
      template: 'Método Cornell',
      category: CourseCategory.matematicas,
      tags: [CourseTag.alDia],
      notificationCount: 0,
      colorIndex: 0,
    ),
    const CourseModel(
      id: '5',
      title: 'Estructuras de Datos',
      code: 'CSC-301',
      professor: 'Prof. García',
      progress: 65,
      grade: 4.1,
      onTimeDeliveries: 70,
      pendingTasks: 3,
      template: null,
      category: CourseCategory.programacion,
      tags: [CourseTag.entregasPendientes, CourseTag.plantilla],
      notificationCount: 3,
      colorIndex: 1,
    ),
    const CourseModel(
      id: '6',
      title: 'Humanidades',
      code: 'HUM-100',
      professor: 'Prof. Sánchez',
      progress: 88,
      grade: 4.6,
      onTimeDeliveries: 85,
      pendingTasks: 0,
      template: null,
      category: CourseCategory.humanidades,
      tags: [CourseTag.alDia],
      notificationCount: 0,
      colorIndex: 3,
    ),
  ];

  List<CourseEntity> get _filteredCourses {
    List<CourseEntity> filtered = _allCourses;

    // Search filter
    if (_searchController.text.isNotEmpty) {
      final query = _searchController.text.toLowerCase();
      filtered = filtered
          .where((course) =>
              course.title.toLowerCase().contains(query) ||
              course.code.toLowerCase().contains(query) ||
              course.professor.toLowerCase().contains(query))
          .toList();
    }

    // Category filter
    if (_selectedFilter != 'todos') {
      filtered = filtered.where((course) {
        switch (_selectedFilter) {
          case 'matematicas':
            return course.category == CourseCategory.matematicas;
          case 'programacion':
            return course.category == CourseCategory.programacion;
          case 'fisica':
            return course.category == CourseCategory.fisica;
          case 'humanidades':
            return course.category == CourseCategory.humanidades;
          case 'ciencias':
            return course.category == CourseCategory.ciencias;
          default:
            return true;
        }
      }).toList();
    }

    // Tag filter
    if (_selectedTag != 'todos') {
      filtered = filtered.where((course) {
        switch (_selectedTag) {
          case 'pendientes':
            return course.tags.contains(CourseTag.entregasPendientes) ||
                course.pendingTasks > 0;
          case 'alDia':
            return course.tags.contains(CourseTag.alDia);
          case 'plantilla':
            return course.tags.contains(CourseTag.plantilla);
          default:
            return true;
        }
      }).toList();
    }

    return filtered;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1e40af),
        elevation: 0,
        title: const Text(
          'Mis Cursos',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.white),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDC2626),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    'MG',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with search and buttons
            Container(
              color: const Color(0xFF1e40af),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search bar
                  TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText: 'Buscar cursos...',
                      hintStyle: const TextStyle(
                        color: Color(0xFFB0B9C1),
                        fontSize: 14,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFFB0B9C1),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Filter and tag buttons
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              _buildFilterButton(
                                'Filtros',
                                'filtros',
                                Icons.tune,
                              ),
                              const SizedBox(width: 8),
                              _buildFilterButton(
                                'Etiquetas',
                                'etiquetas',
                                Icons.label_outline,
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Content area
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  if (_filteredCourses.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: Column(
                          children: [
                            Icon(
                              Icons.school_outlined,
                              size: 64,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No hay cursos que coincidan',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _filteredCourses.length,
                      itemBuilder: (context, index) {
                        final course = _filteredCourses[index];
                        return CourseCard(
                          course: course,
                          onTap: () {
                            // TODO: Navigate to course details
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Abierto: ${course.title}'),
                                duration: const Duration(milliseconds: 500),
                              ),
                            );
                          },
                        );
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(
    String label,
    String type,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => _showFilterDialog(type),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: const Color(0xFF1e40af)),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1F2937),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterDialog(String type) {
    if (type == 'filtros') {
      showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Categorías'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDialogOption('Todos', 'todos'),
                _buildDialogOption('Matemáticas', 'matematicas'),
                _buildDialogOption('Programación', 'programacion'),
                _buildDialogOption('Física', 'fisica'),
                _buildDialogOption('Humanidades', 'humanidades'),
                _buildDialogOption('Ciencias', 'ciencias'),
              ],
            ),
          ),
        ),
      );
    } else {
      showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Etiquetas'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDialogOption('Todos', 'todos'),
                _buildDialogOption('Entregas Pendientes', 'pendientes'),
                _buildDialogOption('Al día', 'alDia'),
                _buildDialogOption('Con Plantilla', 'plantilla'),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget _buildDialogOption(String label, String value) {
    final isSelected = (_selectedFilter == value || _selectedTag == value);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedFilter == 'todos' || value == 'todos') {
            _selectedFilter = value;
          } else if (_selectedTag == 'todos' || value == 'todos') {
            _selectedTag = value;
          } else {
            // Try to assign to the appropriate variable
            if (value == 'matematicas' ||
                value == 'programacion' ||
                value == 'fisica' ||
                value == 'humanidades' ||
                value == 'ciencias') {
              _selectedFilter = value;
            } else {
              _selectedTag = value;
            }
          }
        });
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected
                      ? const Color(0xFF1e40af)
                      : const Color(0xFF1F2937),
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check,
                color: Color(0xFF1e40af),
              ),
          ],
        ),
      ),
    );
  }
}
