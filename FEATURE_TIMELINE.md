# Feature Development Timeline

## 🎯 **EXECUTIVE SUMMARY**

This document outlines the development timeline for two major features:
1. **Personal Account with Videos (Courses) and Payments**
2. **Online Appointment Booking with Payments**

### ⚠️ **CRITICAL PRIORITY: Foundation Phase First**

**Both features require Profile and Payments infrastructure. These must be built FIRST.**

**Foundation Phase:**
- ✅ **Profile Screen** - Central hub for user data
- ✅ **Payment Integration** - Unified payment flow for all purchases

**After Foundation, develop:**
- Feature 1: Videos/Courses integration into Profile
- Feature 2: Appointment booking with payment integration

Based on codebase analysis, several foundational pieces exist but require completion and integration.

---

## Current State Analysis

### ✅ What Already Exists

#### Backend/API Foundation:
- **Order System**: Order model with statuses (pending, paid, failed)
- **Payment Flow**: `createOrder()` endpoint, payment URL handling
- **Courses API**: `getAllCourses()`, `getPurchasedCourses()` 
- **Appointments API**: `getAllAppointments()`, `getAppointmentById()`
- **User Profile**: `getUserProfile()`, `getOrdersByUser()`

#### Frontend Models:
- `Order` model with ServiceType (course, consultation, service)
- `Course` model with `contentUrl` for video content
- `ConsultationAppointment` model (links to `orderId`)
- `User` model
- Payment success screen

#### Missing Frontend Implementation:
- Profile screen is empty (stub only)
- Courses screen is empty (stub only)  
- No course detail/video player
- **No appointment creation endpoint in API client**
- No appointment booking UI

---

## 🏗️ **FOUNDATION PHASE: PROFILE + PAYMENTS**

> **⚠️ CRITICAL: Both features depend on Profile and Payments. Build this foundation FIRST.**

### Part 1: Profile Infrastructure

#### Frontend Tasks:
1. **Profile Screen Implementation** (MVP - Keep Simple)
   - [ ] Basic profile screen layout (no tabs initially - just scrollable list)
   - [ ] Display user info (name, email) at top
   - [ ] Simple "My Orders" section below
   - [ ] Logout button
   - [ ] ProfileCubit for managing profile state
   - [ ] Load user profile data on screen init
   - **💡 OPTIMIZATION**: Skip tabs/navigation complexity for now. Use simple sections.

2. **Orders Display in Profile** (MVP)
   - [ ] Create simple OrdersList widget
   - [ ] Fetch and display user orders (`getOrdersByUser()`)
   - [ ] Simple order cards with:
     - Service type and amount
     - Status badge (Pending, Paid, Failed) - use simple colors
     - Purchase date
   - [ ] **💡 OPTIMIZATION**: Skip expandable details for MVP. Show all key info on card.
   - [ ] Empty state message
   - **💡 OPTIMIZATION**: Skip pagination for MVP. If orders > 20, add later.

#### Backend Requirements:
- ✅ `GET /api/orders/me` - Already exists
- ✅ `GET /api/auth/me` - Already exists

---

### Part 2: Payment Flow Integration

#### Frontend Tasks:
1. **Payment Service/Repository** (MVP - Reuse Existing)
   - [ ] **💡 OPTIMIZATION**: Enhance existing `OrderRepository` instead of new service
   - [ ] Add simple `initiatePayment()` helper method
   - [ ] Handle order creation → payment URL → redirect flow
   - [ ] **💡 OPTIMIZATION**: Payment callback already handled by payment provider redirect
   - **💡 OPTIMIZATION**: Use existing `PaymentSuccessScreen` - no need to rebuild

2. **Payment Status Management** (MVP - Minimal)
   - [ ] **💡 OPTIMIZATION**: Skip polling - rely on payment redirect/page refresh
   - [ ] Refresh profile/orders data when returning from payment
   - [ ] Show pending status in orders list (already in Order model)
   - **💡 OPTIMIZATION**: Skip complex status tracking. Let backend handle it.

3. **Payment Error Handling** (MVP - Basic)
   - [ ] Basic error message on order creation failure
   - [ ] **💡 OPTIMIZATION**: Skip retry logic for MVP - user can retry manually
   - **💡 OPTIMIZATION**: Use existing error handling in `BaseRepository`

#### Backend Requirements:
- ✅ `POST /api/orders` - Already exists
- ⚠️ Verify payment webhook integration (how order status updates)

---

## ✅ **AFTER FOUNDATION PHASE**

Once Profile and Payments are complete, develop features:

---

## Feature 1: Personal Account with Videos & Payments

> **Note**: Profile and Payments are now in **Foundation Phase** (see above). This section assumes Foundation is complete.

### Phase 1: Course Display & Purchase (MVP)

