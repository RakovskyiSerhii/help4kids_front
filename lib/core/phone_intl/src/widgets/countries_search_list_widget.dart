import 'package:flutter/material.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/core/phone_intl/src/models/country_model.dart';
import 'package:help4kids_front/core/phone_intl/src/utils/test/test_helper.dart';
import 'package:help4kids_front/core/phone_intl/src/utils/util.dart';
import 'package:help4kids_front/presentation/pages/widgets/text_input.dart';

/// Creates a list of Countries with a search textfield.
class CountrySearchListWidget extends StatefulWidget {
  final List<Country> countries;
  final InputDecoration? searchBoxDecoration;
  final String? locale;
  final ScrollController? scrollController;
  final bool autoFocus;
  final bool? showFlags;
  final bool? useEmoji;

  const CountrySearchListWidget(
    this.countries,
    this.locale, {
    super.key,
    this.searchBoxDecoration,
    this.scrollController,
    this.showFlags,
    this.useEmoji,
    this.autoFocus = false,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CountrySearchListWidgetState createState() =>
      _CountrySearchListWidgetState();
}

class _CountrySearchListWidgetState extends State<CountrySearchListWidget> {
  late final TextEditingController _searchController = TextEditingController();
  late List<Country> filteredCountries;

  @override
  void initState() {
    String value = _searchController.text.trim();
    filteredCountries = Utils.filterCountries(
      countries: widget.countries,
      locale: widget.locale,
      value: value,
    );
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Returns [InputDecoration] of the search box
  InputDecoration getSearchBoxDecoration() {
    return widget.searchBoxDecoration ??
        const InputDecoration(labelText: 'Search by country name or dial code');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextInput(
            key: const Key(TestHelper.countrySearchInputKeyValue),
            hint: 'Search',
            controller: _searchController,
            autofocus: widget.autoFocus,
            onChanged: (value) {
              String value = _searchController.text.trim();
              return setState(
                () => filteredCountries = Utils.filterCountries(
                  countries: widget.countries,
                  locale: widget.locale,
                  value: value,
                ),
              );
            },
          ),
        ),
        Flexible(
          child: ListView.separated(
            controller: widget.scrollController,
            shrinkWrap: true,
            itemCount: filteredCountries.length,
            itemBuilder: (BuildContext context, int index) {
              Country country = filteredCountries[index];
              return DirectionalCountryListTile(
                country: country,
                locale: widget.locale,
                showFlags: widget.showFlags!,
                useEmoji: widget.useEmoji!,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 8);
            },
          ),
        ),
      ],
    );
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}

class DirectionalCountryListTile extends StatelessWidget {
  final Country country;
  final String? locale;
  final bool showFlags;
  final bool useEmoji;

  const DirectionalCountryListTile({
    super.key,
    required this.country,
    required this.locale,
    required this.showFlags,
    required this.useEmoji,
  });

  @override
  Widget build(BuildContext context) {
   return SizedBox(
      key: Key(TestHelper.countryItemKeyValue(country.alpha2Code)),
      height: 60,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.of(context).pop(country),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                (showFlags
                    ? _Flag(country: country, useEmoji: useEmoji)
                    : const SizedBox()),
                const SizedBox(width: 8),
                Text(
                  '${Utils.getCountryName(country, locale)}',
                  textDirection: Directionality.of(context),
                  textAlign: TextAlign.start,
                  style: context.theme.textTheme.bodyMedium,
                ),
                const SizedBox(width: 8),

                Text(
                  country.dialCode ?? '',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.start,
                  style: context.theme.textTheme.bodyMedium,

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Flag extends StatelessWidget {
  final Country? country;
  final bool? useEmoji;

  const _Flag({this.country, this.useEmoji});

  @override
  Widget build(BuildContext context) {
    return country != null
        ? SizedBox(
            height: 32,
            width: 32,
            child: useEmoji!
                ? Text(
                    Utils.generateFlagEmojiUnicode(country?.alpha2Code ?? ''),
                    style: Theme.of(context).textTheme.headlineSmall,
                  )
                : country?.flagUri != null
                    ? CircleAvatar(
                        backgroundImage: AssetImage(
                          country!.flagUri,
                        ),
                      )
                    : const SizedBox.shrink(),
          )
        : const SizedBox.shrink();
  }
}
