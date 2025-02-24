import 'package:flutter/material.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/core/phone_intl/src/models/country_model.dart';
import 'package:help4kids_front/core/phone_intl/src/utils/selector_config.dart';
import 'package:help4kids_front/core/phone_intl/src/utils/test/test_helper.dart';
import 'package:help4kids_front/core/phone_intl/src/widgets/countries_search_list_widget.dart';
import 'package:help4kids_front/core/phone_intl/src/widgets/input_widget.dart';
import 'package:help4kids_front/core/phone_intl/src/widgets/item.dart';

/// [SelectorButton]
class SelectorButton extends StatelessWidget {
  final List<Country> countries;
  final Country? country;
  final SelectorConfig selectorConfig;
  final TextStyle? selectorTextStyle;
  final InputDecoration? searchBoxDecoration;
  final bool autoFocusSearchField;
  final String? locale;
  final bool isEnabled;
  final bool isScrollControlled;

  final ValueChanged<Country?> onCountryChanged;

  const SelectorButton({
    super.key,
    required this.countries,
    required this.country,
    required this.selectorConfig,
    required this.selectorTextStyle,
    required this.searchBoxDecoration,
    required this.autoFocusSearchField,
    required this.locale,
    required this.onCountryChanged,
    required this.isEnabled,
    required this.isScrollControlled,
  });

  @override
  Widget build(BuildContext context) {
    return selectorConfig.selectorType == PhoneInputSelectorType.dropdown
        ? countries.isNotEmpty && countries.length > 1
            ? DropdownButtonHideUnderline(
                child: DropdownButton<Country>(
                  key: const Key(TestHelper.dropdownButtonKeyValue),
                  hint: Item(
                    country: country,
                    showFlag: selectorConfig.showFlags,
                    useEmoji: selectorConfig.useEmoji,
                    leadingPadding: selectorConfig.leadingPadding,
                    trailingSpace: selectorConfig.trailingSpace,
                    textStyle: selectorTextStyle,
                  ),
                  value: country,
                  items: mapCountryToDropdownItem(countries),
                  onChanged: isEnabled ? onCountryChanged : null,
                ),
              )
            : Item(
                country: country,
                showFlag: selectorConfig.showFlags,
                useEmoji: selectorConfig.useEmoji,
                leadingPadding: selectorConfig.leadingPadding,
                trailingSpace: selectorConfig.trailingSpace,
                textStyle: selectorTextStyle,
              )
        : MaterialButton(
            key: const Key(TestHelper.dropdownButtonKeyValue),
            padding: EdgeInsets.zero,
            minWidth: 0,
            onPressed: countries.isNotEmpty && countries.length > 1 && isEnabled
                ? () async {
                    Country? selected;
                    if (selectorConfig.selectorType ==
                        PhoneInputSelectorType.bottomSheet) {
                      selected = await showCountrySelectorBottomSheet(
                        context,
                        countries,
                      );
                    } else {
                      selected =
                          await showCountrySelectorDialog(context, countries);
                    }

                    if (selected != null) {
                      onCountryChanged(selected);
                    }
                  }
                : null,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Item(
                country: country,
                showFlag: selectorConfig.showFlags,
                useEmoji: selectorConfig.useEmoji,
                leadingPadding: selectorConfig.leadingPadding,
                trailingSpace: selectorConfig.trailingSpace,
                textStyle: selectorTextStyle,
              ),
            ),
          );
  }

  /// Converts the list [countries] to `DropdownMenuItem`
  List<DropdownMenuItem<Country>> mapCountryToDropdownItem(
      List<Country> countries) {
    return countries.map((country) {
      return DropdownMenuItem<Country>(
        value: country,
        child: Item(
          key: Key(TestHelper.countryItemKeyValue(country.alpha2Code)),
          country: country,
          showFlag: selectorConfig.showFlags,
          useEmoji: selectorConfig.useEmoji,
          textStyle: selectorTextStyle,
          withCountryNames: false,
          trailingSpace: selectorConfig.trailingSpace,
        ),
      );
    }).toList();
  }

  /// shows a Dialog with list [countries] if the [PhoneInputSelectorType.dialog] is selected
  Future<Country?> showCountrySelectorDialog(
      BuildContext inheritedContext, List<Country> countries) {
    return showDialog(
      context: inheritedContext,
      barrierDismissible: true,
      builder: (BuildContext context) => AlertDialog(
        content: Directionality(
          textDirection: Directionality.of(inheritedContext),
          child: SizedBox(
            width: double.maxFinite,
            child: CountrySearchListWidget(
              countries,
              locale,
              searchBoxDecoration: searchBoxDecoration,
              showFlags: selectorConfig.showFlags,
              useEmoji: selectorConfig.useEmoji,
              autoFocus: autoFocusSearchField,
            ),
          ),
        ),
      ),
    );
  }

  /// shows a Dialog with list [countries] if the [PhoneInputSelectorType.bottomSheet] is selected
  Future<Country?> showCountrySelectorBottomSheet(
      BuildContext inheritedContext, List<Country> countries) {
    return showModalBottomSheet(
      context: inheritedContext,
      clipBehavior: Clip.hardEdge,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.5,
            ),
            decoration:  BoxDecoration(
              color: context.theme.scaffoldBackgroundColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: CountrySearchListWidget(
                    countries,
                    locale,
                    searchBoxDecoration: searchBoxDecoration,
                    showFlags: selectorConfig.showFlags,
                    useEmoji: selectorConfig.useEmoji,
                    autoFocus: autoFocusSearchField,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