#### Frontend Tasks:

1. **Courses Screen** (MVP - Basic List)
   - [ ] Simple list of courses (reuse existing `getAllCourses()`)
   - [ ] Course cards with: title, price, thumbnail/image
   - [ ] Tap card → navigate to course detail
   - **💡 OPTIMIZATION**: Skip search/filter for MVP
   - **💡 OPTIMIZATION**: Simple grid or list - no complex layout

2. **Course Detail Screen** (MVP)
   - [ ] Display course metadata (title, description, price, duration)
   - [ ] Purchase button (if not purchased) → create order → payment redirect
   - [ ] **💡 OPTIMIZATION**: Use existing payment flow from Foundation Phase
   - [ ] "Access Course" button (if purchased) → navigate to video player
   - **💡 OPTIMIZATION**: Skip "Add to Cart" - direct purchase only

3. **My Courses in Profile** (MVP - Simple List)
   - [ ] Add "My Courses" section to profile (below Orders)
   - [ ] Fetch purchased courses (`getPurchasedCourses()`)
   - [ ] Simple course cards with title and thumbnail
   - [ ] Tap → navigate to course detail → video player
   - **💡 OPTIMIZATION**: Reuse same CourseCard component from courses list

#### Backend Requirements:
- ✅ `GET /api/courses` - Already exists
- ✅ `GET /api/courses/me` - Already exists  
- ⚠️ Verify video content delivery (CDN/streaming setup)

---

### Phase 2: Video Player Integration (MVP)

#### Frontend Tasks:

1. **Video Player** (Use Existing Package)
   - [ ] Add `video_player` package to `pubspec.yaml`
   - [ ] **💡 OPTIMIZATION**: Use `chewie` package for better UI (optional but recommended)
   - [ ] Simple video player screen/component
   - [ ] Load video from course `contentUrl`
   - [ ] Basic play/pause controls
   - [ ] **💡 OPTIMIZATION**: Skip progress tracking for MVP - let video player handle it
   - [ ] **💡 OPTIMIZATION**: Skip fullscreen button initially - use native fullscreen on tap

2. **Course Access Control** (MVP - Simple Check)
   - [ ] Before showing video, check if course is in `getPurchasedCourses()`
   - [ ] If not purchased → show purchase button
   - [ ] **💡 OPTIMIZATION**: Skip complex order status checking - rely on purchased courses list

#### Backend Requirements:
- ⚠️ Verify video URLs are accessible/streaming works

---

### Phase 3: Polish (Optional - If Time Permits)

- [ ] Video progress saving (if backend supports)
- [ ] Course search/filter
- [ ] Better video player controls
- [ ] Course categories/tags
- [ ] Course ratings/reviews

---

## Feature 2: Online Appointment Booking with Payments

> **Note**: Profile and Payments are now in **Foundation Phase** (see above). This section assumes Foundation is complete.

### Phase 1: Appointment Booking API & Basic UI (MVP)

#### Frontend Tasks:

1. **API Client Updates**
   - [ ] Add `createAppointment()` method to `ApiClient`
   - [ ] Add `getMyAppointments()` method to `ApiClient`
   - [ ] Update `ConsultationAppointmentRepository`
   - **💡 OPTIMIZATION**: Keep it simple - just wrap API calls

