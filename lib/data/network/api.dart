import 'package:dio/dio.dart';
import 'package:help4kids_front/data/model/article.dart';
import 'package:help4kids_front/data/model/article_category.dart';
import 'package:help4kids_front/data/model/consultation.dart';
import 'package:help4kids_front/data/model/consultation_appointment.dart';
import 'package:help4kids_front/data/model/course.dart';
import 'package:help4kids_front/data/model/finance_info.dart';
import 'package:help4kids_front/data/model/general_info.dart';
import 'package:help4kids_front/data/model/landing.dart';
import 'package:help4kids_front/data/model/order.dart';
import 'package:help4kids_front/data/model/service.dart';
import 'package:help4kids_front/data/model/social_contact.dart';
import 'package:help4kids_front/data/model/staff.dart';
import 'package:help4kids_front/data/model/unit.dart';
import 'package:help4kids_front/data/model/user.dart';

class ApiClient {
  ApiClient(this._dio, {required this.baseUrl});

  final Dio _dio;
  final String baseUrl;

  String _url(String path) => '$baseUrl$path';

  // Authentication endpoints
  Future<User> login(Map<String, dynamic> body) async {
    final response = await _dio.post<Map<String, dynamic>>(
      _url('/api/auth/login'),
      data: body,
    );
    return User.fromJson(response.data!);
  }

  Future<User> register(Map<String, dynamic> body) async {
    final response = await _dio.post<Map<String, dynamic>>(
      _url('/api/auth/register'),
      data: body,
    );
    return User.fromJson(response.data!);
  }

  Future<void> changePassword(Map<String, dynamic> body) async {
    await _dio.post<void>(
      _url('/api/auth/change-password'),
      data: body,
    );
  }

  Future<User> getUserProfile() async {
    final response = await _dio.get<Map<String, dynamic>>(
      _url('/api/auth/me'),
    );
    return User.fromJson(response.data!);
  }

  Future<void> verifyEmail(String token) async {
    await _dio.get<void>(
      _url('/api/auth/verify_email'),
      queryParameters: {'token': token},
    );
  }

  Future<void> resendEmail(Map<String, dynamic> body) async {
    await _dio.post<void>(
      _url('/api/auth/resend_email'),
      data: body,
    );
  }

  // Orders endpoints
  Future<Order> createOrder(Map<String, dynamic> body) async {
    final response = await _dio.post<Map<String, dynamic>>(
      _url('/api/orders'),
      data: body,
    );
    return Order.fromJson(response.data!);
  }

