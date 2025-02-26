part of 'about_widget.dart';

class PcAboutWidget extends StatelessWidget {
  const PcAboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .1),
      child: Row(
        children: [
          Flexible(flex: 3,child: DescriptionWidget(),),
          Spacer(),
          Flexible(flex: 2,child: DescriptionImage(),),
        ],
      ),
    );
  }
}
