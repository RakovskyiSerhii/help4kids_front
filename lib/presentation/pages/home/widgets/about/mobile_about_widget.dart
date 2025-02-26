part of 'about_widget.dart';

class MobileAboutWidget extends StatelessWidget {
  const MobileAboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: DescriptionWidget(),
    );
  }
}
