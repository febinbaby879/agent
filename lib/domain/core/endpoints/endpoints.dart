class ApiEndPoints {
  static String baseUrl = '';

  /// Auth
  static String userRegistration = '/api/userauth/register';
  static String userLogin = '/api/userauth/login';
  static String oTPSending = '/api/userauth/send-email';
  static String oTPVerify = '/api/userauth/verify-otp';
  static String contactUs = '/api/inquiry/inquiries';
  static String resetPassword = '/api/userauth/reset-password';
  static String getUser = '/api/userauth/user';
  static String updateUser = '/api/userauth/update-user';
  static String accountSoftDelete = '/api/userauth/users/{user_id}/soft-delete';

  static String formSubmission = '';
}
