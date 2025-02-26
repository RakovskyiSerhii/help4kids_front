import 'package:help4kids_front/core/either.dart';
import 'package:help4kids_front/core/failure/failure.dart';
import 'package:help4kids_front/data/model/general_info.dart';
import 'package:help4kids_front/data/model/landing.dart';
import 'package:help4kids_front/data/network/api.dart';
import 'package:help4kids_front/data/network/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LandingRepository extends BaseRepository {
  final ApiClient _apiClient;

  LandingRepository(this._apiClient);

  Future<Either<FailureException, LandingResponse>> getLanding() =>
      invokeRequest(_apiClient.getLandingData);

  Future<Either<FailureException, GeneralInfo>> getGeneral() =>
      invokeRequest(_apiClient.getGeneralInfo);
}
