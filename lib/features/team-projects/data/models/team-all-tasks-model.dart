// ignore_for_file: file_names

import 'package:ad_samy/features/team-projects/domain/entities/project-tasks-entity.dart';
import 'package:ad_samy/features/team-projects/domain/entities/team-all-tasks-entity.dart';

class TeamAllTasksModel extends TeamAllTasksEntity{
  TeamAllTasksModel({final bool?status,final dynamic message ,final List<TeamAllTasksModelData>?teamAllTaskModelData}):super(status: status,message: message,teamAllTasksEntityData: teamAllTaskModelData);

  factory TeamAllTasksModel.fromJson({required Map<String,dynamic>json}){
    final dataTemp =json['data']as List<dynamic>;
    final dataList=dataTemp.map((e) => TeamAllTasksModelData.fromJson(json: e)).toList();
    return TeamAllTasksModel(
      status: json['status'],
      message: json['message'],
      teamAllTaskModelData:dataList,
    );
  }
}
class  TeamAllTasksModelData extends TeamAllTasksEntityData{
  TeamAllTasksModelData({
    final int? taskId,
    final String? taskTitle,
    final String?taskDateStart,
    final String?taskDataDue,
    final String?taskDescription,
    final String ?projectTitle,
    final String? taskPriority,
    final String? taskCreator,
    final int?taskStatus,

  }):super(
      taskId: taskId,
      taskTitle: taskTitle,
      projectTitle: projectTitle,
      taskPriority: taskPriority,
      taskCreator: taskCreator,
      taskDateStart: taskDateStart,
      taskDataDue: taskDataDue,
      taskDescription: taskDescription,
      taskStatus:taskStatus,
  );
  factory TeamAllTasksModelData.fromJson({required Map<String,dynamic>json}){
    return TeamAllTasksModelData(
        taskId: json['task_id'],
        taskTitle: json['task_title'],
        projectTitle: json['project_title'],
        taskPriority: json['task_priority'],
        taskCreator: json['task_creator'],
        taskDateStart: json['task_date_start'],
        taskDataDue: json['task_date_due'],
        taskDescription: json['task_description']
    );
  }

}