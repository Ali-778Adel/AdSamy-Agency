import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


import '../../../../../../core/core-features/authentiacation/data/models/login-model.dart';
import '../../../../../../core/utils/exceptions.dart';
import '../models/employee-all-tasks-model.dart';
import '../models/employee-task-details-model.dart';
import '../models/update-employee-task-model.dart';
import '../network-services/api-list.dart';
abstract class EmployeeAllTasksDataSource{
  Future<EmployeeAllTasksModel>getTeamAllTasks({String?teamToken});
  Future<EmployeeTaskDetailsModel>getTeamTaskDetails({String?teamToken,int?taskId});
  Future<LoginModel>getClientData();
  Future<UpdateEmployeeTaskModel>updateTaskStatus({String?teamToken,int?taskId,int ?status});
}

class EmployeeAllTasksDataSourceImpl implements EmployeeAllTasksDataSource{
  final http.Client client;
  final SharedPreferences sharedPreferences;

  EmployeeAllTasksDataSourceImpl({required this.client,required this.sharedPreferences});


  @override
  Future<EmployeeAllTasksModel> getTeamAllTasks({String? teamToken})async {
    final response=await client.get(
      Uri.parse(EmployeeAllTasksApiList.getThisApi(endPoint:EmployeeAllTasksApiList.getTeamAllTasks)),
      headers: {
        'Authorization': "Bearer $teamToken"},
    );
    if(response.statusCode==200){
      final decodeResponse=jsonDecode(response.body);
      final decodeToObject=EmployeeAllTasksModel.fromJson(json: decodeResponse);
      return decodeToObject;
    }else{
      throw ServerErrorException();
    }
  }

  @override
  Future<EmployeeTaskDetailsModel> getTeamTaskDetails({String? teamToken, int? taskId})async {
    final response=await client.get(Uri.parse(
        EmployeeAllTasksApiList.getTaskDetailsApi(endPoint: EmployeeAllTasksApiList.projectTasksDetails,taskId: taskId)),
      headers: {
        'Authorization': "Bearer $teamToken",},
    );
    if(response.statusCode==200){
      print(response.body);
      final decodeResponse=jsonDecode(response.body);
      final responseToModel=EmployeeTaskDetailsModel.fromJson(json: decodeResponse);
      return responseToModel;
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
  Future<UpdateEmployeeTaskModel> updateTaskStatus({String?teamToken,int? taskId,int?status})async {
    final response=await client.post(
      Uri.parse(EmployeeAllTasksApiList.getThisApi(endPoint: EmployeeAllTasksApiList.updateTaskStatus)),
      body: {'id':'$taskId',
        'status':'$status'
      },
      headers: {
        'Authorization': "Bearer $teamToken"},

    );
    if(response.statusCode==200){
      final decodeResponse=jsonDecode(response.body);
      final responseToModel=UpdateEmployeeTaskModel.fromJson(json: decodeResponse);
      print(response.body);
      return Future.value(responseToModel);
    }else{
      throw ServerErrorException();
    }

  }
}