2. **Basic Booking Flow** (MVP - Minimal)
   - [ ] Add "Book Appointment" button to consultation detail page
   - [ ] Simple date/time picker (use Flutter's built-in `showDatePicker` + `showTimePicker`)
   - [ ] Optional notes/details text field
   - [ ] **💡 OPTIMIZATION**: Skip time slot availability checking for MVP - let backend validate
   - [ ] Booking flow: select date/time → create order → payment → create appointment
   - [ ] **💡 OPTIMIZATION**: Use existing payment flow from Foundation Phase

3. **My Appointments in Profile** (MVP - Simple List)
   - [ ] Add "My Appointments" section to profile
   - [ ] Fetch appointments (`getMyAppointments()`)
   - [ ] Display: date, time, consultation title
   - [ ] Tap → show appointment details
   - **💡 OPTIMIZATION**: Skip filtering/sorting for MVP - just show chronological list

#### Backend Requirements:
- ⚠️ **CRITICAL**: `POST /api/consultation-appointments` endpoint needed
- ⚠️ **CRITICAL**: `GET /api/consultation-appointments/me` - User's appointments
- ⚠️ Appointment validation (time slots, availability) - Backend responsibility

---

### Phase 2: Booking Flow Polish (Optional)

- [ ] Available time slots UI (if backend provides endpoint)
- [ ] Appointment confirmation screen with details
- [ ] Appointment cancellation (if backend supports)
- [ ] Calendar integration (iCal export)
- [ ] Appointment reminders/notifications

---

## 📊 **OPTIMIZATION SUMMARY**

### Key Optimizations Applied:

1. **Profile Screen**: Skip tabs → use simple scrollable sections
2. **Payment Flow**: Enhance existing `OrderRepository` instead of new service
3. **Orders**: Skip expandable details, pagination, complex status tracking
4. **Courses**: Skip search/filter, simple list/grid layout
5. **Video Player**: Use `video_player` + `chewie` packages (don't build custom)
6. **Appointments**: Skip time slot UI initially - let backend validate
7. **Error Handling**: Rely on existing `BaseRepository` error handling
8. **Status Polling**: Skip - use page refresh/payment redirect

### MVP vs Full Features:

**MVP (Build First):**
- ✅ Basic profile with Orders, Courses, Appointments sections
- ✅ Simple payment flow (create order → redirect → refresh)
- ✅ Course list + detail + video player
- ✅ Appointment booking with date/time picker
- ✅ Basic error handling

**Nice-to-Have (Add Later):**
- ⏭️ Profile tabs/navigation
- ⏭️ Order details expansion
- ⏭️ Payment retry logic
- ⏭️ Course search/filter
- ⏭️ Video progress tracking
- ⏭️ Time slot availability UI
- ⏭️ Appointment cancellation
- ⏭️ Advanced error handling

---

## Critical Missing Backend Endpoints

### 🔴 **High Priority** (Required for Feature 2):

1. **`POST /api/consultation-appointments`**
   ```json
   {
     "consultationId": "string",
     "appointmentDatetime": "ISO8601 datetime",
     "details": "string (optional)",
     "orderId": "string"  // Required after payment
   }
   ```

2. **`GET /api/consultation-appointments/me`**  
   Returns current user's appointments

### 🟡 **Medium Priority** (Enhancements - Add Later):

3. **`GET /api/consultations/{id}/available-slots`**  
   Returns available booking slots for a consultation

4. **`PATCH /api/consultation-appointments/{id}`**  
   Update appointment (for rescheduling/cancellation)

5. **`DELETE /api/consultation-appointments/{id}`**  
   Cancel appointment

---

## Dependencies & Prerequisites

### For Feature 1:
- ✅ Order system (exists)
- ✅ Course API (exists)
- ⚠️ Video streaming/CDN setup (verify)
- 📦 Add `video_player` package (or `chewie` for better UI)

### For Feature 2:
- ✅ Order system (exists)
- ✅ Consultation API (exists)
- ❌ **Appointment creation endpoint** (MISSING - CRITICAL)
- ⚠️ Appointment validation on backend

---

## ✅ **RECOMMENDED DEVELOPMENT ORDER**

### **Foundation Phase** (CRITICAL - Build First)

**Both features depend on Profile and Payments, so build these first:**

1. **Profile Screen** (Simple MVP)
   - Basic layout with user info + Orders section
   - ProfileCubit for state management
   - Logout functionality

2. **Payment Integration** (Minimal)
   - Enhance `OrderRepository` with payment helper
   - Reuse existing payment redirect flow
   - Refresh data after payment

**After Foundation Phase:**
- Choose Feature 1 (Videos) OR Feature 2 (Appointments) based on priority
- Both can reuse Foundation infrastructure

---

## Quick Wins & Simplifications

### Use Existing Flutter Packages:
- ✅ `video_player` - Video playback (standard Flutter package)
- ✅ `chewie` - Better video player UI (optional but recommended)
- ✅ Flutter's built-in `showDatePicker` / `showTimePicker` - No need for custom calendar

### Reuse Existing Code:
- ✅ `PaymentSuccessScreen` - Already exists, just use it
- ✅ `BaseRepository` - Error handling already implemented
- ✅ Payment redirect flow - Already works for consultations

### Skip For MVP:
- ❌ Custom video player UI (use `chewie`)
- ❌ Complex calendar widget (use Flutter's date/time pickers)
- ❌ Payment polling/status checking (let backend handle it)
- ❌ Search/filter functionality
- ❌ Pagination (unless >50 items)
- ❌ Complex state management (keep it simple with Cubit)

---

## Next Steps

1. ⚠️ **Verify backend endpoints** - Check if `POST /api/consultation-appointments` exists
2. 📦 **Add video player package** - Add `video_player` to `pubspec.yaml` when ready
3. 🎯 **Start with Foundation** - Profile + Payments first
4. ⚡ **Focus on MVP** - Build working features, polish later

---

## Questions for Backend Team

1. Does `POST /api/consultation-appointments` exist? If not, what's the ETA?
2. Does `GET /api/consultation-appointments/me` exist?
3. How is appointment availability validated? (Should frontend check slots or just send request?)
4. What's the payment webhook flow? How is order status updated?
5. Video content delivery: CDN setup? URL structure?
