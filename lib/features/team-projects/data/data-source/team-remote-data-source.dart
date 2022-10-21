import 'dart:convert';

import 'package:ad_samy/core/exceptions.dart';
import 'package:ad_samy/features/team-projects/data/models/project-tasks-model.dart';
import 'package:ad_samy/features/team-projects/data/models/team-all-projects-model.dart';
import 'package:ad_samy/features/team-projects/data/models/team-overview-model.dart';
import 'package:ad_samy/features/team-projects/data/models/team-task-details-model.dart';
import 'package:ad_samy/features/team-projects/data/network-services/api-list.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors.dart';
import '../../../authentiacation/data/models/login-model.dart';

abstract class TeamRemoteDataSource{
  Future<TeamOverViewModel>getTeamOverView({String?teamToken});
  Future<TeamAllProjectsModel>getTeamAllProjects({String?teamToken});
  Future<ProjectTasksModel>getTeamProjectTasks({String?teamToken,int?projectId});
  Future<TeamTaskDetailsModel>getTeamTaskDetails({String?teamToken,int?taskId});
  Future<LoginModel>getClientData();
  Future<Unit>updateTaskStatus({String?teamToken,int?taskId,int ?status});
}

class TeamRemoteDataSourceImplWithHttp implements TeamRemoteDataSource{
  final http.Client client;
  final SharedPreferences sharedPreferences;
  TeamRemoteDataSourceImplWithHttp({required this.client,required this.sharedPreferences});
  @override
  Future<TeamOverViewModel> getTeamOverView({String ?teamToken})async {
    final response=await client.get(Uri.parse(
        TeamApiList.getThisApi(endPoint: TeamApiList.teamOverView)),
      headers: {
        'Authorization': "Bearer $teamToken ",},
    );
    if(response.statusCode==200){
      print(response.body);
      final decodeResponse=jsonDecode(response.body);
      final responseToModel=TeamOverViewModel.fromJson(json: decodeResponse);
      return responseToModel;
    }else{
      throw ServerErrorException();
    }
  }
  @override
  Future< TeamAllProjectsModel> getTeamAllProjects({String ?teamToken})async {
    final response=await client.get(Uri.parse(
        TeamApiList.getThisApi(endPoint: TeamApiList.teamAllProjects)),
      headers: {
        'Authorization': "Bearer $teamToken",},
    );
    if(response.statusCode==200){
      final decodeResponse=jsonDecode(response.body);
      final responseToModel=TeamAllProjectsModel.fromJson(json: decodeResponse);
      return responseToModel;
    }else{
      throw ServerErrorException();    }
  }



  @override
  Future< ProjectTasksModel> getTeamProjectTasks({String? teamToken, int? projectId})async {
    final response=await client.post(Uri.parse(
        TeamApiList.getThisApi(endPoint: TeamApiList.projectTasks)),
        body: {'id':'$projectId'},
      headers: {
        'Authorization': "Bearer $teamToken ",},
    );
    if(response.statusCode==200){
      print(response.body);
      final decodeResponse=jsonDecode(response.body);
      final responseToModel= ProjectTasksModel.fromJson(json: decodeResponse);
      print('ali adel ${responseToModel.projectsTasksEntityData![0].projectTitle}');
      return responseToModel;
    }else{
      throw ServerErrorException();
    }
  }

  @override
  Future<TeamTaskDetailsModel> getTeamTaskDetails({String? teamToken, int? taskId})async {
    final response=await client.get(Uri.parse(
        TeamApiList.getTaskDetailsApi(endPoint: TeamApiList.projectTasksDetails,taskId: taskId)),
      headers: {
        'Authorization': "Bearer $teamToken",},
    );
    if(response.statusCode==200){
      print(response.body);
      final decodeResponse=jsonDecode(response.body);
      final responseToModel=TeamTaskDetailsModel.fromJson(json: decodeResponse);
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
  Future<Unit> updateTaskStatus({String?teamToken,int? taskId,int?status})async {
     final response=await client.post(
         Uri.parse(TeamApiList.getThisApi(endPoint: TeamApiList.updateTaskStatus)),
       body: {'id':'$taskId',
              'status':'$status'
       },
       headers: {
         'Authorization': "Bearer $teamToken"},

     );
     if(response.statusCode==200){
      print(response.body);
      return Future.value(unit);
     }
    throw UnimplementedError();
  }
}