import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/data/model/social_contact.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialContactWidget extends StatelessWidget {
  const SocialContactWidget({super.key, required this.socialContacts});

  final List<SocialContact> socialContacts;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              launchUrl(Uri.parse(socialContacts[index].url));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.instagram, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    socialContacts[index].name,
                    style: context.theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: socialContacts.length,
    );
  }
}
