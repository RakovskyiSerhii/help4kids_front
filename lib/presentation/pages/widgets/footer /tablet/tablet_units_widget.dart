part of '../footer_widget.dart';

class TabletUnitsWidget extends StatelessWidget {
  const TabletUnitsWidget({
    super.key,
    required this.units,
  });

  final List<Unit> units;

  @override
  Widget build(BuildContext context) {
    final unit = units.first;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .05),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
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
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: UnitRowWidget(
              icon: Icon(
                Icons.watch_later_outlined,
                color: AppColors.lightPrimaryColor,
              ),
              subtitle: "Понеділок-Пʼятниця: ${unit.workingTime['workdays']}"
                  "\nСубота: ${unit.workingTime['Saturday']}"
                  "\nНеділя: вихідний",
              title: "Графік роботи",
            ),
          ),
          const SizedBox(width: 16),

          Expanded(
              child: UnitRowWidget(
                icon: Icon(
                  Icons.pin_drop,
                  color: AppColors.lightPrimaryColor,
                ),
                subtitle: unit.address,
                title: "Адреса",
              ))
        ],
      ),
    );
  }
}
