import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help4kids_front/core/di/injection.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/data/model/service.dart';
import 'package:help4kids_front/data/model/service_category.dart';
import 'package:help4kids_front/generated/assets.gen.dart';
import 'package:help4kids_front/presentation/pages/services/services_cubit.dart';
import 'package:help4kids_front/presentation/pages/services/services_state.dart';
import 'package:help4kids_front/presentation/pages/widgets/footer%20/footer_widget.dart';
import 'package:help4kids_front/presentation/pages/widgets/header/header_widget.dart';
import 'package:help4kids_front/presentation/pages/widgets/sized_widget.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt.get<ServicesCubit>(),
        child: BlocBuilder<ServicesCubit, ServicesState>(
          builder: (context, state) {
            if (state.loadResult?.isProgress == true) {
              return Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                HeaderWidget(serviceCategories: state.categories ?? []),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildTitle(context),
                        const SizedBox(height: 50),
                        _buildList(context, state.categories ?? [], state.services ?? []),
                        FooterWidget(),
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

  Widget _buildList(
    BuildContext context,
    List<ServiceCategory> categories,
    List<Service> services,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.primaryColor.withOpacity(.2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ListView.separated(
        itemBuilder: (context, index) {
          final categorizedServices = services
              .where((element) => element.categoryId == categories[index].id)
              .toList();
          return Column(
            children: [
              Text(
                categories[index].name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              ListView.separated(
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(categorizedServices[index].title),
                      Text(categorizedServices[index].price.toString()),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: categorizedServices.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: double.infinity,
          height: 50,
          child: Assets.bg.bgWaveBottom.svg(
            width: double.infinity,
            height: 50,
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                context.theme.primaryColor.withOpacity(.2), BlendMode.srcIn),
          ),
        ),
        itemCount: categories.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      ),
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
          child: Column(
            children: [
              Text(
                'Наші послуги',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Ціни сформовані станом на 27.02.2025',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}
