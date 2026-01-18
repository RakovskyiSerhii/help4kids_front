import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help4kids_front/core/app_bloc/app_cubit.dart';
import 'package:help4kids_front/core/app_bloc/app_state.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/presentation/pages/widgets/buttons.dart';
import 'package:help4kids_front/presentation/pages/widgets/footer%20/footer_widget.dart';
import 'package:help4kids_front/presentation/pages/widgets/header/header_widget.dart';
import 'package:help4kids_front/presentation/pages/widgets/header/mobile_drawer_widget.dart';
import 'package:help4kids_front/presentation/pages/widgets/sized_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class NevidkladnaDopomogaScreen extends StatelessWidget {
  const NevidkladnaDopomogaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final categories = state.info?.categories ?? [];
        
        return Scaffold(
          drawer: MobileDrawerWidget(serviceCategories: categories),
          body: Column(
            children: [
              HeaderWidget(serviceCategories: categories),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitle(context),
                      const SizedBox(height: 50),
                      _buildGeneralText(context),
                      const SizedBox(height: 50),
                      _buildServiceSection(
                        context,
                        title: 'Самостійний («хочу подивитися»)',
                        description:
                            'Запис всіх відеоуроків - 998 грн. Доступ до матеріалів курсу на 6 міс.',
                        buttonText: 'Придбати за 998 грн',
                        onButtonPressed: () async {
                          final uri = Uri.parse(
                              'https://secure.wayforpay.com/payment/nevidkladna-dopomoga-1');
                          await launchUrl(
                            uri,
                            mode: LaunchMode.platformDefault,
                            webOnlyWindowName: '_blank',
                          );
                        },
                      ),
                      const SizedBox(height: 50),
                      _buildServiceSection(
                        context,
                        title: 'З моєю підтримкою («хочу навчитися»)',
                        description:
                            'Запис лекцій 8 модулів, 29 відео уроків, короткі памʼятки. Плюс три зустрічі в зум з відповідями на питання, перевірка домашніх завдань. Вартість - 1493 грн, доступ до матеріалів курсу назавжди.',
                        buttonText: 'Придбати за 1493 грн',
                        onButtonPressed: () async {
                          final uri = Uri.parse(
                              'https://secure.wayforpay.com/payment/nevidkladna-dopomoga-2');
                          await launchUrl(
                            uri,
                            mode: LaunchMode.platformDefault,
                            webOnlyWindowName: '_blank',
                          );
                        },
                      ),
                      const SizedBox(height: 50),
                      _buildServiceSection(
                        context,
                        title: 'З офлайн заняттям',
                        description:
                            'Запис лекцій 8 модулів, 29 відео уроків, короткі памʼятки, три живі зустрічі в зум з відповідями на питання, перевірка домашніх завдань, одне офлайн заняття з відпрацюванням практичних навичок на манекенах (місце проведення-м.Харків, м.Мерефа, Харківська обл) - 2492 грн, доступ до матеріалів курсу назавжди.',
                        buttonText: 'Придбати за 2492 грн',
                        onButtonPressed: () async {
                          final uri = Uri.parse(
                              'https://secure.wayforpay.com/payment/nevidkladna-dopomoga-3');
                          await launchUrl(
                            uri,
                            mode: LaunchMode.platformDefault,
                            webOnlyWindowName: '_blank',
                          );
                        },
                      ),
                      const SizedBox(height: 50),
                      FooterWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTitle(BuildContext context) {
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
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 36),
                Text(
                  'НЕВІДКЛАДНА ДОПОМОГА ДІТЯМ вдома',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGeneralText(BuildContext context) {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Я, Людмила Раковська, лікарка-педіатриня, к.мед.н, за другою спеціальністю дитячий анестезіолог-реаніматолог, створила для вас онлайн-курс НЕВІДКЛАДНА ДОПОМОГА ДІТЯМ вдома.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              Text(
                '20.01.26 стартує 2-й потік.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                'Курс оновлений і покращений. В ньому тепер 8 модулів, 29 відеоуроків, 17 памʼяток і чек-листів і купа додаткового матеріалу.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              Text(
                'Ви зможете навчитися правильно і впевнено діяти в будь-яких ситуаціях, які трапляються з дітьми - від подряпин і високої температури до падіння з висоти, кровотеч і втрати свідомості.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              Text(
                'Курс для батьків',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'як не втратити контроль і допомогти дитині',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
              ),
              const SizedBox(height: 24),
              Text(
                'Мета курсу: навчити батьків діяти швидко, впевнено і без паніки в найпоширеніших невідкладних ситуаціях із дітьми.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              Text(
                'Формат: 8 структурованих модулів, 29 відеоуроків онлайн',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              Text(
                'Фокус: практичні алгоритми, 17 чек-листів і памʼяток «Що робити крок за кроком» - ваш короткий посібник, який врятує дорогоцінні хвилини',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              Text(
                'Кому потрібен: батьки, опікуни, вихователі, няні, бабусі й дідусі',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              Text(
                'Є три формати участі:',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildServiceSection(
    BuildContext context, {
    required String title,
    required String description,
    required String buttonText,
    required VoidCallback onButtonPressed,
  }) {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              SizedWidget(
                builder: (context, sizeType) {
                  final buttonWidth = sizeType == SizeType.mobile
                      ? double.infinity
                      : 300.0;
                  final baseButton = Buttons.primary(
                    context,
                    text: buttonText,
                    onPressed: onButtonPressed,
                  );
                  return SizedBox(
                    width: buttonWidth,
                    child: ElevatedButton(
                      onPressed: onButtonPressed,
                      style: baseButton.style?.copyWith(
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                      ),
                      child: Text(buttonText, style: const TextStyle(color: Colors.white)),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
