import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help4kids_front/core/di/injection.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/generated/assets.gen.dart';
import 'package:help4kids_front/presentation/pages/home/home_cubit.dart';
import 'package:help4kids_front/presentation/pages/home/home_state.dart';
import 'package:help4kids_front/presentation/pages/home/widgets/about/about_widget.dart';
import 'package:help4kids_front/presentation/pages/home/widgets/services/services_widget.dart';
import 'package:help4kids_front/presentation/pages/home/widgets/staff/staff_widget.dart';
import 'package:help4kids_front/presentation/pages/widgets/footer%20/footer_widget.dart';
import 'package:help4kids_front/presentation/pages/widgets/header/header_widget.dart';
import 'package:help4kids_front/presentation/pages/widgets/sized_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt.get<HomeCubit>(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.loadingResult?.isProgress == true) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                HeaderWidget(
                    serviceCategories: state.landing!.featuredServices),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.98,
                          height: MediaQuery.of(context).size.height - 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(
                                  MediaQuery.of(context).size.width * 0.30),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: context.theme.colorScheme.secondary,
                                offset: Offset(20, 0),
                                blurRadius: 0,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                clipBehavior: Clip.hardEdge,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(
                                      MediaQuery.of(context).size.width * 0.30),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            Assets.images.fronBanner.path),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(
                                          MediaQuery.of(context).size.width *
                                              0.30),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            context.theme.colorScheme.secondary,
                                        offset: Offset(20, 0),
                                        blurRadius: 0,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                    border: Border(
                                      right: BorderSide(
                                        width: 15,
                                        color: context.theme.primaryColor,
                                      ),
                                    ),
                                  ),
                                  foregroundDecoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromRGBO(43, 135, 218, 0),
                                        Color.fromRGBO(161, 200, 103, 0.76),
                                      ],
                                      stops: [0.01, 1.0],
                                    ),
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
                        ServicesWidget(list: state.landing!.featuredServices),
                        const SizedBox(height: 50),
                        StaffWidget(
                            featuredStaff: state.landing!.featuredStaff),
                        const SizedBox(height: 50),
                        FooterWidget()
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
