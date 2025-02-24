// File: lib/repositories/order_repository.dart
import 'package:help4kids_front/core/either.dart';
import 'package:help4kids_front/core/failure/failure.dart';
import 'package:help4kids_front/data/model/order.dart' as order;
import 'package:help4kids_front/data/network/api.dart';
import 'package:injectable/injectable.dart';
import 'base_repository.dart';

@lazySingleton
class OrderRepository extends BaseRepository {
  final ApiClient _apiClient;
  OrderRepository(this._apiClient);

  Future<Either<Failure, order.Order>> createOrder(Map<String, dynamic> orderData) async {
    return invokeRequest(() => _apiClient.createOrder(orderData));
  }

  Future<Either<Failure, List<order.Order>>> getOrdersByUser() async {
    return invokeRequest(() => _apiClient.getOrdersByUser());
  }

  Future<Either<Failure, order.Order>> getOrderById(String orderId) async {
    return invokeRequest(() => _apiClient.getOrderById(orderId));
  }
}