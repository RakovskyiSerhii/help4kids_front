import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:help4kids_front/core/di/injection.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/core/routing/screens.dart';
import 'package:help4kids_front/presentation/pages/admin/admin_cubit.dart';
import 'package:help4kids_front/presentation/pages/admin/admin_state.dart';

class CreateCourseScreen extends StatefulWidget {
  final String? courseId; // If provided, we're editing

  const CreateCourseScreen({Key? key, this.courseId}) : super(key: key);

  @override
  State<CreateCourseScreen> createState() => _CreateCourseScreenState();
}

class _CreateCourseScreenState extends State<CreateCourseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _shortDescriptionController = TextEditingController();
  final _longDescriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _durationController = TextEditingController();
  final _contentUrlController = TextEditingController();
  final _iconController = TextEditingController();
  bool _featured = false;

  @override
  void dispose() {
    _titleController.dispose();
    _shortDescriptionController.dispose();
    _longDescriptionController.dispose();
    _priceController.dispose();
    _durationController.dispose();
    _contentUrlController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final courseData = {
        'title': _titleController.text.trim(),
        'shortDescription': _shortDescriptionController.text.trim(),
        'longDescription': _longDescriptionController.text.trim().isEmpty
            ? null
            : _longDescriptionController.text.trim(),
        'price': double.tryParse(_priceController.text) ?? 0.0,
        'duration': _durationController.text.trim().isEmpty
            ? null
            : int.tryParse(_durationController.text),
        'contentUrl': _contentUrlController.text.trim(),
        'icon': _iconController.text.trim().isEmpty
            ? 'default'
            : _iconController.text.trim(),
        'featured': _featured,
      };

      final cubit = context.read<AdminCubit>();
      if (widget.courseId != null) {
        cubit.updateCourse(widget.courseId!, courseData);
      } else {
        cubit.createCourse(courseData);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.courseId != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Редагувати курс' : 'Створити курс'),
      ),
      body: BlocListener<AdminCubit, AdminState>(
        listener: (context, state) {
          if (state.createResult?.isSuccess == true ||
              state.updateResult?.isSuccess == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  isEditing
                      ? 'Курс успішно оновлено'
                      : 'Курс успішно створено',
                ),
                backgroundColor: Colors.green,
              ),
            );
            context.goNamed(Screen.admin);
          } else if (state.createResult?.isFailure == true ||
              state.updateResult?.isFailure == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Помилка при збереженні курсу'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Назва курсу *',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Введіть назву курсу';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _shortDescriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Короткий опис *',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Введіть короткий опис';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _longDescriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Повний опис',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _priceController,
                        decoration: const InputDecoration(
                          labelText: 'Ціна *',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Введіть ціну';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Введіть коректну ціну';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _durationController,
                        decoration: const InputDecoration(
                          labelText: 'Тривалість (хв)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _contentUrlController,
                  decoration: const InputDecoration(
                    labelText: 'URL відео контенту *',
                    border: OutlineInputBorder(),
                    helperText: 'Посилання на відео матеріал',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Введіть URL відео';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _iconController,
                  decoration: const InputDecoration(
                    labelText: 'Іконка',
                    border: OutlineInputBorder(),
                    helperText: 'Ідентифікатор іконки (за замовчуванням: default)',
                  ),
                ),
                const SizedBox(height: 16),
                SwitchListTile(
                  title: const Text('Рекомендований курс'),
                  subtitle: const Text('Показувати на головній сторінці'),
                  value: _featured,
                  onChanged: (value) {
                    setState(() {
                      _featured = value;
                    });
                  },
                ),
                const SizedBox(height: 24),
                BlocBuilder<AdminCubit, AdminState>(
                  builder: (context, state) {
                    final isLoading = state.createResult?.isProgress == true ||
                        state.updateResult?.isProgress == true;
                    return ElevatedButton(
                      onPressed: isLoading ? null : _submitForm,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(isEditing ? 'Зберегти зміни' : 'Створити курс'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

