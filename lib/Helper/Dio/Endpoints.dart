class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://tasty.p.rapidapi.com";
  // static const String baseUrl = "http://192.168.43.69:7244/api";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  static const String foodList = '/recipes/list';
  static const String changePassword = '/Auth/changepassword';

}
