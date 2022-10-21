import 'dart:convert';

import 'package:ad_samy/core/exceptions.dart';
import 'package:ad_samy/features/authentiacation/data/models/confirm-password-model.dart';
import 'package:ad_samy/features/authentiacation/data/models/login-model.dart';
import 'package:ad_samy/features/authentiacation/data/models/sign-up-model.dart';
import 'package:ad_samy/features/authentiacation/data/network-services/list-api.dart';
import 'package:ad_samy/features/authentiacation/domain/use-cases/sign-up%20use-case.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../domain/use-cases/login-use-case.dart';

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
      print('true');
      return Future.value(unit);
    } else {
      throw ServerErrorException();
    }
  }
}
