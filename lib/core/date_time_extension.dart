extension SerialazableDateTime on DateTime {
  static DateTime? fromJson(int? json) => json == null ? null : DateTime.fromMillisecondsSinceEpoch(json);
  static int? toJson(DateTime? dateTime) => dateTime?.millisecondsSinceEpoch;
}
