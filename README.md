# Aoun App 🚗📍📱

**Aoun App** is a cross-platform ride-sharing and transportation mobile application built using **Flutter**. Designed for university students and local commuters, it supports two primary user roles: **Drivers** and **Passengers**. The app integrates real-time GPS tracking, trip management, payment processing, and dual-language support to offer a seamless and localized transport experience.

---

## 🚀 Key Features

### 🔐 Authentication System
- OTP-based login and password reset
- Dual-role registration: Driver or Passenger
- Secure session handling with local persistence

### 🧑‍✈️ Driver System
- Create and manage trips with location selection
- Track trip status and bookings
- Driver profile and vehicle management
- View incoming requests and accept bookings

### 🧑‍🎓 Passenger/User System
- Search for nearby or scheduled trips
- View trip details and driver info
- Send booking requests
- Make in-app payments using saved cards

### 💳 Payments & Wallet
- Integrated with **Stripe** for credit/debit cards
- Add/manage multiple cards
- Wallet balance view and payment history

---

## 🏗️ Architecture Overview

The Aoun App follows a **layered architecture** using clean separation between:

- **Presentation Layer**: Screens, widgets, routing
- **State Management**: BLoC/Cubit pattern via `flutter_bloc`
- **Data Layer**: API models, local persistence via Hive/SharedPreferences
- **Service Layer**: APIs, location, Stripe, and utilities

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Main Entry: `main.dart`
```dart
MultiBlocProvider(
  providers: [
    BlocProvider(create: (_) => LoginCubit()),
    BlocProvider(create: (_) => CreateTripCubit()),
    BlocProvider(create: (_) => SearchTripCubit()),
    ...
  ],
  child: AounApp()
)

