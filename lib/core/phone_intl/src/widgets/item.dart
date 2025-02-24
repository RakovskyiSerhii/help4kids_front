import 'package:flutter/material.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/core/phone_intl/src/models/country_model.dart';
import 'package:help4kids_front/core/phone_intl/src/utils/util.dart';
import 'package:help4kids_front/core/theme/theme_extension.dart';

/// [Item]
class Item extends StatelessWidget {
  final Country? country;
  final bool? showFlag;
  final bool? useEmoji;
  final TextStyle? textStyle;
  final bool withCountryNames;
  final double? leadingPadding;
  final bool trailingSpace;

  const Item({
    super.key,
    this.country,
    this.showFlag,
    this.useEmoji,
    this.textStyle,
    this.withCountryNames = false,
    this.leadingPadding = 12,
    this.trailingSpace = true,
  });

  @override
  Widget build(BuildContext context) {
    String dialCode = (country?.dialCode ?? '');
    if (trailingSpace) {
      dialCode = dialCode.padRight(5, "   ");
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(width: leadingPadding),
        _Flag(
          country: country,
          showFlag: showFlag,
          useEmoji: useEmoji,
        ),
        const SizedBox(width: 12.0),
        Text(
          dialCode.trim(),
          textDirection: TextDirection.ltr,
          style: textStyle,
        ),
        const SizedBox(width: 12.0),
        Icon(
          Icons.keyboard_arrow_down_outlined,
          color: context.theme.appColors.secondaryTextColor,
        ),
        const SizedBox(width: 12.0),
        Container(
          width: 1,
          color: context.theme.appColors.borderColor,
          height: 15,
        )
      ],
    );
  }
}

class _Flag extends StatelessWidget {
  final Country? country;
  final bool? showFlag;
  final bool? useEmoji;

  const _Flag({this.country, this.showFlag, this.useEmoji});

  @override
  Widget build(BuildContext context) {
    return country != null && showFlag!
        ? ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: SizedBox(
              width: 20,
              height: 20,
              child: useEmoji!
                  ? Text(
                      Utils.generateFlagEmojiUnicode(country?.alpha2Code ?? ''),
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  : Image.asset(
                      country!.flagUri,
                      fit: BoxFit.fill,
                      // package: 'intl_phone_number_input',
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox.shrink();
                      },
                    ),
            ),
          )
        : const SizedBox.shrink();
  }
}
