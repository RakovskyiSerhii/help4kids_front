extension ListExtension<T> on List<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (var element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }

  T? lastWhereOrNull(bool Function(T) test) {
    try {
      return lastWhere(test);
    } catch (e) {
      return null;
    }
  }
}