import 'package:flutter/material.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/core/theme/app_colors.dart';
import 'package:help4kids_front/generated/assets.gen.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPrimaryColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Assets.icons.helpkidsLogo.image(
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 48),
                
                // Title
                Text(
                  'Зустрінемось знов в 2026',
                  style: context.theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                
                // Maintenance icon or animation
                Icon(
                  Icons.build_circle_outlined,
                  size: 80,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

