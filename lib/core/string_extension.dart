import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/core/theme/theme_extension.dart';

extension EmojiString on String {
  bool get emojiOnly {
    return false;
    // var emojiRegex = RegExp(r'((?!' + emojiSequence + ')[^\s])+', multiLine: true);
    // var clear = replaceAll(emojiRegex, '');
    // return clear.isEmpty;
  }

  String get capitalizeFirstLetter {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  TextSpan formatTextWithMention(BuildContext context, TextStyle style,
      Function(String userId) onUserMentionTap) {
    List<TextSpan> children = [];
    var mentionRegex = RegExp(r'\[(.*?)\]\((.*?)\)', multiLine: true);
    splitMapJoin(mentionRegex, onMatch: (match) {
      var text = match.group(1);
      var mention = match.group(2);
      if (mention != null && mention.startsWith("mention:")) {
        var userId = mention.replaceFirst('mention:', '');
        children.add(TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () => onUserMentionTap(userId),
          text: text,
          style: TextStyle(
              color: context.theme.appColors.textAccentButtonForegroundColor),
        ));
      } else {
        children.add(TextSpan(text: text, style: style));
      }
      return '';
    }, onNonMatch: (text) {
      children.add(TextSpan(text: text, style: style));
      return '';
    });
    return TextSpan(children: children);
  }


  String formatMentionsToPlainText() {
    var text = this;
    var mentions = RegExp(r'\[(.*?)\]\((.*?)\)', multiLine: true)
        .allMatches(this)
        .toList();
    for (var mention in mentions) {
      var displayName = mention.group(1)!;
      text = text.replaceFirst(mention.group(0)!, '@$displayName');
    }
    return text;
  }
}
