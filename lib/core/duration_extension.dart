extension FormattedDuration on Duration {
  String get formatted {
    var minutes = inMinutes.remainder(60).toString().padLeft(2, '0');
    var seconds = inSeconds.remainder(60).toString().padLeft(2, '0');
    if (inHours == 0) return '$minutes:$seconds';
    return '$inHours:$minutes:$seconds';
  }
}
