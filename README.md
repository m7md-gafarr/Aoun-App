# 🚗 Aoun App - Ride Sharing Made Simple 📱

**Aoun App** is a cross-platform ride-sharing and transportation mobile application built with **Flutter**, designed specifically for university students and local commuters. The app connects drivers offering rides with passengers seeking affordable, convenient travel options within local communities.  

---

## ✨ Features

### 🔐 Authentication System
- **OTP-based verification** for secure login and password reset
- **Dual-role registration** with separate flows for drivers and passengers
- **Session management** with persistent authentication using local storage
- **Password recovery** with email verification 

### 🚙 Driver Features
- **Trip Creation & Management** - Create trips with route selection and location-based planning
- **Booking Management** - Accept/decline passenger requests and track trip status
- **Vehicle Information** - Manage vehicle details, registration, and documentation
- **Earnings & Wallet** - Track earnings, view transaction history, and manage withdrawals
- **Dashboard Analytics** - View trip statistics and performance metrics 
### 🧑‍🎓 Passenger Features
- **Trip Discovery** - Search for available trips based on location and schedule
- **Booking System** - Request trips and manage reservations
- **Payment Integration** - Stripe-powered card payments and wallet functionality
- **Trip History** - View past bookings and transaction records
- **Real-time Tracking** - Track trip progress and driver location 

### 🗺️ Location & Maps
- **Google Maps Integration** - Real-time location tracking and route visualization
- **GPS Services** - Accurate positioning and location-based services
- **Route Planning** - Optimized route calculation and navigation
- **Address Autocomplete** - Smart location search and suggestions 

### 💳 Payment System
- **Stripe Integration** - Secure payment processing
- **Multiple Payment Methods** - Credit/debit cards and wallet balance
- **Transaction History** - Detailed payment records and receipts
- **Wallet Management** - Add funds and manage payment preferences 

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.5.4 or higher)
- Dart SDK
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/m7md-gafarr/Aoun-App.git
   cd Aoun-App
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up environment variables**
   Create a `.env` file in the root directory:
   ```env
    PUBLISHABLE_KEY_STRIPE="your_publishable_key_here"
    SECRET_KEY_STRIPE="your_secret_key_here"
    SERVICE_MAP_API_KEY="your_google_maps_api_key"
    API_KEY_MAP="your_secondary_google_maps_api_key"
    API_URL="your_backend_api_url"
   ```  

4. **Generate code (if needed)**
   ```bash
   flutter packages pub run build_runner build
   ```

5. **Run the application**
   ```bash
   flutter run
   ```

---

## 🛠️ Tech Stack

| Category | Technology | Purpose |
|----------|------------|---------|
| **Framework** | Flutter 3.5.4+ | Cross-platform mobile development |
| **Language** | Dart | Primary programming language |
| **State Management** | BLoC/Cubit (`flutter_bloc`) | Reactive state management |
| **Navigation** | Custom Router | Route management and navigation |
| **Maps & Location** | Google Maps Flutter, Geolocator | Location services and mapping |
| **Payments** | Stripe Flutter SDK | Payment processing |
| **Local Storage** | Hive, SharedPreferences | Data persistence |
| **Networking** | Dio | HTTP client for API calls |
| **UI/UX** | Flutter ScreenUtil | Responsive design |
| **Internationalization** | Flutter Intl | Multi-language support (Arabic/English) | 

---

## 📁 Project Structure

```
lib/
├── core/                          # Core utilities and configurations
│   ├── router/                    # Navigation and routing
│   ├── theme/                     # App theming and styling
│   └── utils/                     # Utility functions and helpers
├── data/                          # Data layer
│   ├── model/                     # Data models and entities
│   └── repositories/              # Data repositories (local/remote)
├── presentation/                  # Presentation layer
│   ├── auth/                      # Authentication screens and logic
│   ├── driver/                    # Driver-specific features
│   ├── user/                      # Passenger/user features
│   └── shared/                    # Shared UI components
├── generated/                     # Generated files (l10n, etc.)
└── main.dart                      # Application entry point
```

## 🤝 Contributing

We welcome contributions! Please follow these guidelines:

### Getting Started
1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

### Development Guidelines
- Follow Flutter/Dart style guidelines
- Use meaningful commit messages
- Write tests for new features
- Update documentation as needed
- Ensure code passes all CI/CD checks 

### Code Style
- Use `flutter format` for code formatting
- Follow BLoC pattern for state management
- Implement proper error handling
- Add comments for complex logic
- Use meaningful variable and function names



---

## 📱 Screenshots

| Feature | Screenshot |
|---------|------------|
| **Login Screen** | ![Login](https://via.placeholder.com/300x600?text=Login+Screen) |
| **Driver Dashboard** | ![Driver](https://via.placeholder.com/300x600?text=Driver+Dashboard) |
| **Trip Search** | ![Search](https://via.placeholder.com/300x600?text=Trip+Search) |
| **Payment** | ![Payment](https://via.placeholder.com/300x600?text=Payment+Screen) |

---

## 🌐 Internationalization

The app supports multiple languages:

- English (default)
- Arabic (العربية)

Language is automatically detected based on the device's settings, with an option to switch manually inside the app.


---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📞 Support & Contact

- **Email**: m7md.gafarr@gmail.com
- **GitHub Issues**: [Create an Issue](https://github.com/m7md-gafarr/Aoun-App/issues)
- **Documentation**: [Wiki](https://github.com/m7md-gafarr/Aoun-App/wiki)

---

## 🙏 Acknowledgments

- **Flutter Team** - For the amazing framework
- **Google Maps** - For location services
- **Stripe** - For secure payment processing
- **Contributors** - Thank you to all contributors who helped build this app
- **Community** - Special thanks to the Flutter community for support and resources

---

## 📊 Project Status

![Build Status](https://github.com/m7md-gafarr/Aoun-App/workflows/Flutter%20CI/CD/badge.svg)
![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![Flutter](https://img.shields.io/badge/Flutter-3.5.4+-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)

---

**Made with ❤️ by [Mohamed Gafar](https://www.linkedin.com/in/mohamedsobhygafar/)**
