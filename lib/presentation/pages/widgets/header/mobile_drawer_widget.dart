import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:help4kids_front/core/routing/screens.dart';
import 'package:help4kids_front/data/model/service_category.dart';
import '../../../../core/go_router_extension.dart';

class MobileDrawerWidget extends StatelessWidget {
  const MobileDrawerWidget({
    super.key,
    required this.serviceCategories,
  });

  final List<ServiceCategory> serviceCategories;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    final location = router.location();
    final theme = Theme.of(context);

    final bool isHome = location == '/' || location.startsWith('/?');
    final bool isServices = location.startsWith('/services');

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SizedBox(),
          ),
          ListTile(
            title: const Text('Головна'),
            selected: isHome,
            selectedTileColor: theme.colorScheme.primary.withOpacity(0.1),
            onTap: () {
              Navigator.pop(context);
              if (!isHome) {
                context.goNamed(Screen.initial);
              }
            },
          ),
          ListTile(
            title: const Text('Наші послуги'),
            selected: isServices,
            selectedTileColor: theme.colorScheme.primary.withOpacity(0.1),
            onTap: () {
              Navigator.pop(context);
              if (!isServices) {
                context.goNamed(Screen.services);
              }
            },
          ),
        ],
      ),
    );
  }
}

