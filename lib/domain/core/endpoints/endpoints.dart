class ApiEndPoints {
  static String baseUrl = 'https://api.myeduguardian.com/api';

  /// Auth
  static String userRegistration = '/agent/agent-register';
  static String registerOtpVerification = '/agent/agent-verify-otp';
  static String userLogin = '/api/userauth/login';
  static String forgotPassword = '/agent/forgot-password';
  static String resetNewPassword = '/agent/reset-password';
}
