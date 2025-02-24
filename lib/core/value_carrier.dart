import 'dart:async';

class ValueCarrier<T> {
  T _value;
  final StreamController<T> _streamController = StreamController<T>.broadcast();

  ValueCarrier(this._value);

  T get value => _value;
  Stream<T> get stream => _streamController.stream;

  set value(T value) {
    _value = value;
    _streamController.add(value);
  }
}

typedef AuthorizationStateCarrier = ValueCarrier<bool>;
