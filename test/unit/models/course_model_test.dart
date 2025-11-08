import 'package:flutter_test/flutter_test.dart';
import 'package:juania/features/courses/data/models/course_model.dart';
import 'package:juania/features/courses/domain/entities/course_entity.dart';

void main() {
  group('CourseModel -', () {
    final testCourseJson = {
      'id': 'course-123',
      'title': 'Programación Móvil',
      'code': 'PM-101',
      'professor': 'Dr. García',
      'progress': 75.5,
      'grade': 4.5,
      'onTimeDeliveries': 90.0,
      'pendingTasks': 3,
      'template': 'mobile',
      'category': 'CourseCategory.programacion',
      'tags': ['CourseTag.alDia'],
      'notificationCount': 2,
      'colorIndex': 1,
    };

    const testCourse = CourseModel(
      id: 'course-123',
      title: 'Programación Móvil',
      code: 'PM-101',
      professor: 'Dr. García',
      progress: 75.5,
      grade: 4.5,
      onTimeDeliveries: 90.0,
      pendingTasks: 3,
      template: 'mobile',
      category: CourseCategory.programacion,
      tags: [CourseTag.alDia],
      notificationCount: 2,
      colorIndex: 1,
    );

    group('fromJson', () {
      test('crea un CourseModel desde JSON válido', () {
        final course = CourseModel.fromJson(testCourseJson);
        
        expect(course.id, 'course-123');
        expect(course.title, 'Programación Móvil');
        expect(course.code, 'PM-101');
        expect(course.professor, 'Dr. García');
        expect(course.progress, 75.5);
        expect(course.grade, 4.5);
        expect(course.onTimeDeliveries, 90.0);
        expect(course.pendingTasks, 3);
      });

      test('maneja valores por defecto cuando faltan propiedades', () {
        final course = CourseModel.fromJson({});
        
        expect(course.id, '');
        expect(course.title, '');
        expect(course.code, '');
        expect(course.progress, 0.0);
        expect(course.grade, 0.0);
        expect(course.pendingTasks, 0);
      });

      test('convierte números enteros a double correctamente', () {
        final json = {
          'id': '1',
          'title': 'Test',
          'code': 'T1',
          'professor': 'Prof',
          'progress': 50,  // int en lugar de double
          'grade': 4,
          'onTimeDeliveries': 80,
          'pendingTasks': 2,
          'category': 'otros',
        };
        
        final course = CourseModel.fromJson(json);
        
        expect(course.progress, isA<double>());
        expect(course.grade, isA<double>());
        expect(course.progress, 50.0);
        expect(course.grade, 4.0);
      });

      test('parsea categorías correctamente', () {
        final categories = {
          'CourseCategory.matematicas': CourseCategory.matematicas,
          'CourseCategory.programacion': CourseCategory.programacion,
          'CourseCategory.fisica': CourseCategory.fisica,
          'CourseCategory.humanidades': CourseCategory.humanidades,
          'CourseCategory.ciencias': CourseCategory.ciencias,
          'invalid': CourseCategory.otros,
        };

        categories.forEach((key, expectedValue) {
          final json = {
            'id': '1',
            'title': 'Test',
            'code': 'T1',
            'professor': 'Prof',
            'progress': 0.0,
            'grade': 0.0,
            'onTimeDeliveries': 0.0,
            'pendingTasks': 0,
            'category': key,
          };
          
          final course = CourseModel.fromJson(json);
          expect(course.category, expectedValue,
              reason: 'Categoría $key debería ser $expectedValue');
        });
      });
    });

    group('toJson', () {
      test('convierte CourseModel a JSON correctamente', () {
        final json = testCourse.toJson();
        
        expect(json['id'], 'course-123');
        expect(json['title'], 'Programación Móvil');
        expect(json['progress'], 75.5);
        expect(json['pendingTasks'], 3);
      });

      test('incluye todas las propiedades en el JSON', () {
        final json = testCourse.toJson();
        
        expect(json.keys, containsAll([
          'id',
          'title',
          'code',
          'professor',
          'progress',
          'grade',
          'onTimeDeliveries',
          'pendingTasks',
          'category',
          'tags',
        ]));
      });
    });

    group('toEntity', () {
      test('convierte CourseModel a CourseEntity', () {
        final entity = testCourse.toEntity();
        
        expect(entity, isA<CourseEntity>());
        expect(entity.id, testCourse.id);
        expect(entity.title, testCourse.title);
        expect(entity.progress, testCourse.progress);
      });
    });

    group('validaciones de datos', () {
      test('progress está entre 0 y 100', () {
        const course = CourseModel(
          id: '1',
          title: 'Test',
          code: 'T1',
          professor: 'Prof',
          progress: 75.0,
          grade: 4.0,
          onTimeDeliveries: 80.0,
          pendingTasks: 0,
          category: CourseCategory.otros,
        );
        
        expect(course.progress, greaterThanOrEqualTo(0));
        expect(course.progress, lessThanOrEqualTo(100));
      });

      test('grade es un valor positivo', () {
        const course = CourseModel(
          id: '1',
          title: 'Test',
          code: 'T1',
          professor: 'Prof',
          progress: 50.0,
          grade: 4.5,
          onTimeDeliveries: 80.0,
          pendingTasks: 0,
          category: CourseCategory.otros,
        );
        
        expect(course.grade, greaterThanOrEqualTo(0));
      });

      test('pendingTasks no es negativo', () {
        const course = CourseModel(
          id: '1',
          title: 'Test',
          code: 'T1',
          professor: 'Prof',
          progress: 50.0,
          grade: 4.0,
          onTimeDeliveries: 80.0,
          pendingTasks: 5,
          category: CourseCategory.otros,
        );
        
        expect(course.pendingTasks, greaterThanOrEqualTo(0));
      });
    });
  });
}
