import 'package:ad_samy/features/team-projects/domain/entities/project-tasks-entity.dart';

class ProjectTasksModel extends ProjectTasksEntity{
  ProjectTasksModel({final bool?status,final dynamic message ,final List<ProjectTasksModelData>?projectTasksModelData}):super(status: status,message: message,projectsTasksEntityData: projectTasksModelData);

  factory ProjectTasksModel.fromJson({required Map<String,dynamic>json}){
    final dataTemp =json['data']as List<dynamic>;
    final dataList=dataTemp.map((e) => ProjectTasksModelData.fromJson(json: e)).toList();
    return ProjectTasksModel(
        status: json['status'],
        message: json['message'],
      projectTasksModelData:dataList,
    );
  }
}
class  ProjectTasksModelData extends ProjectsTasksEntityData{
  ProjectTasksModelData({
    final int? taskId,
    final String? taskTitle,
    final String?taskDateStart,
    final String?taskDataDue,
    final String?taskDescription,
    final String ?projectTitle,
    final String? taskPriority,
    final String? taskCreator,

  }):super(
      taskId: taskId,
      taskTitle: taskTitle,
      projectTitle: projectTitle,
      taskPriority: taskPriority,
      taskCreator: taskCreator,
      taskDateStart: taskDateStart,
      taskDataDue: taskDataDue,
      taskDescription: taskDescription
  );
  factory ProjectTasksModelData.fromJson({required Map<String,dynamic>json}){
    return ProjectTasksModelData(
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