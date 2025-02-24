import 'dart:async';
import 'dart:math';

// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart' show IterableExtension;
// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';
import 'package:help4kids_front/core/phone_intl/src/models/country_list.dart';
import 'package:help4kids_front/core/phone_intl/src/utils/phone_number/phone_number_util.dart';

/// Type of phone numbers.
enum PhoneNumberType {
  fixedLine, // : 0,
  mobile, //: 1,
  fixedLineOrMobile, //: 2,
  tollFree, //: 3,
  premiumRate, //: 4,
  sharedCost, //: 5,
  voip, //: 6,
  personalNumber, //: 7,
  pager, //: 8,
  uan, //: 9,
  voicemail, //: 10,
  unknown, //: -1
}

PhoneNumber? parsePhoneNumber(String fullNumber) {
  if (fullNumber.isEmpty) return null;
  var countries = Countries.countryList;
  var suitableCountries = <dynamic>[];
  for (var country in countries) {
    var dialCode = country['dial_code'];
    if (fullNumber.startsWith(dialCode)) {
      suitableCountries.add(country);
    }
  }
  if (suitableCountries.isEmpty) return null;
  suitableCountries.sort(
        (a, b) => a['dial_code']
        .toString()
        .length
        .compareTo(b['dial_code'].toString().length),
  );
  var country = suitableCountries.last;
  return PhoneNumber(
    phoneNumber: fullNumber,
    dialCode: country['dial_code'],
    isoCode: country['alpha_2_code'],
  );
}
/// [PhoneNumber] contains detailed information about a phone number
class PhoneNumber extends Equatable {
  /// Either formatted or unformatted String of the phone number
  final String? phoneNumber;

  /// The Country [dialCode] of the phone number
  final String? dialCode;

  /// Country [isoCode] of the phone number
  final String? isoCode;

  /// [_hash] is used to compare instances of [PhoneNumber] object.
  final int _hash;

  /// Returns an integer generated after the object was initialised.
  /// Used to compare different instances of [PhoneNumber]
  int get hash => _hash;

  @override
  List<Object?> get props => [phoneNumber, isoCode, dialCode];

  PhoneNumber({
    this.phoneNumber,
    this.dialCode,
    this.isoCode,
  }) : _hash = 1000 + Random().nextInt(99999 - 1000);

  @override
  String toString() {
    return 'PhoneNumber(phoneNumber: $phoneNumber, dialCode: $dialCode, isoCode: $isoCode)';
  }

  /// Returns [PhoneNumber] which contains region information about
  /// the [phoneNumber] and [isoCode] passed.
  static Future<PhoneNumber> getRegionInfoFromPhoneNumber(
    String phoneNumber, [
    String isoCode = '',
  ]) async {
    RegionInfo regionInfo = await PhoneNumberUtil.getRegionInfo(
        phoneNumber: phoneNumber, isoCode: isoCode);

    String? internationalPhoneNumber =
        await PhoneNumberUtil.normalizePhoneNumber(
      phoneNumber: phoneNumber,
      isoCode: regionInfo.isoCode ?? isoCode,
    );

    return PhoneNumber(
      phoneNumber: internationalPhoneNumber,
      dialCode: regionInfo.regionPrefix,
      isoCode: regionInfo.isoCode,
    );
  }

  /// Accepts a [PhoneNumber] object and returns a formatted phone number String
  static Future<String> getParsableNumber(PhoneNumber phoneNumber) async {
    if (phoneNumber.isoCode != null) {
      PhoneNumber number = await getRegionInfoFromPhoneNumber(
        phoneNumber.phoneNumber!,
        phoneNumber.isoCode!,
      );
      String? formattedNumber = await PhoneNumberUtil.formatAsYouType(
        phoneNumber: number.phoneNumber!,
        isoCode: number.isoCode!,
      );

      return formattedNumber!.replaceAll(
        RegExp('^([\\+]?${number.dialCode}[\\s]?)'),
        '',
      );
    } else {
      throw Exception('ISO Code is "${phoneNumber.isoCode}"');
    }
  }

  /// Returns a String of [phoneNumber] without [dialCode]
  String parseNumber() {
    return phoneNumber!.replaceAll("$dialCode", '').replaceAll('+', '');
  }



  /// For predefined phone number returns Country's [isoCode] from the dial code,
  /// Returns null if not found.
  static String? getISO2CodeByPrefix(String prefix) {
    if (prefix.isNotEmpty) {
      prefix = prefix.startsWith('+') ? prefix : '+$prefix';
      var country = Countries.countryList
          .firstWhereOrNull((country) => country['dial_code'] == prefix);
      if (country != null && country['alpha_2_code'] != null) {
        return country['alpha_2_code'];
      }
    }
    return null;
  }

  /// Returns [PhoneNumberType] which is the type of phone number
  /// Accepts [phoneNumber] and [isoCode] and r
  static Future<PhoneNumberType> getPhoneNumberType(
      String phoneNumber, String isoCode) async {
    PhoneNumberType type = await PhoneNumberUtil.getNumberType(
        phoneNumber: phoneNumber, isoCode: isoCode);

    return type;
  }
}
