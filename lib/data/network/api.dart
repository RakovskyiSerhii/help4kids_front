import 'package:dio/dio.dart';
import 'package:help4kids_front/data/model/article.dart';
import 'package:help4kids_front/data/model/article_category.dart';
import 'package:help4kids_front/data/model/consultation.dart';
import 'package:help4kids_front/data/model/consultation_appointment.dart';
import 'package:help4kids_front/data/model/course.dart';
import 'package:help4kids_front/data/model/order.dart';
import 'package:help4kids_front/data/model/service.dart';
import 'package:help4kids_front/data/model/user.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: "https://api.help4kids.com")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // ====================
  // Authentication Endpoints
  // ====================

  @POST("/api/auth/login")
  Future<User> login(@Body() Map<String, dynamic> body);

  @POST("/api/auth/register")
  Future<User> register(@Body() Map<String, dynamic> body);

  @POST("/api/auth/change-password")
  Future<void> changePassword(@Body() Map<String, dynamic> body);

  @GET("/api/auth/me")
  Future<User> getUserProfile();

  // The verification endpoint accepts a query parameter for the token.
  @GET("/api/auth/verify_email")
  Future<void> verifyEmail(@Query("token") String token);

  // Resend email endpoint uses a POST request with a JSON body.
  @POST("/api/auth/resend_email")
  Future<void> resendEmail(@Body() Map<String, dynamic> body);

  // ====================
  // Orders Endpoints
  // ====================
  @POST("/api/orders")
  Future<Order> createOrder(@Body() Map<String, dynamic> body);

  @GET("/api/orders/me")
  Future<List<Order>> getOrdersByUser();

  @GET("/api/orders/{orderId}")
  Future<Order> getOrderById(@Path("orderId") String orderId);

  // ====================
  // Courses Endpoints
  // ====================
  @GET("/api/courses")
  Future<List<Course>> getAllCourses();

  @GET("/api/courses/me")
  Future<List<Course>> getPurchasedCourses();

  // ====================
  // Consultations Endpoints
  // ====================
  @GET("/api/consultations")
  Future<List<Consultation>> getAllConsultations();

  @GET("/api/consultations/me")
  Future<List<Consultation>> getPurchasedConsultations();

  @GET("/api/consultations/{consultationId}")
  Future<Consultation> getConsultationById(@Path("consultationId") String consultationId);

  // ====================
  // Services Endpoints
  // ====================
  @GET("/api/services")
  Future<List<Service>> getAllServices();

  @GET("/api/services/{serviceId}")
  Future<Service> getServiceById(@Path("serviceId") String serviceId);

  // ====================
  // Articles Endpoints
  // ====================
  @GET("/api/articles")
  Future<List<Article>> getAllArticles();

  @GET("/api/articles/{articleId}")
  Future<Article> getArticleById(@Path("articleId") String articleId);

  // ====================
  // Article Categories Endpoints
  // ====================
  @GET("/api/article-categories")
  Future<List<ArticleCategory>> getAllArticleCategories();

  // ====================
  // Consultation Appointments Endpoints
  // ====================
  @GET("/api/consultation-appointments")
  Future<List<ConsultationAppointment>> getAllAppointments();

  @GET("/api/consultation-appointments/{appointmentId}")
  Future<ConsultationAppointment> getAppointmentById(@Path("appointmentId") String appointmentId);

}