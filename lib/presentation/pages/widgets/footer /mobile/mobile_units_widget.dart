part of '../footer_widget.dart';

class MobileUnitsWidget extends StatelessWidget {
  final List<Unit> units;

  const MobileUnitsWidget({super.key, required this.units});

  @override
  Widget build(BuildContext context) {
    final unit = units.first;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          UnitRowWidget(
            icon: Icon(
              Icons.phone,
              color: AppColors.lightPrimaryColor,
            ),
            subtitle: unit.contactPhone,
            title: 'Мерефа',
          ),
          const SizedBox(height: 16),
          UnitRowWidget(
            icon: Icon(
              Icons.alternate_email,
              color: AppColors.lightPrimaryColor,
            ),
            subtitle: unit.email ?? '',
          ),
          const SizedBox(height: 16),
          UnitRowWidget(
            icon: Icon(
              Icons.watch_later_outlined,
              color: AppColors.lightPrimaryColor,
            ),
            subtitle: "Понеділок-Пʼятниця: ${unit.workingTime['workdays']}"
                "\nСубота: ${unit.workingTime['Saturday']}"
                "\nНеділя: вихідний",
            title: "Графік роботи",
          ),
          const SizedBox(height: 16),
          UnitRowWidget(
            icon: Icon(
              Icons.pin_drop,
              color: AppColors.lightPrimaryColor,
            ),
            subtitle: unit.address,
            title: "Адреса",
          )
        ],
      ),
    );
  }
}
