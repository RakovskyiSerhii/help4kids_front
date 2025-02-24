import 'dart:async';

import 'package:flutter/foundation.dart';

/// Debounces value changes by updating [onChanged], [nextValue], and [values]
/// only after [duration] has elapsed without additional changes.
class Debouncer<T> extends Observable<T> {
  Debouncer(this.duration, {required super.initialValue, super.onChanged, super.checkEquality});
  final Duration duration;
  Timer? _timer;

  /// The most recent value, without waiting for the debounce timer to expire.
  @override
  T get value => super.value;

  @override
  void notify(T val) {
    _timer?.cancel();
    _timer = Timer(duration, () {
      if (!canceled) {
        super.notify(val);
      }
    });
  }

  void cancelCurrentTask() {
    _timer?.cancel();
  }

  @override
  @mustCallSuper
  void cancel() {
    super.cancel();
    _timer?.cancel();
  }
}

/// Throttles value changes by updating [onChanged], [nextValue], and [values]
/// once per [duration] at most.
class Throttle<T> extends Observable<T> {
  Throttle(this.duration, {required super.initialValue, super.onChanged, super.checkEquality});
  final Duration duration;
  Timer? _timer;
  bool _dirty = false;

  /// The most recent value, without waiting for the throttle timer to expire.
  @override
  T get value => super.value;

  Timer _makeTimer() => Timer(duration, () {
    if (!canceled) {
      if (_dirty) {
        _dirty = false;
        _timer = _makeTimer();
        super.notify(value);
      } else {
        _timer = null;
      }
    }
  });

  @override
  void notify(T val) {
    if (_timer == null) {
      _dirty = false;
      super.notify(val);
      _timer = _makeTimer();
    } else {
      _dirty = true;
    }
  }

  @override
  @mustCallSuper
  void cancel() {
    super.cancel();
    _timer?.cancel();
  }
}

/// Observe value changes using a `Future`, `Stream`, and/or a callback.
class Observable<T> {
  Observable({required T initialValue, this.onChanged, this.checkEquality = true}) : _value = initialValue;

  /// If true, setting the [value] will only notifiy if the new value is different
  /// than the current value.
  final bool checkEquality;
  final void Function(T value)? onChanged;

  var _completer = Completer<T>();

  bool _canceled = false;
  bool get canceled => _canceled;

  T _value;

  /// The current value of this observable.
  T get value => _value;
  set value(T val) {
    if (!canceled && (!checkEquality || _value != val)) {
      _value = val;
      // Delaying notify() allows the Future and Stream to update correctly.
      Future.delayed(Duration.zero, () => notify(val));
    }
  }

  /// Alias for [value] setter. Good for passing to a Future or Stream.
  void setValue(T val) => value = val;

  @protected
  @mustCallSuper
  void notify(T val) {
    if (onChanged != null) onChanged!(val);
    var tmp = _completer;
    _completer = Completer<T>();
    tmp.complete(val);
  }

  Future<T> get nextValue => _completer.future;
  Stream<T> get values async* {
    while (!canceled) {
      yield await nextValue;
    }
  }

  /// Permanently disables this observable. Further changes to [value] will be
  /// ignored, the outputs [onChanged], [nextValue], and [values] will not be
  /// called again.
  @mustCallSuper
  void cancel() => _canceled = true;
}