import 'dart:convert';
import 'package:ad_samy/core/utils/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../core/core-features/authentiacation/data/models/login-model.dart';
import '../models/client-all-projects-model.dart';
import '../models/client-project-model.dart';
import 'package:http/http.dart' as http;

import '../network-services/ListApi.dart';

abstract class ClientProjectsDataSource{

  Future<ClientProjectModel>getClientProject({required int clientId,required String clientToken});
  Future<ClientAllProjectsModel>getClientAllProject({required String clientToken,required int clientId});
  Future<LoginModel>getClientData();
}

class ClientProjectsDataSourceImpWithHttp implements ClientProjectsDataSource{
  final http.Client client;
  final SharedPreferences sharedPreferences;
  ClientProjectsDataSourceImpWithHttp({required this.client,required this.sharedPreferences});
  @override
  Future<ClientProjectModel> getClientProject({required int clientId,required String clientToken})async {
    final response=await client.post(
        Uri.parse(ClientListApi.getThisApi(endPoint:ClientListApi.clientProject)),
    headers: {
          'Authorization': "Bearer $clientToken",},
      body: {'id':'$clientId'}
    );
    print(' i will enter condition now ');
    if(response.statusCode==200){
      print('status is 200');
      print(response.body);
      Map<String,dynamic> decodeResponse= jsonDecode(response.body);
      ClientProjectModel responseToProjectModel=ClientProjectModel.fromJson(decodeResponse);
      print(responseToProjectModel.data!.projectStatus);
      return responseToProjectModel;
    }else{
      throw ServerErrorException();
    }
  }

  @override
  Future<LoginModel> getClientData()async {
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
  Future<ClientAllProjectsModel> getClientAllProject({required String clientToken,required int clientId})async {
    final response=await client.get(
        Uri.parse(ClientListApi.getClientProjectsApi(endPoint:ClientListApi.clientAllProject,clientId: clientId)),
        headers: {
          'Authorization': "Bearer $clientToken",},
    );
    print(' i will enter condition now ');
    if(response.statusCode==200){
      print('status is 200');
      print(response.body);
      Map<String,dynamic> decodeResponse= jsonDecode(response.body);
      ClientAllProjectsModel responseToProjectModel=ClientAllProjectsModel.fromJson( json:decodeResponse);
      // print(responseToProjectModel);
      return responseToProjectModel;
    }else{
      throw ServerErrorException();
    }
  }



}