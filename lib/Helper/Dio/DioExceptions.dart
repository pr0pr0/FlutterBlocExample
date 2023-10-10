import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError( {required DioException dioError}) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "تم إلغاء الطلب إلى السرفر";
        break;
      case DioExceptionType.connectionTimeout:
        message = 'لا يمكن الاتصال بالسرفر يرجى المحاولة مره اخرى';
        break;
      case DioExceptionType.receiveTimeout:
        message = "السرفر في حالة ازدحام يرجي المحاولة مرة اخرى";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = "السرفر في حالة ازدحام يرجي المحاولة مرة اخرى";
        break;
      case DioExceptionType.unknown:
        message = ' لا يوجد اتصال بالانترنت او قد يكون السرفر خارج عن الخدمة';
        break;

      default:
        message = "هناك خطأ ما";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'هناك خطأ ما';
      case 401:
        return 'غير مصرح';
      case 403:
        return 'اتصال مُحرَّم';
      case 404:
        return error;
      case 500:
        return 'خطأ في  المدخلات';
      case 502:
        return 'مدخل خاطأ';
      default:
        return 'هناك خطأ ما';
    }
  }

  @override
  String toString() => message;
}
