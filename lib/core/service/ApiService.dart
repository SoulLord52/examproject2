import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import '../model/NewsModel.dart';

class ApiService {
  static final Dio dio = Dio();
  static const String apiKey = '0590a514ed364c9bba00d78ecce5f7c7';
  static const String appleNewsUrl =
      'https://newsapi.org/v2/everything?q=apple&from=2026-04-28&to=2026-04-28&sortBy=popularity&apiKey=$apiKey';
  static const String teslaNewsUrl =
      'https://newsapi.org/v2/everything?q=tesla&from=2026-04-28&sortBy=publishedAt&apiKey=$apiKey';
  static const String topHeadlinesNewsUrl =
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$apiKey';

  static Future<NewsModel> getAppleNews() async {
    try {
      final response = await dio.get(appleNewsUrl);
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return NewsModel.fromJson(response.data);
      } else {
        throw DioException(requestOptions: response.requestOptions);
      }
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions);
    } on SocketException catch (_) {
      throw SocketException('Failed to connect to the server');
    } on TimeoutException catch (_) {
      throw TimeoutException('Request timed out or connection lost');
    } on FormatException catch (_) {
      throw FormatException('Invalid JSON format please try again later');
    } catch (e) {
      throw Exception('An unknown error occurred');
    }
  }

  static Future<NewsModel> getTeslaNews() async {
    try {
      final response = await dio.get(teslaNewsUrl);
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return NewsModel.fromJson(response.data);
      } else {
        throw DioException(requestOptions: response.requestOptions);
      }
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions);
    } on SocketException catch (_) {
      throw SocketException('Failed to connect to the server');
    } on TimeoutException catch (_) {
      throw TimeoutException('Request timed out or connection lost');
    } on FormatException catch (_) {
      throw FormatException('Invalid JSON format please try again later');
    } catch (e) {
      throw Exception('An unknown error occurred');
    }
  }

 static Future<NewsModel> getTopHeadlinesNews() async {
    try {
      final response = await dio.get(topHeadlinesNewsUrl);
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return NewsModel.fromJson(response.data);
      } else {
        throw DioException(requestOptions: response.requestOptions);
      }
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions);
    } on SocketException catch (_) {
      throw SocketException('Failed to connect to the server');
    } on TimeoutException catch (_) {
      throw TimeoutException('Request timed out or connection lost');
    } on FormatException catch (_) {
      throw FormatException('Invalid JSON format please try again later');
    } catch (e) {
      throw Exception('An unknown error occurred');
    }
  }
}