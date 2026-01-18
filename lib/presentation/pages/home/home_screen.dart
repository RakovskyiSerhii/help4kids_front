import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help4kids_front/core/di/injection.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/generated/assets.gen.dart';
import 'package:help4kids_front/presentation/pages/home/home_cubit.dart';
import 'package:help4kids_front/presentation/pages/home/home_state.dart';
import 'package:help4kids_front/presentation/pages/home/widgets/about/about_widget.dart';
import 'package:help4kids_front/presentation/pages/home/widgets/nevidkladna_course/nevidkladna_course_widget.dart';
import 'package:help4kids_front/presentation/pages/home/widgets/services/services_widget.dart';
import 'package:help4kids_front/presentation/pages/home/widgets/staff/staff_widget.dart';
import 'package:help4kids_front/presentation/pages/widgets/footer%20/footer_widget.dart';
import 'package:help4kids_front/presentation/pages/widgets/header/header_widget.dart';
import 'package:help4kids_front/presentation/pages/widgets/header/mobile_drawer_widget.dart';
import 'package:help4kids_front/presentation/pages/widgets/sized_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<HomeCubit>(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.loadingResult?.isProgress == true) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (state.landing == null) {
            return const Scaffold(
              body: Center(
                child: Text('Не вдалося завантажити дані. Спробуйте пізніше.'),
              ),
            );
          }

          return Scaffold(
            drawer: MobileDrawerWidget(
              serviceCategories: state.landing!.featuredServices,
            ),
            body: Column(
              children: [
                HeaderWidget(serviceCategories: state.landing!.featuredServices),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height - 60,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          Assets.images.fronBanner.path),
                                      fit: BoxFit.cover),
                                ),
                                foregroundDecoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      context.theme.primaryColor.withOpacity(0),
                                      context.theme.primaryColor.withOpacity(0.76),
                                    ],
                                    stops: [0.01, 1.0],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: SizedWidget(
                                  builder: (context, type) {
                                    double kTitle;
                                    double kSubtitle;
                                    switch (type) {
                                      case SizeType.mobile:
                                        kTitle = 0.07;
                                        kSubtitle = 0.04;
                                        break;
                                      case SizeType.tablet:
                                        kTitle = 0.06;
                                        kSubtitle = 0.03;
                                        break;
                                      case SizeType.pc:
                                        kTitle = 0.05;
                                        kSubtitle = 0.02;
                                        break;
                                    }
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Медичний центр HelpKids+',
                                          style: context
                                              .theme.textTheme.titleLarge
                                              ?.copyWith(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                kTitle,
                                          ),
                                        ),
                                        Text(
                                          'Центр дитячого та жіночого здоровʼя',
                                          style: context
                                              .theme.textTheme.titleSmall
                                              ?.copyWith(
                                                  color: Colors.white,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          kSubtitle),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        AboutWidget(),
                        const SizedBox(height: 50),
                        const NevidkladnaCourseWidget(),
                        const SizedBox(height: 50),
                        ServicesWidget(list: state.landing!.featuredServices),
                        const SizedBox(height: 50),
                        StaffWidget(featuredStaff: state.landing!.featuredStaff),
                        const SizedBox(height: 50),
                        FooterWidget()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
