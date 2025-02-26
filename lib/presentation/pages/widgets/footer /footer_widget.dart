import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help4kids_front/core/app_bloc/app_cubit.dart';
import 'package:help4kids_front/core/app_bloc/app_state.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/core/theme/app_colors.dart';
import 'package:help4kids_front/data/model/consultation.dart';
import 'package:help4kids_front/data/model/finance_info.dart';
import 'package:help4kids_front/data/model/social_contact.dart';
import 'package:help4kids_front/data/model/unit.dart';
import 'package:help4kids_front/generated/assets.gen.dart';
import 'package:help4kids_front/presentation/pages/widgets/footer%20/widgets/consultation_item_widget.dart';
import 'package:help4kids_front/presentation/pages/widgets/footer%20/widgets/finance_info_widget.dart';
import 'package:help4kids_front/presentation/pages/widgets/footer%20/widgets/social_contact_widget.dart';
import 'package:help4kids_front/presentation/pages/widgets/footer%20/widgets/unit_widgets.dart';
import 'package:help4kids_front/presentation/pages/widgets/sized_widget.dart';

part 'mobile/mobile_consultation_widget.dart';

part 'mobile/mobile_footer_widget.dart';

part 'mobile/mobile_units_widget.dart';

part 'pc/pc_consultation_widget.dart';

part 'pc/pc_footer_widget.dart';

part 'pc/pc_units_widget.dart';

part 'tablet/tablet_consultation_widget.dart';

part 'tablet/tablet_footer_widget.dart';

part 'tablet/tablet_units_widget.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Assets.bg.bgWaveTop.svg(
                width: double.infinity,
                height: 50,
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    context.theme.primaryColor, BlendMode.srcIn),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              color: AppColors.lightPrimaryColor,
              child: Column(
                children: [
                  if (state.info!.units.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: SizedWidget(
                        builder: (context, type) {
                          return switch (type) {
                            SizeType.mobile =>
                              MobileUnitsWidget(units: state.info!.units),
                            SizeType.tablet =>
                              TabletUnitsWidget(units: state.info!.units),
                            SizeType.pc =>
                              PcUnitsWidget(units: state.info!.units),
                          };
                        },
                      ),
                    ),
                  if (state.info!.consultations.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: SizedWidget(
                        builder: (context, type) {
                          return switch (type) {
                            SizeType.mobile => MobileConsultationWidget(
                                consultations: state.info!.consultations),
                            SizeType.tablet => TabletConsultationWidget(
                                consultations: state.info!.consultations),
                            SizeType.pc => PcConsultationWidget(
                                consultations: state.info!.consultations),
                          };
                        },
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: SizedWidget(builder: (context, type) {
                      return switch (type) {
                        SizeType.mobile => MobileFooterWidget(
                            socialContacts: state.info!.socialContacts,
                            financeInfo: state.info!.financeInfo.first,
                          ),
                        SizeType.tablet => TabletFooterWidget(
                            socialContacts: state.info!.socialContacts,
                            financeInfo: state.info!.financeInfo.first,
                          ),
                        SizeType.pc => PcFooterWidget(
                            socialContacts: state.info!.socialContacts,
                            financeInfo: state.info!.financeInfo.first,
                          ),
                      };
                    }),
                  ),
                  const SizedBox(height: 24),
                  SizedWidget(
                    builder: (context, type) {
                      return switch (type) {
                        SizeType.mobile => SizedBox(),
                        SizeType.tablet || SizeType.pc => Container(
                            height: 30,
                            color: context.theme.colorScheme.secondary,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Text(
                                  '© 2020 – ${DateTime.now().year} help4kids.com.ua',
                                  style: context.theme.textTheme.titleSmall,
                                ),
                                Spacer(),
                                Text(
                                  'У разі надзвичайної ситуації дзвоніть 103',
                                  style: context.theme.textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ),
                      };
                    },
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
