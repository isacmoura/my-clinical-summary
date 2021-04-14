import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_clinical_summary/repositories/models/viewModels.dart';
import 'package:my_clinical_summary/resources/exceptions/Exceptions.dart';
import 'package:my_clinical_summary/resources/exceptions/Failures.dart';

class UserRepository {
  final baseUrl = Platform.isAndroid
      ? "http://192.168.1.27:5000"
      : "http://127.0.0.1:5000";
  final httpClient = new Dio(
    BaseOptions(
      connectTimeout: 6000,
      receiveTimeout: 6000,
    ),
  );

  UserRepository() : super();

  Future<Either<Failures, List<UserViewModel>>> getUsers() async {
    try {
      final result = await httpClient.get("$baseUrl/");
      final List<dynamic> jsonResult = result.data;

      return Right(jsonResult.map((i) => UserViewModel.fromJson(i)).toList());
    } on DioError catch (e) {
      return Left(e.error is InternetConnectionException
          ? InternetConnectionFailure()
          : ServerFailure.instance);
    }
  }

  Future<Either<Failures, UserViewModel>> getUserInformation(int userId) async {
    try {
      final result = await httpClient.get("$baseUrl/user/$userId");

      return Right(UserViewModel.fromJson(result.data));
    } on DioError catch (e) {
      return Left(e.error is InternetConnectionException
          ? InternetConnectionFailure()
          : ServerFailure.instance);
    }
  }
}
