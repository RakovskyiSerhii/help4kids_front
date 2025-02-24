extension FormattedInt on int {
  String get formattedFileSize {
    if (this < 1024) {
      return '$this B';
    }
    var kb = this / 1024;
    if (kb < 1024) {
      return '${kb.toStringAsFixed(2)} KB';
    }
    var mb = kb / 1024;
    if (mb < 1024) {
      return '${mb.toStringAsFixed(2)} MB';
    }
    var gb = mb / 1024;
    return '${gb.toStringAsFixed(2)} GB';
  }
}
