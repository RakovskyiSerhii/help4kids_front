import 'package:dio/dio.dart';
import 'package:help4kids_front/data/model/finance_info.dart';
import 'package:help4kids_front/data/model/general_info.dart';
import 'package:help4kids_front/data/model/landing.dart';
import 'package:help4kids_front/data/model/social_contact.dart';
import 'package:help4kids_front/data/model/unit.dart';
import 'package:help4kids_front/data/model/user.dart';
import 'package:retrofit/retrofit.dart';
import 'package:help4kids_front/data/model/article.dart';
import 'package:help4kids_front/data/model/article_category.dart';
import 'package:help4kids_front/data/model/course.dart';
import 'package:help4kids_front/data/model/consultation.dart';
import 'package:help4kids_front/data/model/consultation_appointment.dart';
import 'package:help4kids_front/data/model/order.dart';
import 'package:help4kids_front/data/model/service.dart';
import 'package:help4kids_front/data/model/staff.dart';

part 'api.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // Authentication endpoints
  @POST("/api/auth/login")
  Future<User> login(@Body() Map<String, dynamic> body);

  @POST("/api/auth/register")
  Future<User> register(@Body() Map<String, dynamic> body);

  @POST("/api/auth/change-password")
  Future<void> changePassword(@Body() Map<String, dynamic> body);

  @GET("/api/auth/me")
  Future<User> getUserProfile();

  @GET("/api/auth/verify_email")
  Future<void> verifyEmail(@Query("token") String token);

  @POST("/api/auth/resend_email")
  Future<void> resendEmail(@Body() Map<String, dynamic> body);

  // Orders endpoints
  @POST("/api/orders")
  Future<Order> createOrder(@Body() Map<String, dynamic> body);

  @GET("/api/orders/me")
  Future<List<Order>> getOrdersByUser();

  @GET("/api/orders/{orderId}")
  Future<Order> getOrderById(@Path("orderId") String orderId);

  // Courses endpoints
  @GET("/api/courses")
  Future<List<Course>> getAllCourses();

  @GET("/api/courses/me")
  Future<List<Course>> getPurchasedCourses();

  // Consultations endpoints
  @GET("/api/consultations")
  Future<List<Consultation>> getAllConsultations();

  @GET("/api/consultations/me")
  Future<List<Consultation>> getPurchasedConsultations();

  @GET("/api/consultations/{consultationId}")
  Future<Consultation> getConsultationById(@Path("consultationId") String consultationId);

  // Services endpoints
  @GET("/api/services")
  Future<List<Service>> getAllServices();

  @GET("/api/services/{serviceId}")
  Future<Service> getServiceById(@Path("serviceId") String serviceId);

  // Articles endpoints
  @GET("/api/articles")
  Future<List<Article>> getAllArticles();

  @GET("/api/articles/{articleId}")
  Future<Article> getArticleById(@Path("articleId") String articleId);

  // Article Categories endpoints
  @GET("/api/article-categories")
  Future<List<ArticleCategory>> getAllArticleCategories();

  // Consultation Appointments endpoints
  @GET("/api/consultation-appointments")
  Future<List<ConsultationAppointment>> getAllAppointments();

  @GET("/api/consultation-appointments/{appointmentId}")
  Future<ConsultationAppointment> getAppointmentById(@Path("appointmentId") String appointmentId);

  // ===== New: Staff Endpoints =====
  @GET("/api/staff")
  Future<List<Staff>> getAllStaff();

  @GET("/api/staff/{id}")
  Future<Staff> getStaffById(@Path("id") String id);

  @POST("/api/staff/create")
  Future<void> createStaff(@Body() Map<String, dynamic> body);

  @GET('/api/landing')
  Future<LandingResponse> getLandingData();

  // General Info public endpoint
  @GET('/api/general_info')
  Future<GeneralInfo> getGeneralInfo();

  // If needed, you can add admin endpoints for updating units, social contacts, finance info, and staff:
  @GET('/api/general_info/units')
  Future<List<Unit>> getUnits();
  @PUT('/api/general_info/units')
  Future<void> updateUnits(@Body() Map<String, dynamic> body);

  @GET('/api/general_info/social_contacts')
  Future<List<SocialContact>> getSocialContacts();
  @PUT('/api/general_info/social_contacts')
  Future<void> updateSocialContacts(@Body() Map<String, dynamic> body);

  @GET('/api/general_info/finance_info')
  Future<List<FinanceInfo>> getFinanceInfo();
  @PUT('/api/general_info/finance_info')
  Future<void> updateFinanceInfo(@Body() Map<String, dynamic> body);

  @GET('/api/general_info/staff')
  Future<List<Staff>> getStaff();
  @PUT('/api/general_info/staff')
  Future<void> updateStaff(@Body() Map<String, dynamic> body);
}