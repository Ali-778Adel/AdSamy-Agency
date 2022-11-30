import 'dart:convert';

import 'package:ad_samy/core/utils/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../domain/use-cases/login-use-case.dart';
import '../../domain/use-cases/sign-up use-case.dart';
import '../models/confirm-password-model.dart';
import '../models/login-model.dart';
import '../models/sign-up-model.dart';
import '../network-services/list-api.dart';

abstract class AuthDataSource {
  Future<LoginModel> login(LoginParams loginParams);
  Future<SignUpModel> signUp(SignUpParams signUpParams);
  Future<Unit> confirmPassword(ConfirmPasswordModel confirmPasswordModel);
  Future<Unit> verifyOtp();
}

const String API = 'https://student.valuxapps.com/api/';

typedef SignInOrSignUpOrConfirmPassword = Object;

class AuthDataSourceImplWithHttp implements AuthDataSource {
  final http.Client client;
  const AuthDataSourceImplWithHttp({required this.client});
  @override
  Future<LoginModel> login(LoginParams loginParams) async {
    final response = await client.post(Uri.parse(
        AuthListApi.authApis(
            endPoint:loginParams.type=='client'?
            AuthListApi.clientLogin:AuthListApi.teamLogin)),
        body:loginParams.toJson()
    );

    if (response.statusCode == 200) {
      Map<String,dynamic> decodeResponse = jsonDecode(response.body);
      final result = LoginModel.fromJson(decodeResponse);
      return result;
    } else {
      throw ServerErrorException();
    }
  }

  @override
  Future<SignUpModel> signUp(SignUpParams signUpParams) async {
    final response = await client.post(Uri.parse('${API}register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(signUpParams.toJson()));
    Map<String, dynamic> decodeResponse = jsonDecode(response.body);
    final result = SignUpModel.fromJson(decodeResponse);
    if (response.statusCode == 200) {
      return result;
    } else {
      throw ServerErrorException();
    }
  }

  @override
  Future<Unit> confirmPassword(
      ConfirmPasswordModel confirmPasswordModel) async {
    final response = await client.post(Uri.parse('${API}ConfirmPassword'),
        body: confirmPasswordModel.toJson());
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerErrorException();
    }
  }

  @override
  Future<Unit> verifyOtp() {
    throw UnimplementedError();
  }

  Future<Unit> _getMessage(String endPoint,
      SignInOrSignUpOrConfirmPassword signInOrSignUpOrConfirmPassword) async {
    final response = await client.post(Uri.parse('$API$endPoint'),
        body: signInOrSignUpOrConfirmPassword);
    print(response.body);
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerErrorException();
    }
  }
}
