import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/core/theme/theme_extension.dart';
import 'package:help4kids_front/gen/assets.gen.dart';

class TextInput extends StatefulWidget {
  final String? label;
  final String? hint;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final bool isPasswordField;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final bool readOnly;
  final TextCapitalization textCapitalization;
  final List<String>? autofillHints;
  final int? minLines;
  final int? maxLines;
  final bool autofocus;
  final Widget? suffixIcon;
  final Widget? suffix;
  final int? maxLength;
  final bool showCounter;
  final List<TextInputFormatter> inputFormatters;
  final VoidCallback? onTap;

  const TextInput({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.onChanged,
    this.errorText,
    this.isPasswordField = false,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.readOnly = false,
    this.textCapitalization = TextCapitalization.sentences,
    this.autofillHints,
    this.minLines,
    this.maxLines = 1,
    this.autofocus = false,
    this.suffixIcon,
    this.suffix,
    this.maxLength,
    this.showCounter = false,
    this.inputFormatters = const [],
    this.onTap,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late bool _isPasswordHidden;

  @override
  void initState() {
    _isPasswordHidden = widget.isPasswordField;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: widget.key,
      maxLength: widget.maxLength,
      readOnly: widget.readOnly,
      controller: widget.controller,
      obscureText: _isPasswordHidden,
      textCapitalization: widget.isPasswordField ||
              widget.keyboardType == TextInputType.emailAddress
          ? TextCapitalization.none
          : widget.textCapitalization,
      autofillHints: widget.autofillHints ??
          (widget.isPasswordField ? const [AutofillHints.password] : null),
      focusNode: widget.focusNode,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      autofocus: widget.autofocus,
      onTap: widget.onTap,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        alignLabelWithHint: true,
        counter: widget.showCounter ? null : const SizedBox(),
        error: widget.errorText != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      widget.errorText!,
                      style: context.theme.inputDecorationTheme.errorStyle,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              )
            : null,
        suffixIcon: widget.suffix ??
            widget.suffixIcon ??
            (widget.isPasswordField
                ? Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: _togglePasswordVisibility,
                      child: SvgPicture.asset(
                        _isPasswordHidden
                            ? Assets.icons.icEyeClosed
                            : Assets.icons.icEyeOpen,
                        colorFilter: ColorFilter.mode(
                            context
                                .theme.appColors.textPlainButtonForegroundColor,
                            BlendMode.srcIn),
                      ),
                    ),
                  )
                : null),
        suffixIconConstraints: widget.suffixIcon == null
            ? null
            : const BoxConstraints(maxHeight: 24, maxWidth: 44),
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20)
            .copyWith(right: 0),
      ),
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }
}
