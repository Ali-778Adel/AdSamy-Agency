import 'dart:convert';

import 'package:ad_samy/core/exceptions.dart';
import 'package:ad_samy/features/authentiacation/data/models/login-model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors.dart';

abstract class LocalDataSource{
  Future<Unit>cachingClientAuthData(LoginModel loginModel );

  Future<LoginModel>getClientAuthCachedData();

  Future<Unit>cachingEmployeeAuthData(LoginModel loginModel );

  // Future<LoginModel>getEmployeeAuthCachedData();
}

class LocalDataSourceImplWithSharedPref implements LocalDataSource{
  final SharedPreferences sharedPreferences;
  LocalDataSourceImplWithSharedPref({
   required this.sharedPreferences
  });
  @override
  Future<Unit> cachingClientAuthData(LoginModel loginModel)async {
    final objectToJson=jsonEncode(loginModel);
    await sharedPreferences.setString('CLIENTAUTHDATA', objectToJson);
    return Future.value(unit);
  }

  @override
  Future<LoginModel> getClientAuthCachedData()async {
    try{
      Map<String,dynamic>demo={'success':false,'user':null};
      final json1=jsonEncode(demo);
      final response= sharedPreferences.getString('CLIENTAUTHDATA');
      final result=jsonDecode(response??json1);
      final resultToModel=LoginModel.fromJson(result);
      return resultToModel;
    } on EmptyCacheException{
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> cachingEmployeeAuthData(LoginModel loginModel)async {
    final objectToJson=jsonEncode(loginModel);
    await sharedPreferences.setString('EMPLOYEEAUTHDATA', objectToJson);
    return Future.value(unit);
  }

  // @override
  // Future<LoginModel> getEmployeeAuthCachedData() async{
  //   try{
  //     Map<String,dynamic>demo={'success':false,'user':null};
  //     final json1=jsonEncode(demo);
  //     final response= sharedPreferences.getString('EMPLOYEEAUTHDATA');
  //     final result=jsonDecode(response??json1);
  //     final resultToModel=LoginModel.fromJson(result);
  //     return resultToModel;
  //   } on EmptyCacheException{
  //     throw EmptyCacheException();
  //   }
  // }

}