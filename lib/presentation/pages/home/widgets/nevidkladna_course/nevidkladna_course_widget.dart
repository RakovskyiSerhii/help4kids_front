import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:help4kids_front/core/routing/screens.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/core/theme/theme_extension.dart';
import 'package:help4kids_front/presentation/pages/widgets/sized_widget.dart';

class NevidkladnaCourseWidget extends StatelessWidget {
  const NevidkladnaCourseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedWidget(
      builder: (context, type) {
        final double padding;
        switch (type) {
          case SizeType.mobile:
            padding = 16;
            break;
          case SizeType.tablet:
            padding = MediaQuery.of(context).size.width * 0.05;
            break;
          case SizeType.pc:
            padding = MediaQuery.of(context).size.width * 0.1;
            break;
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: context.theme.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: context.theme.primaryColor.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'НЕВІДКЛАДНА ДОПОМОГА ДІТЯМ вдома',
                  style: context.theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: type == SizeType.pc 
                            ? (context.theme.textTheme.titleLarge?.fontSize ?? 18) * 1.3
                            : null,
                      ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Онлайн-курс від лікарки-педіатрині, к.мед.н Людмили Раковської. Навчіться діяти швидко, впевнено і без паніки в невідкладних ситуаціях із дітьми. 8 модулів, 29 відеоуроків, 17 чек-листів і памʼяток.',
                  style: context.theme.textTheme.bodyLarge?.copyWith(
                        fontSize: type == SizeType.pc 
                            ? (context.theme.textTheme.bodyLarge?.fontSize ?? 16) * 1.15
                            : null,
                      ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: type == SizeType.mobile ? double.infinity : 300,
                  child: ElevatedButton(
                    onPressed: () {
                      context.goNamed(Screen.nevidkladnaDopomoga);
                    },
                    style: context.theme.elevatedButtonTheme.style?.copyWith(
                      backgroundColor: WidgetStateProperty.resolveWith(
                        (states) {
                          if (states.contains(WidgetState.disabled)) {
                            return context.theme.appColors
                                .primaryButtonDisabledBackgroundColor;
                          }
                          return context.theme.appColors
                              .primaryButtonBackgroundColor;
                        },
                      ),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                    ),
                    child: const Text(
                      'Дізнатися більше',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
