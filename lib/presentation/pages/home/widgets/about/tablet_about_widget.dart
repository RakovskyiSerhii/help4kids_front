part of 'about_widget.dart';

class TabletAboutWidget extends StatelessWidget {
  const TabletAboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .05),
      child: Row(
        children: [
          Flexible(child: DescriptionWidget()),
          const SizedBox(width: 24),
          Flexible(child: DescriptionImage()),
        ],
      ),
    );
  }
}