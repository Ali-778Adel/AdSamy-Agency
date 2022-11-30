// ignore_for_file: file_names


import '../../domain/entities/employee-all-tasks-entity.dart';

class EmployeeAllTasksModel extends EmployeeAllTasksEntity{
  EmployeeAllTasksModel({final bool?status,final dynamic message ,final List<EmployeeAllTasksModelData>?teamAllTaskModelData}):super(status: status,message: message,teamAllTasksEntityData: teamAllTaskModelData);

  factory EmployeeAllTasksModel.fromJson({required Map<String,dynamic>json}){
    final dataTemp =json['data']as List<dynamic>;
    final dataList=dataTemp.map((e) => EmployeeAllTasksModelData.fromJson(json: e)).toList();
    return EmployeeAllTasksModel(
      status: json['status'],
      message: json['message'],
      teamAllTaskModelData:dataList,
    );
  }
}
class  EmployeeAllTasksModelData extends EmployeeAllTasksEntityData{
  EmployeeAllTasksModelData({
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
  factory EmployeeAllTasksModelData.fromJson({required Map<String,dynamic>json}){
    return EmployeeAllTasksModelData(
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