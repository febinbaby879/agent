class ApiEndPoints {
  /// [Live Server]
  static String baseUrl = 'https://api.myeduguardian.com/api';

  /// [Dev Local]
  // static String baseUrl = 'https://90n3qtc2-8000.inc1.devtunnels.ms/api';

  /// Auth
  static String userRegistration = '/agent/agent-register';
  static String registerOtpVerification = '/agent/agent-verify-otp';
  static String userLogin = '/userauth/login';
  static String forgotPassword = '/agent/forgot-password';
  static String resetNewPassword = '/agent/reset-password';

  // [OnBoarding]
  static String getOnboardingStatus = '/agent/my-status';
}
