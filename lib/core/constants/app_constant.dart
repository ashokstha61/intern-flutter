class AppConstants {
  // App Strings
  static const String appName = 'Flutter Internship';
  static const String appVersion = '1.0.0';
  
  // API Constants
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const int receiveTimeout = 15000;
  static const int connectTimeout = 15000;
  
  // Local Storage Keys
  static const String authTokenKey = 'auth_token';
  static const String userDataKey = 'user_data';
  static const String themeKey = 'theme_mode';
  
  // Animation Durations
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration shimmerDuration = Duration(milliseconds: 1500);
  
  // Layout Constants
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 12.0;
  static const double defaultIconSize = 24.0;
}