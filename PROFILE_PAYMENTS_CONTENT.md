# Profile, Payments & Content - Frontend Documentation

## 📋 Table of Contents

1. [Overview](#overview)
2. [Current Implementation Status](#current-implementation-status)
3. [Architecture](#architecture)
4. [Data Models](#data-models)
5. [API Integration](#api-integration)
6. [Payment Flow](#payment-flow)
7. [Profile Screen](#profile-screen)
8. [Content Management (Courses)](#content-management-courses)
9. [Admin UI for Content Creation](#admin-ui-for-content-creation)
10. [State Management](#state-management)
11. [Routing](#routing)
12. [Future Enhancements](#future-enhancements)

---

## Overview

This document describes the frontend implementation of three core features:
- **Profile**: User account management and personal information
- **Payments**: Order creation and payment processing
- **Content**: Course management and video content delivery

These features are interconnected: users purchase content (courses/consultations) through the payment system, and their purchases are displayed in their profile.

---

## Current Implementation Status

### ✅ Implemented

#### Backend Integration
- ✅ **API Client** (`lib/data/network/api.dart`)
  - User authentication endpoints
  - Order creation and retrieval
  - Course listing and purchased courses
  - Consultation endpoints

#### Data Models
- ✅ **User Model** (`lib/data/model/user.dart`)
  - User profile data structure
  - Authentication fields

- ✅ **Order Model** (`lib/data/model/order.dart`)
  - Order status enum: `pending`, `paid`, `failed`
  - Service types: `course`, `consultation`, `service`
  - Order metadata (amount, dates, references)

- ✅ **Course Model** (`lib/data/model/course.dart`)
  - Course information structure
  - `contentUrl` for video content
  - Pricing and metadata

#### Repositories
- ✅ **UserRepository** (`lib/data/network/repository/user_repository.dart`)
  - Login, register, get profile
  - Email verification

- ✅ **OrderRepository** (`lib/data/network/repository/order_repository.dart`)
  - Create order
  - Get user orders
  - Get order by ID

#### UI Components
- ✅ **PaymentSuccessScreen** (`lib/presentation/pages/payment_success/payment_success_screen.dart`)
  - Success confirmation screen
  - Navigation back to home

#### Routing
- ✅ Profile route: `/profile`
- ✅ Payment success route: `/payment/success`

### ❌ Not Implemented

#### Profile Screen
- ❌ **ProfileScreen** (`lib/presentation/pages/profile/profile_screen.dart`)
  - Currently empty stub (returns `Container()`)
  - Needs: User info display, Orders list, Courses list, Logout

#### State Management
- ❌ **ProfileCubit/Bloc**
  - No state management for profile screen
  - Needs: Loading states, error handling, data refresh

#### Payment Flow UI
- ❌ Payment initiation UI
- ❌ Order creation UI
- ❌ Payment redirect handling

#### Content Display
- ❌ Course list screen implementation
- ❌ Course detail screen
- ❌ Video player integration
- ❌ Purchased courses display

#### Admin UI
- ❌ Admin authentication/authorization check
- ❌ Admin dashboard/panel
- ❌ Content creation forms (Courses, Consultations, Articles, Services)
- ❌ Content editing UI
- ❌ Content deletion UI
- ❌ File upload UI (images, videos)
- ❌ Featured content management UI

---

## Architecture

### Directory Structure

```
lib/
├── core/
│   ├── config/
│   │   └── app_config.dart          # API base URL configuration
│   ├── routing/
│   │   ├── router.dart              # GoRouter configuration
│   │   └── screens.dart             # Screen route names
│   └── di/
│       └── app_module.dart          # Dependency injection
│
├── data/
│   ├── model/
│   │   ├── user.dart                # User model
│   │   ├── order.dart               # Order model
│   │   └── course.dart              # Course model
│   ├── network/
│   │   ├── api.dart                 # API client
│   │   └── repository/
│   │       ├── base_repository.dart # Base error handling
│   │       ├── user_repository.dart # User operations
│   │       └── order_repository.dart # Order operations
│
└── presentation/
    └── pages/
        ├── profile/
        │   └── profile_screen.dart   # Profile UI (stub)
        └── payment_success/
            └── payment_success_screen.dart # Payment success UI
```

### Data Flow

```
UI Layer (Widgets)
    ↓
State Management (Cubit/Bloc) [TODO]
    ↓
Repository Layer (UserRepository, OrderRepository)
    ↓
API Client (ApiClient)
    ↓
Backend API
```

---

## Data Models

### User Model

**Location**: `lib/data/model/user.dart`

```dart
@freezed
sealed class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String passwordHash,
    required String firstName,
    required String lastName,
    required String roleId,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? createdBy,
    String? updatedBy,
  }) = _User;
}
```

**Fields**:
- `id`: Unique user identifier
- `email`: User email address
- `firstName`, `lastName`: User name
- `roleId`: User role (for permissions)
- `createdAt`, `updatedAt`: Timestamps

### Order Model

**Location**: `lib/data/model/order.dart`

```dart
enum ServiceType { course, consultation, service }
enum OrderStatus { pending, paid, failed }

@freezed
sealed class Order with _$Order {
  const factory Order({
    required String id,
    required String userId,
    required String orderReference,
    required ServiceType serviceType,
    required String serviceId,
    required double amount,
    required OrderStatus status,
    required DateTime purchaseDate,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Order;
}
```

**Fields**:
- `id`: Order identifier
- `userId`: Associated user ID
- `orderReference`: Payment provider reference
- `serviceType`: Type of service purchased
- `serviceId`: ID of the purchased service/course
- `amount`: Order amount
- `status`: Current order status
- `purchaseDate`: When the order was created

### Course Model

**Location**: `lib/data/model/course.dart`

```dart
@freezed
sealed class Course with _$Course {
  const factory Course({
    required String id,
    required String title,
    required String shortDescription,
    String? longDescription,
    String? image,
    required String icon,
    required double price,
    int? duration,
    required String contentUrl,  // Video content URL
    @Default(false) bool featured,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? createdBy,
    String? updatedBy,
  }) = _Course;
}
```

**Fields**:
- `id`: Course identifier
- `title`: Course title
- `shortDescription`, `longDescription`: Course descriptions
- `image`, `icon`: Visual assets
- `price`: Course price
- `duration`: Course duration (optional, in minutes)
- `contentUrl`: **Video content URL** (critical for video playback)
- `featured`: Whether course is featured

---

## API Integration

### API Client

**Location**: `lib/data/network/api.dart`

#### User Endpoints

```dart
// Get current user profile
Future<User> getUserProfile() async {
  final response = await _dio.get<Map<String, dynamic>>(
    _url('/api/auth/me'),
  );
  return User.fromJson(response.data!);
}
```

#### Order Endpoints

```dart
// Create a new order
Future<Order> createOrder(Map<String, dynamic> body) async {
  final response = await _dio.post<Map<String, dynamic>>(
    _url('/api/orders'),
    data: body,
  );
  return Order.fromJson(response.data!);
}

// Get user's orders
Future<List<Order>> getOrdersByUser() async {
  final response = await _dio.get<List<dynamic>>(
    _url('/api/orders/me'),
  );
  return response.data!
      .map((e) => Order.fromJson(e as Map<String, dynamic>))
      .toList();
}

// Get order by ID
Future<Order> getOrderById(String orderId) async {
  final response = await _dio.get<Map<String, dynamic>>(
    _url('/api/orders/$orderId'),
  );
  return Order.fromJson(response.data!);
}
```

#### Course Endpoints

```dart
// Get all available courses
Future<List<Course>> getAllCourses() async {
  final response = await _dio.get<List<dynamic>>(
    _url('/api/courses'),
  );
  return response.data!
      .map((e) => Course.fromJson(e as Map<String, dynamic>))
      .toList();
}

// Get user's purchased courses
Future<List<Course>> getPurchasedCourses() async {
  final response = await _dio.get<List<dynamic>>(
    _url('/api/courses/me'),
  );
  return response.data!
      .map((e) => Course.fromJson(e as Map<String, dynamic>))
      .toList();
}
```

### Repository Pattern

**Base Repository**: `lib/data/network/repository/base_repository.dart`

All repositories extend `BaseRepository` which provides:
- Error handling wrapper (`invokeRequest`)
- Consistent error response format
- Failure exception handling

**Example Usage**:

```dart
@lazySingleton
class OrderRepository extends BaseRepository {
  final ApiClient _apiClient;
  OrderRepository(this._apiClient);

  Future<Either<FailureException, Order>> createOrder(
    Map<String, dynamic> orderData
  ) async {
    return invokeRequest(() => _apiClient.createOrder(orderData));
  }
}
```

---

## Payment Flow

### Current Flow

1. **Order Creation**
   - User initiates purchase (course/consultation)
   - Frontend calls `OrderRepository.createOrder()`
   - Backend creates order and returns `Order` object
   - Order includes `paymentUrl` (from backend response)

2. **Payment Redirect**
   - Frontend redirects user to `paymentUrl`
   - User completes payment on payment provider's page
   - Payment provider redirects back to app

3. **Payment Success**
   - User lands on `/payment/success` route
   - `PaymentSuccessScreen` displays success message
   - User can navigate back to home

### Payment Flow Diagram

```
User clicks "Purchase"
    ↓
Create Order (POST /api/orders)
    ↓
Backend returns Order with paymentUrl
    ↓
Redirect to paymentUrl (external)
    ↓
User completes payment
    ↓
Payment provider redirects to /payment/success
    ↓
PaymentSuccessScreen displays
    ↓
User navigates to profile to see order
```

### Order Creation Payload

```dart
{
  "serviceType": "course",  // or "consultation", "service"
  "serviceId": "course-id-123",
  "amount": 99.99
}
```

### Payment Status Updates

- **Backend handles status updates** via payment webhook
- Frontend should refresh order data when user returns from payment
- Order status can be: `pending`, `paid`, `failed`

### TODO: Payment Flow Enhancements

- [ ] Add payment status polling (optional)
- [ ] Handle payment cancellation
- [ ] Show pending payment status in UI
- [ ] Auto-refresh orders after payment return

---

## Profile Screen

### Current State

**Location**: `lib/presentation/pages/profile/profile_screen.dart`

Currently returns an empty `Container()`. Needs full implementation.

### Required Implementation

#### 1. Profile Screen Layout

```dart
class ProfileScreen extends StatelessWidget {
  // Should display:
  // - User info (name, email)
  // - My Orders section
  // - My Courses section
  // - My Appointments section (future)
  // - Logout button
}
```

#### 2. State Management

Create `ProfileCubit`:

```dart
// lib/presentation/cubit/profile_cubit.dart
class ProfileCubit extends Cubit<ProfileState> {
  final UserRepository _userRepository;
  final OrderRepository _orderRepository;
  final CourseRepository _courseRepository;

  ProfileCubit(
    this._userRepository,
    this._orderRepository,
    this._courseRepository,
  ) : super(ProfileInitial());

  Future<void> loadProfile() async {
    emit(ProfileLoading());
    
    final userResult = await _userRepository.getProfile();
    final ordersResult = await _orderRepository.getOrdersByUser();
    final coursesResult = await _courseRepository.getPurchasedCourses();

    // Handle results and emit ProfileLoaded state
  }
}
```

#### 3. Profile Sections

**User Info Section**:
- Display user name (`firstName`, `lastName`)
- Display email
- Profile picture (if available)

**My Orders Section**:
- List of user's orders
- Order status badges (Pending, Paid, Failed)
- Order amount and date
- Service type indicator

**My Courses Section**:
- List of purchased courses
- Course thumbnails
- Tap to navigate to course detail/video player

**Logout Button**:
- Clear authentication state
- Navigate to login screen

### Profile Screen Structure

```
ProfileScreen
├── AppBar (Profile)
├── UserInfoCard
│   ├── Avatar
│   ├── Name
│   └── Email
├── OrdersSection
│   ├── Section Header ("My Orders")
│   └── OrdersList
│       └── OrderCard (for each order)
├── CoursesSection
│   ├── Section Header ("My Courses")
│   └── CoursesList
│       └── CourseCard (for each course)
└── LogoutButton
```

---

## Content Management (Courses)

### Course Listing

**API Endpoint**: `GET /api/courses`

**Repository Method**: `CourseRepository.getAllCourses()`

**Display Requirements**:
- Course grid/list view
- Course cards with:
  - Thumbnail/image
  - Title
  - Short description
  - Price
  - Featured badge (if applicable)

### Course Detail

**Required Screen**: Course detail page showing:
- Full course information
- Long description
- Price
- Purchase button (if not purchased)
- "Access Course" button (if purchased)
- Video player (if purchased)

### Purchased Courses

**API Endpoint**: `GET /api/courses/me`

**Repository Method**: `CourseRepository.getPurchasedCourses()`

**Display**:
- Show in Profile screen
- Allow direct access to video content
- Display course progress (if implemented)

### Video Content

**Course Model Field**: `contentUrl` (String)

**Video Player Requirements**:
- Use Flutter `video_player` package
- Optional: Use `chewie` for better UI
- Handle video loading states
- Support play/pause controls
- Fullscreen support

**Video Player Implementation**:

```dart
// Example structure
class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  
  // Use video_player package
  // Initialize VideoPlayerController
  // Display video with controls
}
```

### Course Purchase Flow

```
User views course detail
    ↓
Clicks "Purchase" button
    ↓
Create Order (serviceType: "course", serviceId: course.id)
    ↓
Redirect to payment URL
    ↓
After payment success
    ↓
Course appears in "My Courses"
    ↓
User can access video content
```

---

## Admin UI for Content Creation

### Overview

Admins need a comprehensive interface to create, edit, and manage all content types in the system. This includes courses, consultations, articles, services, and staff members.

### Current Status

#### ✅ Implemented
- ✅ **Staff Creation API** (`POST /api/staff/create`)
- ✅ **General Info Admin Endpoints** (Units, Social Contacts, Finance Info, Staff)
  - `GET /api/general_info/units`
  - `PUT /api/general_info/units`
  - `GET /api/general_info/social_contacts`
  - `PUT /api/general_info/social_contacts`
  - `GET /api/general_info/finance_info`
  - `PUT /api/general_info/finance_info`
  - `GET /api/general_info/staff`
  - `PUT /api/general_info/staff`

#### ❌ Not Implemented
- ❌ Admin authentication/authorization check (roleId-based)
- ❌ Admin dashboard/panel
- ❌ Content creation forms (Courses, Consultations, Articles, Services)
- ❌ Content editing UI
- ❌ Content deletion UI
- ❌ File upload UI (images, videos)
- ❌ Featured content management UI

---

### Admin Authentication & Authorization

#### User Role Check

**User Model Field**: `roleId` (String)

**Implementation**:
```dart
// Check if user is admin
bool isAdmin(User user) {
  // Backend should provide admin roleId
  // Example: return user.roleId == 'admin' || user.roleId == 'ADMIN';
  // TODO: Verify actual admin roleId value from backend
}

// Usage in UI
BlocBuilder<UserCubit, UserState>(
  builder: (context, state) {
    if (state.user != null && isAdmin(state.user!)) {
      return AdminDashboardButton();
    }
    return SizedBox.shrink();
  },
)
```

#### Admin Route Protection

**Location**: `lib/core/routing/router.dart`

```dart
// Admin routes should check authentication
GoRoute(
  path: '/admin',
  name: Screen.admin,
  redirect: (context, state) {
    final user = context.read<UserCubit>().state.user;
    if (user == null || !isAdmin(user)) {
      return '/'; // Redirect to home if not admin
    }
    return null; // Allow access
  },
  pageBuilder: (context, state) => _noTransitionPage(
    const AdminDashboardScreen(),
    key: state.pageKey,
  ),
),
```

---

### Admin Dashboard

**Location**: `lib/presentation/pages/admin/admin_dashboard_screen.dart`

**Structure**:
```
AdminDashboardScreen
├── AppBar ("Admin Panel")
├── Navigation Tabs/Sections
│   ├── Courses Management
│   ├── Consultations Management
│   ├── Articles Management
│   ├── Services Management
│   ├── Staff Management
│   └── Settings (General Info)
└── Content List/Grid View
```

**Features**:
- Overview statistics (total courses, consultations, etc.)
- Quick actions (Create New Course, Create New Consultation, etc.)
- Recent content list
- Search and filter functionality

---

### Course Creation & Management

#### Create Course Form

**Location**: `lib/presentation/pages/admin/courses/create_course_screen.dart`

**Required Fields**:
- `title` (String, required)
- `shortDescription` (String, required)
- `longDescription` (String, optional)
- `image` (String, optional) - Image URL or file upload
- `icon` (String, required) - Icon identifier
- `price` (double, required)
- `duration` (int, optional) - Duration in minutes
- `contentUrl` (String, required) - Video content URL
- `featured` (bool, default: false)

**Form Structure**:
```dart
class CreateCourseScreen extends StatefulWidget {
  final Course? course; // If editing, pass existing course
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course == null ? 'Create Course' : 'Edit Course')),
      body: Form(
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Title'),
              validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Short Description'),
              maxLines: 3,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Long Description'),
              maxLines: 10,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Duration (minutes)'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Content URL (Video)'),
            ),
            ImageUploadField(label: 'Course Image'),
            SwitchListTile(
              title: Text('Featured'),
              value: featured,
              onChanged: (value) => setState(() => featured = value),
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Save Course'),
            ),
          ],
        ),
      ),
    );
  }
}
```

#### Course List (Admin View)

**Location**: `lib/presentation/pages/admin/courses/courses_admin_screen.dart`

**Features**:
- List/grid of all courses
- Edit button for each course
- Delete button for each course
- Featured toggle
- Search and filter
- Sort by date, price, featured status

**Actions**:
- Create new course
- Edit existing course
- Delete course (with confirmation)
- Toggle featured status
- View course details

#### API Endpoints Needed

**TODO**: Verify if these endpoints exist in backend:

```dart
// Create course
Future<Course> createCourse(Map<String, dynamic> body) async {
  final response = await _dio.post<Map<String, dynamic>>(
    _url('/api/courses/create'), // TODO: Verify endpoint
    data: body,
  );
  return Course.fromJson(response.data!);
}

// Update course
Future<Course> updateCourse(String courseId, Map<String, dynamic> body) async {
  final response = await _dio.put<Map<String, dynamic>>(
    _url('/api/courses/$courseId'), // TODO: Verify endpoint
    data: body,
  );
  return Course.fromJson(response.data!);
}

// Delete course
Future<void> deleteCourse(String courseId) async {
  await _dio.delete<void>(
    _url('/api/courses/$courseId'), // TODO: Verify endpoint
  );
}
```

---

### Consultation Creation & Management

#### Create Consultation Form

**Location**: `lib/presentation/pages/admin/consultations/create_consultation_screen.dart`

**Required Fields**:
- `title` (String, required)
- `shortDescription` (String, optional)
- `description` (String, optional)
- `price` (double, required)
- `duration` (String, optional)
- `question` (Map<String, dynamic>, optional)
- `featured` (bool, default: false)
- `bookingId` (String, optional) - External booking system ID
- `paymentUrl` (String, optional) - Payment URL (usually generated by backend)

**Form Structure**:
Similar to Course form, with consultation-specific fields.

#### Consultation List (Admin View)

**Location**: `lib/presentation/pages/admin/consultations/consultations_admin_screen.dart`

**Features**:
- List of all consultations
- Edit/Delete actions
- Featured toggle
- Booking ID management

#### API Endpoints Needed

```dart
// Create consultation
Future<Consultation> createConsultation(Map<String, dynamic> body) async {
  final response = await _dio.post<Map<String, dynamic>>(
    _url('/api/consultations/create'), // TODO: Verify endpoint
    data: body,
  );
  return Consultation.fromJson(response.data!);
}

// Update consultation
Future<Consultation> updateConsultation(
  String consultationId,
  Map<String, dynamic> body,
) async {
  final response = await _dio.put<Map<String, dynamic>>(
    _url('/api/consultations/$consultationId'), // TODO: Verify endpoint
    data: body,
  );
  return Consultation.fromJson(response.data!);
}

// Delete consultation
Future<void> deleteConsultation(String consultationId) async {
  await _dio.delete<void>(
    _url('/api/consultations/$consultationId'), // TODO: Verify endpoint
  );
}
```

---

### Article Creation & Management

#### Create Article Form

**Location**: `lib/presentation/pages/admin/articles/create_article_screen.dart`

**Required Fields**:
- `title` (String, required)
- `content` (String, required) - Rich text content
- `categoryId` (String, required) - Article category
- `longDescription` (String, optional)
- `featured` (bool, default: false)

**Form Structure**:
```dart
class CreateArticleScreen extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Title'),
            ),
            // Category dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Category'),
              items: categories.map((cat) => 
                DropdownMenuItem(value: cat.id, child: Text(cat.name))
              ).toList(),
            ),
            // Rich text editor for content
            RichTextEditor(
              label: 'Content',
              initialValue: content,
              onChanged: (value) => setState(() => content = value),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Long Description'),
              maxLines: 5,
            ),
            SwitchListTile(
              title: Text('Featured'),
              value: featured,
              onChanged: (value) => setState(() => featured = value),
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Save Article'),
            ),
          ],
        ),
      ),
    );
  }
}
```

**Rich Text Editor**:
- Use `flutter_quill` or `html_editor_enhanced` package
- Support formatting (bold, italic, lists, links)
- Image insertion
- Preview mode

#### Article List (Admin View)

**Location**: `lib/presentation/pages/admin/articles/articles_admin_screen.dart`

**Features**:
- List of all articles
- Filter by category
- Edit/Delete actions
- Featured toggle

#### API Endpoints Needed

```dart
// Create article
Future<Article> createArticle(Map<String, dynamic> body) async {
  final response = await _dio.post<Map<String, dynamic>>(
    _url('/api/articles/create'), // TODO: Verify endpoint
    data: body,
  );
  return Article.fromJson(response.data!);
}

// Update article
Future<Article> updateArticle(String articleId, Map<String, dynamic> body) async {
  final response = await _dio.put<Map<String, dynamic>>(
    _url('/api/articles/$articleId'), // TODO: Verify endpoint
    data: body,
  );
  return Article.fromJson(response.data!);
}

// Delete article
Future<void> deleteArticle(String articleId) async {
  await _dio.delete<void>(
    _url('/api/articles/$articleId'), // TODO: Verify endpoint
  );
}
```

---

### Service Creation & Management

#### Create Service Form

**Location**: `lib/presentation/pages/admin/services/create_service_screen.dart`

**Required Fields** (based on Service model):
- Service-specific fields (check Service model structure)
- Category assignment
- Featured toggle

#### Service List (Admin View)

**Location**: `lib/presentation/pages/admin/services/services_admin_screen.dart`

**Features**:
- List of all services
- Edit/Delete actions
- Category management

#### API Endpoints Needed

```dart
// Create service
Future<Service> createService(Map<String, dynamic> body) async {
  final response = await _dio.post<Map<String, dynamic>>(
    _url('/api/services/create'), // TODO: Verify endpoint
    data: body,
  );
  return Service.fromJson(response.data!);
}

// Update service
Future<Service> updateService(String serviceId, Map<String, dynamic> body) async {
  final response = await _dio.put<Map<String, dynamic>>(
    _url('/api/services/$serviceId'), // TODO: Verify endpoint
    data: body,
  );
  return Service.fromJson(response.data!);
}

// Delete service
Future<void> deleteService(String serviceId) async {
  await _dio.delete<void>(
    _url('/api/services/$serviceId'), // TODO: Verify endpoint
  );
}
```

---

### Staff Management

#### Create Staff Form

**Location**: `lib/presentation/pages/admin/staff/create_staff_screen.dart`

**API Endpoint**: `POST /api/staff/create` ✅ (Already exists)

**Required Fields**:
- `name` (String, required)
- `content` (String, optional) - Staff bio/description
- `photoUrl` (String, optional) - Staff photo URL
- `featured` (bool, default: false)

**Form Structure**:
```dart
class CreateStaffScreen extends StatefulWidget {
  final Staff? staff; // If editing
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(staff == null ? 'Add Staff Member' : 'Edit Staff Member'),
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              initialValue: staff?.name,
              validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Bio/Description'),
              maxLines: 5,
              initialValue: staff?.content,
            ),
            ImageUploadField(
              label: 'Photo',
              initialUrl: staff?.photoUrl,
            ),
            SwitchListTile(
              title: Text('Featured'),
              value: featured,
              onChanged: (value) => setState(() => featured = value),
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Save Staff Member'),
            ),
          ],
        ),
      ),
    );
  }
}
```

#### Staff List (Admin View)

**Location**: `lib/presentation/pages/admin/staff/staff_admin_screen.dart`

**Features**:
- List of all staff members
- Edit/Delete actions
- Featured toggle
- Photo preview

#### API Endpoints

**Already Implemented**:
- ✅ `POST /api/staff/create` - Create staff
- ✅ `GET /api/staff` - Get all staff
- ✅ `GET /api/staff/{id}` - Get staff by ID

**Needed**:
```dart
// Update staff
Future<Staff> updateStaff(String staffId, Map<String, dynamic> body) async {
  final response = await _dio.put<Map<String, dynamic>>(
    _url('/api/staff/$staffId'), // TODO: Verify endpoint
    data: body,
  );
  return Staff.fromJson(response.data!);
}

// Delete staff
Future<void> deleteStaff(String staffId) async {
  await _dio.delete<void>(
    _url('/api/staff/$staffId'), // TODO: Verify endpoint
  );
}
```

---

### File Upload Management

#### Image Upload Component

**Location**: `lib/presentation/widgets/admin/image_upload_field.dart`

**Features**:
- Image picker (from gallery or camera)
- Image preview
- Upload to backend/CDN
- Progress indicator
- Error handling

**Implementation**:
```dart
class ImageUploadField extends StatefulWidget {
  final String label;
  final String? initialUrl;
  final Function(String url) onUploaded;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        if (imageUrl != null || initialUrl != null)
          Image.network(imageUrl ?? initialUrl!),
        ElevatedButton.icon(
          onPressed: _pickImage,
          icon: Icon(Icons.image),
          label: Text('Upload Image'),
        ),
        if (uploading)
          LinearProgressIndicator(),
      ],
    );
  }

  Future<void> _pickImage() async {
    // Use image_picker package
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      await _uploadImage(image.path);
    }
  }

  Future<void> _uploadImage(String imagePath) async {
    // Upload to backend
    // Backend should return URL
    // Call onUploaded with URL
  }
}
```

#### Video Upload Component

**Location**: `lib/presentation/widgets/admin/video_upload_field.dart`

**Features**:
- Video picker
- Video preview/thumbnail
- Upload progress
- Video URL input (alternative to upload)

**Implementation**:
Similar to ImageUploadField, but for video files.

**Packages Needed**:
```yaml
dependencies:
  image_picker: ^1.0.4      # Image/video picker
  file_picker: ^5.2.5       # File picker (alternative)
  dio: ^5.4.0               # Already in use for uploads
```

#### Upload API Endpoints

**Needed**:
```dart
// Upload image
Future<String> uploadImage(File imageFile) async {
  final formData = FormData.fromMap({
    'file': await MultipartFile.fromFile(imageFile.path),
  });
  final response = await _dio.post<Map<String, dynamic>>(
    _url('/api/upload/image'), // TODO: Verify endpoint
    data: formData,
  );
  return response.data!['url'] as String;
}

// Upload video
Future<String> uploadVideo(File videoFile) async {
  final formData = FormData.fromMap({
    'file': await MultipartFile.fromFile(videoFile.path),
  });
  final response = await _dio.post<Map<String, dynamic>>(
    _url('/api/upload/video'), // TODO: Verify endpoint
    data: formData,
  );
  return response.data!['url'] as String;
}
```

---

### Featured Content Management

#### Featured Content Toggle

All content types support a `featured` field. Admins should be able to:
- Toggle featured status from list view
- Set featured status during creation/editing
- View featured content separately

**Implementation**:
```dart
// In content list item
SwitchListTile(
  title: Text('Featured'),
  value: content.featured,
  onChanged: (value) async {
    await _toggleFeatured(content.id, value);
    // Refresh list
  },
)

Future<void> _toggleFeatured(String contentId, bool featured) async {
  await _repository.updateContent(
    contentId,
    {'featured': featured},
  );
}
```

---

### Admin State Management

#### AdminCubit

**Location**: `lib/presentation/cubit/admin/admin_cubit.dart`

```dart
class AdminCubit extends Cubit<AdminState> {
  final CourseRepository _courseRepository;
  final ConsultationRepository _consultationRepository;
  final ArticleRepository _articleRepository;
  // ... other repositories

  AdminCubit(
    this._courseRepository,
    this._consultationRepository,
    this._articleRepository,
  ) : super(AdminInitial());

  Future<void> createCourse(CourseData data) async {
    emit(AdminLoading());
    final result = await _courseRepository.createCourse(data.toJson());
    result.fold(
      (failure) => emit(AdminError(failure.message)),
      (course) => emit(CourseCreated(course)),
    );
  }

  Future<void> updateCourse(String id, CourseData data) async {
    emit(AdminLoading());
    final result = await _courseRepository.updateCourse(id, data.toJson());
    result.fold(
      (failure) => emit(AdminError(failure.message)),
      (course) => emit(CourseUpdated(course)),
    );
  }

  Future<void> deleteCourse(String id) async {
    emit(AdminLoading());
    final result = await _courseRepository.deleteCourse(id);
    result.fold(
      (failure) => emit(AdminError(failure.message)),
      (_) => emit(CourseDeleted(id)),
    );
  }

  // Similar methods for consultations, articles, services, staff
}
```

**States**:
```dart
abstract class AdminState {}
class AdminInitial extends AdminState {}
class AdminLoading extends AdminState {}
class CourseCreated extends AdminState {
  final Course course;
}
class CourseUpdated extends AdminState {
  final Course course;
}
class CourseDeleted extends AdminState {
  final String courseId;
}
class AdminError extends AdminState {
  final String message;
}
```

---

### Admin Routing

**Location**: `lib/core/routing/router.dart`

```dart
// Admin routes
GoRoute(
  path: '/admin',
  name: Screen.admin,
  redirect: (context, state) {
    // Check admin access
    final user = context.read<UserCubit>().state.user;
    if (user == null || !isAdmin(user)) {
      return '/';
    }
    return null;
  },
  pageBuilder: (context, state) => _noTransitionPage(
    const AdminDashboardScreen(),
    key: state.pageKey,
  ),
),
GoRoute(
  path: '/admin/courses/create',
  name: Screen.adminCreateCourse,
  pageBuilder: (context, state) => _noTransitionPage(
    const CreateCourseScreen(),
    key: state.pageKey,
  ),
),
GoRoute(
  path: '/admin/courses/edit',
  name: Screen.adminEditCourse,
  pageBuilder: (context, state) {
    final courseId = state.uri.queryParameters['id'];
    return _noTransitionPage(
      CreateCourseScreen(courseId: courseId),
      key: state.pageKey,
    );
  },
),
// Similar routes for consultations, articles, services, staff
```

---

### Admin UI Components

#### Reusable Admin Components

**Location**: `lib/presentation/widgets/admin/`

**Components**:
- `AdminFormField` - Standardized form field
- `AdminImageUpload` - Image upload widget
- `AdminVideoUpload` - Video upload widget
- `AdminRichTextEditor` - Rich text editor
- `AdminContentCard` - Content card with actions
- `AdminDeleteDialog` - Confirmation dialog for deletion
- `AdminFeaturedToggle` - Featured status toggle

---

### Development Checklist

#### Admin Authentication
- [ ] Implement `isAdmin()` helper function
- [ ] Add admin role check in routes
- [ ] Add admin access check in UI components

#### Admin Dashboard
- [ ] Create AdminDashboardScreen
- [ ] Add navigation tabs/sections
- [ ] Add statistics overview
- [ ] Add quick actions

#### Course Management
- [ ] Create CreateCourseScreen
- [ ] Create CoursesAdminScreen
- [ ] Add course creation API endpoint
- [ ] Add course update API endpoint
- [ ] Add course deletion API endpoint
- [ ] Add image upload for course

#### Consultation Management
- [ ] Create CreateConsultationScreen
- [ ] Create ConsultationsAdminScreen
- [ ] Add consultation creation API endpoint
- [ ] Add consultation update API endpoint
- [ ] Add consultation deletion API endpoint

#### Article Management
- [ ] Create CreateArticleScreen
- [ ] Create ArticlesAdminScreen
- [ ] Add rich text editor
- [ ] Add article creation API endpoint
- [ ] Add article update API endpoint
- [ ] Add article deletion API endpoint

#### Service Management
- [ ] Create CreateServiceScreen
- [ ] Create ServicesAdminScreen
- [ ] Add service creation API endpoint
- [ ] Add service update API endpoint
- [ ] Add service deletion API endpoint

#### Staff Management
- [ ] Create CreateStaffScreen (use existing API)
- [ ] Create StaffAdminScreen
- [ ] Add staff update API endpoint
- [ ] Add staff deletion API endpoint
- [ ] Add photo upload for staff

#### File Upload
- [ ] Create ImageUploadField component
- [ ] Create VideoUploadField component
- [ ] Add image upload API endpoint
- [ ] Add video upload API endpoint
- [ ] Handle upload progress
- [ ] Handle upload errors

#### State Management
- [ ] Create AdminCubit
- [ ] Add admin states
- [ ] Connect forms to state management

#### Testing
- [ ] Test admin authentication
- [ ] Test content creation forms
- [ ] Test file uploads
- [ ] Test content editing
- [ ] Test content deletion

---

### Notes

- **Admin Access**: Verify the actual admin `roleId` value from backend
- **API Endpoints**: Many admin endpoints may not exist yet - coordinate with backend team
- **File Uploads**: Backend should handle file storage (CDN, S3, etc.) and return URLs
- **Rich Text**: Choose appropriate rich text editor package based on requirements
- **Validation**: Add comprehensive form validation for all admin forms
- **Error Handling**: Provide clear error messages for admin actions
- **Confirmation Dialogs**: Always confirm destructive actions (delete, etc.)

---

## State Management

### Current State

- No state management for Profile screen
- No state management for Orders
- No state management for Courses

### Recommended Approach

Use **Cubit** (from `flutter_bloc`) for state management:

#### ProfileCubit

```dart
// States
abstract class ProfileState {}
class ProfileInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}
class ProfileLoaded extends ProfileState {
  final User user;
  final List<Order> orders;
  final List<Course> courses;
}
class ProfileError extends ProfileState {
  final String message;
}
```

#### OrderCubit (if needed separately)

```dart
// For order creation flow
abstract class OrderState {}
class OrderInitial extends OrderState {}
class OrderCreating extends OrderState {}
class OrderCreated extends OrderState {
  final Order order;
  final String paymentUrl;
}
class OrderError extends OrderState {
  final String message;
}
```

### Dependency Injection

**Location**: `lib/core/di/app_module.dart`

Repositories are already registered with `@lazySingleton`. Cubits should be registered similarly:

```dart
@module
abstract class AppModule {
  // Repositories are auto-registered via @lazySingleton
  // Cubits should be registered here if using get_it
}
```

---

## Routing

### Current Routes

**Location**: `lib/core/routing/router.dart`

```dart
// Profile route
GoRoute(
  path: '/profile',
  name: Screen.profile,
  pageBuilder: (context, state) => _noTransitionPage(
    const ProfileScreen(),
    key: state.pageKey,
  ),
),

// Payment success route
GoRoute(
  path: '/payment/success',
  name: Screen.paymentSuccess,
  pageBuilder: (context, state) => _noTransitionPage(
    const PaymentSuccessScreen(),
    key: state.pageKey,
  ),
),
```

### Required Routes (TODO)

- [ ] Course detail route: `/course?id={courseId}`
- [ ] Video player route: `/course/video?id={courseId}`
- [ ] Order detail route: `/order?id={orderId}` (optional)

### Navigation Examples

```dart
// Navigate to profile
context.goNamed(Screen.profile);

// Navigate to course detail
context.go('/course?id=$courseId');

// Navigate to payment success
context.goNamed(Screen.paymentSuccess);
```

---

## Configuration

### API Base URL

**Location**: `lib/core/config/app_config.dart`

```dart
static String get apiBaseUrl {
  if (kDebugMode) {
    return 'http://173.242.53.114:8080';
  } else {
    return 'https://yourdomain.com/api';
  }
}
```

### Booking Base URL

Used for consultation booking redirects:

```dart
static String get bookingBaseUrl {
  // Configure booking system URL
}
```

---

## Error Handling

### Repository Error Handling

All repositories extend `BaseRepository` which wraps API calls:

```dart
Future<Either<FailureException, T>> invokeRequest<T>(
  Future<T> Function() request,
) async {
  try {
    final result = await request();
    return Right(result);
  } catch (e) {
    return Left(FailureException(message: e.toString()));
  }
}
```

### UI Error Handling

Handle errors in Cubit states:

```dart
// In ProfileCubit
final result = await _userRepository.getProfile();
result.fold(
  (failure) => emit(ProfileError(failure.message)),
  (user) => emit(ProfileLoaded(user, orders, courses)),
);
```

---

## Testing Considerations

### Unit Tests

- Test repository methods
- Test API client serialization
- Test state management (Cubit)

### Widget Tests

- Test Profile screen UI
- Test Order cards display
- Test Course cards display
- Test Payment success screen

### Integration Tests

- Test complete payment flow
- Test course purchase flow
- Test profile data loading

---

## Future Enhancements

### Profile Screen

- [ ] Profile editing (update name, email)
- [ ] Profile picture upload
- [ ] Account settings
- [ ] Order history with filters
- [ ] Download receipts/invoices

### Payment

- [ ] Payment method selection
- [ ] Saved payment methods
- [ ] Payment retry for failed orders
- [ ] Refund handling (if supported)

### Content

- [ ] Video progress tracking
- [ ] Course completion certificates
- [ ] Course reviews/ratings
- [ ] Course search and filtering
- [ ] Course categories/tags
- [ ] Downloadable course materials
- [ ] Course recommendations

### Appointments (Future Feature)

- [ ] Appointment booking UI
- [ ] Appointment calendar view
- [ ] Appointment reminders
- [ ] Appointment cancellation

---

## Dependencies

### Required Packages

```yaml
dependencies:
  flutter_bloc: ^8.1.3        # State management
  freezed_annotation: ^2.4.1   # Models (already in use)
  json_annotation: ^4.8.1      # JSON serialization (already in use)
  go_router: ^12.1.3          # Routing (already in use)
  injectable: ^2.3.2          # DI (already in use)
  dio: ^5.4.0                 # HTTP client (already in use)
```

### Optional Packages (for video)

```yaml
dependencies:
  video_player: ^2.8.1        # Video playback
  chewie: ^1.7.4              # Enhanced video player UI
```

---

## API Endpoints Summary

### User Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/auth/me` | Get current user profile |
| POST | `/api/auth/login` | User login |
| POST | `/api/auth/register` | User registration |
| POST | `/api/auth/change-password` | Change password |

### Order Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/orders` | Create new order |
| GET | `/api/orders/me` | Get user's orders |
| GET | `/api/orders/{id}` | Get order by ID |

### Course Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/courses` | Get all courses |
| GET | `/api/courses/me` | Get purchased courses |

### Admin Endpoints

#### Content Management

| Method | Endpoint | Description | Status |
|--------|----------|-------------|--------|
| POST | `/api/courses/create` | Create new course | ⚠️ TODO: Verify |
| PUT | `/api/courses/{id}` | Update course | ⚠️ TODO: Verify |
| DELETE | `/api/courses/{id}` | Delete course | ⚠️ TODO: Verify |
| POST | `/api/consultations/create` | Create new consultation | ⚠️ TODO: Verify |
| PUT | `/api/consultations/{id}` | Update consultation | ⚠️ TODO: Verify |
| DELETE | `/api/consultations/{id}` | Delete consultation | ⚠️ TODO: Verify |
| POST | `/api/articles/create` | Create new article | ⚠️ TODO: Verify |
| PUT | `/api/articles/{id}` | Update article | ⚠️ TODO: Verify |
| DELETE | `/api/articles/{id}` | Delete article | ⚠️ TODO: Verify |
| POST | `/api/services/create` | Create new service | ⚠️ TODO: Verify |
| PUT | `/api/services/{id}` | Update service | ⚠️ TODO: Verify |
| DELETE | `/api/services/{id}` | Delete service | ⚠️ TODO: Verify |

#### Staff Management

| Method | Endpoint | Description | Status |
|--------|----------|-------------|--------|
| POST | `/api/staff/create` | Create new staff member | ✅ Implemented |
| GET | `/api/staff` | Get all staff | ✅ Implemented |
| GET | `/api/staff/{id}` | Get staff by ID | ✅ Implemented |
| PUT | `/api/staff/{id}` | Update staff member | ⚠️ TODO: Verify |
| DELETE | `/api/staff/{id}` | Delete staff member | ⚠️ TODO: Verify |

#### File Upload

| Method | Endpoint | Description | Status |
|--------|----------|-------------|--------|
| POST | `/api/upload/image` | Upload image file | ⚠️ TODO: Verify |
| POST | `/api/upload/video` | Upload video file | ⚠️ TODO: Verify |

#### General Info (Admin)

| Method | Endpoint | Description | Status |
|--------|----------|-------------|--------|
| GET | `/api/general_info/units` | Get units | ✅ Implemented |
| PUT | `/api/general_info/units` | Update units | ✅ Implemented |
| GET | `/api/general_info/social_contacts` | Get social contacts | ✅ Implemented |
| PUT | `/api/general_info/social_contacts` | Update social contacts | ✅ Implemented |
| GET | `/api/general_info/finance_info` | Get finance info | ✅ Implemented |
| PUT | `/api/general_info/finance_info` | Update finance info | ✅ Implemented |
| GET | `/api/general_info/staff` | Get staff (general info) | ✅ Implemented |
| PUT | `/api/general_info/staff` | Update staff (general info) | ✅ Implemented |

---

## Development Checklist

### Profile Screen Implementation

- [ ] Create ProfileCubit with states
- [ ] Implement ProfileScreen UI
- [ ] Add UserInfoCard widget
- [ ] Add OrdersList widget
- [ ] Add CoursesList widget
- [ ] Add Logout functionality
- [ ] Handle loading states
- [ ] Handle error states
- [ ] Add pull-to-refresh

### Payment Flow

- [ ] Enhance OrderRepository with payment helper
- [ ] Create payment initiation UI
- [ ] Handle payment redirect
- [ ] Refresh data after payment return
- [ ] Show pending payment status

### Content Display

- [ ] Implement CoursesScreen (list view)
- [ ] Implement CourseDetailScreen
- [ ] Add video player integration
- [ ] Handle video loading/errors
- [ ] Add course purchase flow

### Admin UI

- [ ] Implement admin authentication check (roleId-based)
- [ ] Create AdminDashboardScreen
- [ ] Create course creation/editing forms
- [ ] Create consultation creation/editing forms
- [ ] Create article creation/editing forms
- [ ] Create service creation/editing forms
- [ ] Create staff creation/editing forms (use existing API)
- [ ] Implement file upload components (image/video)
- [ ] Add content deletion with confirmation
- [ ] Add featured content toggle
- [ ] Create AdminCubit for state management
- [ ] Add admin routes with access protection
- [ ] Verify/create admin API endpoints

### Testing

- [ ] Write unit tests for repositories
- [ ] Write widget tests for Profile screen
- [ ] Write integration tests for payment flow
- [ ] Write tests for admin authentication
- [ ] Write tests for admin content creation

---

## Notes

- **Payment Status**: Backend updates order status via webhook. Frontend should refresh data when user returns from payment.
- **Video Content**: Ensure `contentUrl` from Course model is accessible and properly formatted for video player.
- **Error Handling**: All API calls should handle network errors, authentication errors, and validation errors gracefully.
- **State Management**: Use Cubit for simple state management. Consider Bloc for more complex flows if needed.
- **Navigation**: Use GoRouter for navigation. Ensure proper route parameters for course/order detail screens.

---

## Related Documentation

- [API_CONFIG.md](./API_CONFIG.md) - API configuration guide
- [FEATURE_TIMELINE.md](./FEATURE_TIMELINE.md) - Feature development timeline
- [DEPLOYMENT.md](./DEPLOYMENT.md) - Deployment guide

---

**Last Updated**: 2024
**Maintained By**: Frontend Team

