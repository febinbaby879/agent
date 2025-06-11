class ApiEndPoints {
  /// [Live Server]
  static String baseUrl = 'https://api.myeduguardian.com/api';

  /// [Dev Local]
  // static String baseUrl = 'https://90n3qtc2-8000.inc1.devtunnels.ms/api';

  /// Auth
  static String userRegistration = '/agent/agent-register';
  static String registerOtpVerification = '/agent/agent-verify-otp';
  static String userLogin = '/agent/login';
  static String forgotPassword = '/agent/forgot-password';
  static String resetNewPassword = '/agent/reset-password';

  // [onBoarding]
  static String getOnboardingStatus = '/agent/my-status';

  /// [profile]
  static String getProfileInfo = '/agent/get-agent-profile/{id}';
  static String updateProfileInfo = '/agent/update-agent/{id}';

  /// [agreement]
  static String getAgreement = '/agreements/generate/{id}';
}
