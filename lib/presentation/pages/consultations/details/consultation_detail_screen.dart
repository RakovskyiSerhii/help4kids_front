import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help4kids_front/core/app_bloc/app_cubit.dart';
import 'package:help4kids_front/core/app_bloc/app_state.dart';
import 'package:help4kids_front/core/di/injection.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/presentation/pages/consultations/details/consultation_detail_cubit.dart';
import 'package:help4kids_front/presentation/pages/consultations/details/consultation_detail_state.dart';
import 'package:help4kids_front/presentation/pages/widgets/footer%20/footer_widget.dart';
import 'package:help4kids_front/presentation/pages/widgets/header/header_widget.dart';

class ConsultationDetailScreen extends StatelessWidget {
  const ConsultationDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ConsultationDetailCubit>()
        ..loadConsultation(id),
      child: Scaffold(
        body: BlocBuilder<AppCubit, AppState>(
          builder: (context, appState) {
            final categories = appState.info?.categories ?? [];
            return Column(
              children: [
                HeaderWidget(serviceCategories: categories),
                Expanded(
                  child: BlocBuilder<ConsultationDetailCubit, ConsultationDetailState>(
                    builder: (context, state) {
            if (state.loadingResult?.isProgress == true) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.loadingResult?.isFailure == true) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      'Не вдалося завантажити консультацію',
                      style: context.theme.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ConsultationDetailCubit>().loadConsultation(id);
                      },
                      child: const Text('Спробувати ще раз'),
                    ),
                  ],
                ),
              );
            }

            final consultation = state.consultation;
            if (consultation == null) {
              return const Center(
                child: Text('Консультацію не знайдено'),
              );
            }

                      return SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              consultation.title,
                              style: context.theme.textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 16),
                            if (consultation.shortDescription != null &&
                                consultation.shortDescription!.isNotEmpty)
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: context.theme.colorScheme.surfaceContainerHighest,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  consultation.shortDescription!,
                                  style: context.theme.textTheme.bodyLarge,
                                ),
                              ),
                            const SizedBox(height: 16),
                            if (consultation.description != null &&
                                consultation.description!.isNotEmpty) ...[
                              Text(
                                'Опис',
                                style: context.theme.textTheme.titleLarge,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                consultation.description!,
                                style: context.theme.textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 16),
                            ],
                            Row(
                              children: [
                                if (consultation.duration != null) ...[
                                  Icon(Icons.access_time,
                                      size: 20, color: context.theme.colorScheme.primary),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Тривалість: ${consultation.duration}',
                                    style: context.theme.textTheme.bodyMedium,
                                  ),
                                ],
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: context.theme.colorScheme.primary,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    '${consultation.price.toStringAsFixed(0)} грн',
                                    style: context.theme.textTheme.titleLarge?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (consultation.question != null) ...[
                              const SizedBox(height: 24),
                              Text(
                                'Питання, на які ви отримаєте відповіді:',
                                style: context.theme.textTheme.titleLarge,
                              ),
                              const SizedBox(height: 12),
                              ..._buildQuestionsList(consultation.question!, context),
                            ],
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // TODO: Navigate to booking/payment
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                                child: const Text('Записатися на консультацію'),
                              ),
                            ),
                            FooterWidget(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildQuestionsList(
      dynamic question, BuildContext context) {
    final questions = <String>[];

    // Handle different question formats
    if (question.containsKey('questions') && question['questions'] is List) {
      questions.addAll(
        (question['questions'] as List).map((e) => e.toString()),
      );
    } else if (question is List) {
      questions.addAll(question.map((e) => e.toString()));
    } else {
      // If it's a map with string keys, extract values
      question.forEach((key, value) {
        if (value is String) {
          questions.add(value);
        } else if (value is List) {
          questions.addAll(value.map((e) => e.toString()));
        }
      });
    }

    return questions.map((questionText) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 20,
              color: context.theme.colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                questionText,
                style: context.theme.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
