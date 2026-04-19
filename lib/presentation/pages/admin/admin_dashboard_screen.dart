import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:help4kids_front/core/di/injection.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/core/routing/screens.dart';
import 'package:help4kids_front/presentation/pages/admin/admin_cubit.dart';
import 'package:help4kids_front/presentation/pages/admin/admin_state.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AdminCubit>(),
      child: const _AdminDashboardView(),
    );
  }
}

class _AdminDashboardView extends StatelessWidget {
  const _AdminDashboardView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Панель адміністратора'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quick Actions
            Text(
              'Швидкі дії',
              style: context.theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _ActionCard(
                  icon: Icons.school,
                  title: 'Створити курс',
                  color: Colors.blue,
                  onTap: () {
                    context.goNamed(Screen.adminCreateCourse);
                  },
                ),
                _ActionCard(
                  icon: Icons.article,
                  title: 'Створити статтю',
                  color: Colors.green,
                  onTap: () {
                    // TODO: Navigate to create article
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Створення статей - в розробці')),
                    );
                  },
                ),
                _ActionCard(
                  icon: Icons.people,
                  title: 'Створити консультацію',
                  color: Colors.orange,
                  onTap: () {
                    // TODO: Navigate to create consultation
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Створення консультацій - в розробці')),
                    );
                  },
                ),
                _ActionCard(
                  icon: Icons.person_add,
                  title: 'Додати співробітника',
                  color: Colors.purple,
                  onTap: () {
                    // TODO: Navigate to create staff
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Додавання співробітників - в розробці')),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Courses Management
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Управління курсами',
                  style: context.theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    context.goNamed(Screen.adminCreateCourse);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Створити'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            BlocBuilder<AdminCubit, AdminState>(
              builder: (context, state) {
                if (state.loadResult?.isProgress == true) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (state.loadResult?.isFailure == true) {
                  return Center(
                    child: Column(
                      children: [
                        const Icon(Icons.error_outline, size: 48, color: Colors.red),
                        const SizedBox(height: 8),
                        const Text('Помилка завантаження курсів'),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () {
                            context.read<AdminCubit>().loadCourses();
                          },
                          child: const Text('Спробувати знову'),
                        ),
                      ],
                    ),
                  );
                }

                final courses = state.courses ?? [];
                if (courses.isEmpty) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.school_outlined,
                              size: 64,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Курси відсутні',
                              style: context.theme.textTheme.titleMedium?.copyWith(
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton.icon(
                              onPressed: () {
                                context.goNamed(Screen.adminCreateCourse);
                              },
                              icon: const Icon(Icons.add),
                              label: const Text('Створити перший курс'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final course = courses[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: context.theme.colorScheme.primaryContainer,
                          child: Icon(
                            Icons.school,
                            color: context.theme.colorScheme.primary,
                          ),
                        ),
                        title: Text(course.title),
                        subtitle: Text(
                          course.shortDescription,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (course.featured)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.amber.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  'Рекомендовано',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                context.goNamed(
                                  Screen.adminEditCourse,
                                  queryParameters: {'id': course.id},
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                _showDeleteDialog(context, course.id, course.title);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, String courseId, String courseTitle) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Видалити курс?'),
        content: Text('Ви впевнені, що хочете видалити курс "$courseTitle"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Скасувати'),
          ),
          TextButton(
            onPressed: () {
              context.read<AdminCubit>().deleteCourse(courseId);
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Видалити'),
          ),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

