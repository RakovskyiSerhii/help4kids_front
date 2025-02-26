part of '../footer_widget.dart';

class PcUnitsWidget extends StatelessWidget {
  const PcUnitsWidget({super.key, required this.units});

  final List<Unit> units;

  @override
  Widget build(BuildContext context) {
    final unit = units.first;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .1),
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