  Future<List<Order>> getOrdersByUser() async {
    final response = await _dio.get<List<dynamic>>(
      _url('/api/orders/me'),
    );
    return response.data!
        .map((e) => Order.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<Order> getOrderById(String orderId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      _url('/api/orders/$orderId'),
    );
    return Order.fromJson(response.data!);
  }

  // Courses endpoints
  Future<List<Course>> getAllCourses() async {
    final response = await _dio.get<List<dynamic>>(
      _url('/api/courses'),
    );
    return response.data!
        .map((e) => Course.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<Course>> getPurchasedCourses() async {
    final response = await _dio.get<List<dynamic>>(
      _url('/api/courses/me'),
    );
    return response.data!
        .map((e) => Course.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // Consultations endpoints
  Future<List<Consultation>> getAllConsultations() async {
    final response = await _dio.get<List<dynamic>>(
      _url('/api/consultations'),
    );
    return response.data!
        .map((e) => Consultation.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<Consultation>> getPurchasedConsultations() async {
    final response = await _dio.get<List<dynamic>>(
      _url('/api/consultations/me'),
    );
    return response.data!
        .map((e) => Consultation.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<Consultation> getConsultationById(String consultationId) async {
    // Backend route: /api/consultations/consultation/{consultationId}
    final response = await _dio.get<Map<String, dynamic>>(
      _url('/api/consultations/consultation/$consultationId'),
    );
    return Consultation.fromJson(response.data!);
  }

  // Services endpoints
  Future<List<Service>> getAllServices() async {
    final response = await _dio.get<List<dynamic>>(
      _url('/api/services'),
    );
    return response.data!
        .map((e) => Service.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<Service> getServiceById(String serviceId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      _url('/api/services/$serviceId'),
    );
    return Service.fromJson(response.data!);
  }

  // Articles endpoints
  Future<List<Article>> getAllArticles() async {
    final response = await _dio.get<List<dynamic>>(
      _url('/api/articles'),
    );
    return response.data!
        .map((e) => Article.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<Article> getArticleById(String articleId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      _url('/api/articles/$articleId'),
    );
    return Article.fromJson(response.data!);
  }

  // Article Categories endpoints
  Future<List<ArticleCategory>> getAllArticleCategories() async {
    final response = await _dio.get<List<dynamic>>(
      _url('/api/article-categories'),
    );
    return response.data!
        .map((e) => ArticleCategory.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // Consultation Appointments endpoints
  Future<List<ConsultationAppointment>> getAllAppointments() async {
    final response = await _dio.get<List<dynamic>>(
      _url('/api/consultation-appointments'),
    );
    return response.data!
        .map(
          (e) =>
              ConsultationAppointment.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }

  Future<ConsultationAppointment> getAppointmentById(
    String appointmentId,
  ) async {
    final response = await _dio.get<Map<String, dynamic>>(
      _url('/api/consultation-appointments/$appointmentId'),
    );
    return ConsultationAppointment.fromJson(response.data!);
  }

  // ===== Staff Endpoints =====
  Future<List<Staff>> getAllStaff() async {
    final response = await _dio.get<List<dynamic>>(
      _url('/api/staff'),
    );
    return response.data!
        .map((e) => Staff.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<Staff> getStaffById(String id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      _url('/api/staff/$id'),
    );
    return Staff.fromJson(response.data!);
  }

  Future<void> createStaff(Map<String, dynamic> body) async {
    await _dio.post<void>(
      _url('/api/staff/create'),
      data: body,
    );
  }

  // Landing / featured content
  Future<LandingResponse> getLandingData() async {
    final response = await _dio.get<Map<String, dynamic>>(
      _url('/api/landing'),
    );
    return LandingResponse.fromJson(response.data!);
  }

  // General Info public endpoint
  Future<GeneralInfo> getGeneralInfo() async {
    final response = await _dio.get<Map<String, dynamic>>(
      _url('/api/general_info'),
    );
    return GeneralInfo.fromJson(response.data!);
  }

  // Admin endpoints for general info pieces
  Future<List<Unit>> getUnits() async {
    final response = await _dio.get<List<dynamic>>(
      _url('/api/general_info/units'),
    );
    return response.data!
        .map((e) => Unit.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> updateUnits(Map<String, dynamic> body) async {
    await _dio.put<void>(
      _url('/api/general_info/units'),
      data: body,
    );
  }

  Future<List<SocialContact>> getSocialContacts() async {
    final response = await _dio.get<List<dynamic>>(
      _url('/api/general_info/social_contacts'),
    );
    return response.data!
        .map((e) => SocialContact.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> updateSocialContacts(Map<String, dynamic> body) async {
    await _dio.put<void>(
      _url('/api/general_info/social_contacts'),
      data: body,
    );
  }

  Future<List<FinanceInfo>> getFinanceInfo() async {
    final response = await _dio.get<List<dynamic>>(
      _url('/api/general_info/finance_info'),
    );
    return response.data!
        .map((e) => FinanceInfo.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> updateFinanceInfo(Map<String, dynamic> body) async {
    await _dio.put<void>(
      _url('/api/general_info/finance_info'),
      data: body,
    );
  }

  Future<List<Staff>> getStaff() async {
    final response = await _dio.get<List<dynamic>>(
      _url('/api/general_info/staff'),
    );
    return response.data!
        .map((e) => Staff.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> updateStaff(Map<String, dynamic> body) async {
    await _dio.put<void>(
      _url('/api/general_info/staff'),
      data: body,
    );
  }
}