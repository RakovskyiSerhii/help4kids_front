import 'package:flutter/material.dart';
import 'package:help4kids_front/data/model/service_category.dart';
import 'package:help4kids_front/generated/assets.gen.dart';
import 'package:help4kids_front/presentation/pages/widgets/sized_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.serviceCategories});

  final List<ServiceCategory> serviceCategories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .1,
        vertical: 10,
      ),
      child: Row(
        children: [
          SizedBox(height: 40, child: Assets.icons.helpkidsLogo.image()),
          Spacer(),
          SizedWidget(
            builder: (context, type) {
              return switch (type) {
                SizeType.mobile => IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
                SizeType.pc || SizeType.tablet => Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Головна'),
                    ),
                    PopupMenuButton(
                      child: Text('Наші послуги'),
                      itemBuilder: (context) {
                        return serviceCategories.map(
                          (e) {
                            return PopupMenuItem(
                              child: Text(e.name),
                              onTap: () {},
                            );
                          },
                        ).toList();
                      },
                    ),
                  ],
                )
              };
            },
          ),
        ],
      ),
    );
  }
}
