import 'dart:convert';

import 'package:ad_samy/features/profile/data/models/user-cache-model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/exceptions.dart';
import '../../../authentiacation/data/models/login-model.dart';

abstract class ProfileLocalDataSource{
  Future<UserCacheModel>getClientCachedData();
  Future<bool>deleteUserCachedData();
}
class ProfileLocalDataSourceImpl implements ProfileLocalDataSource{
  final SharedPreferences sharedPreferences;
  ProfileLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<UserCacheModel> getClientCachedData()async {
    try{
      Map<String,dynamic>demo={'success':false,'user':null};
      final json1=jsonEncode(demo);
      final response= sharedPreferences.getString('CLIENTAUTHDATA');
      final result=jsonDecode(response??json1);
      final resultToModel=UserCacheModel.fromJson(result);

      return resultToModel;


    } on EmptyCacheException{
      throw EmptyCacheException();
    }
  }

  @override
  Future<bool> deleteUserCachedData() {
    try{
    final response=  sharedPreferences.remove('CLIENTAUTHDATA');
    return response;
    }on EmptyCacheException{
      throw ServerErrorException();
    }
  }

}
