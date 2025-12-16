import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:help4kids_front/core/result.dart';
import 'package:help4kids_front/data/model/service.dart';
import 'package:help4kids_front/data/model/service_category.dart';

part 'services_state.freezed.dart';

@freezed
class ServicesState with _$ServicesState {
  factory ServicesState({
    List<ServiceCategory>? categories,
    List<Service>? services,
    Result? loadResult,
  }) = _ServicesState;
}
