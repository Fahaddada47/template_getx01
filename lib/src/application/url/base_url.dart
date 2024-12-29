class Urls {
  Urls._();

  static const String _baseUrl = 'https://trrimber.eitrobotics.com/api/v1';
  static const String imagebaseUrl = 'https://trrimber.eitrobotics.com/';

  static String sendOtpToEmail(String email) => '$_baseUrl/UserLogin/$email';

  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';
  static String getCarouselSliders = "$_baseUrl/ListProductSlider";
  static String login = "$_baseUrl/login";
  static String logout = "$_baseUrl/user/logout";
  static String registration = "$_baseUrl/registration";
  static String registrationVerifyOtp = "$_baseUrl/verify/otp";
  static String forgotPassSendMail = "$_baseUrl/forget/password";
  static String forgotPassSendOtp = "$_baseUrl/otp/verify/forget/password";
  static String resetPassword = "$_baseUrl/reset/password";
  static String resendOtp = "$_baseUrl/verify/email";
  static String fetchLogList = "$_baseUrl/user/product/get/list";
  static String postResult = "$_baseUrl/user/product/insert/update";

}