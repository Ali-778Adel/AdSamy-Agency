import 'package:ad_samy/features/team-projects/domain/entities/team-overview-entity.dart';

class TeamOverViewModel extends TeamOverViewEntity{
TeamOverViewModel({final bool?status,final dynamic message,final TeamOverViewModelData?teamOverViewModelData})
:super(status: status,message: message,teamOverViewEntityData: teamOverViewModelData);

factory TeamOverViewModel.fromJson({required Map<String,dynamic>json}){
 return TeamOverViewModel(
   status: json['status'],
   message: json['message'],
   teamOverViewModelData: json['data']!=null?TeamOverViewModelData.fromJson(json: json['data']):null
 );
}
}

class TeamOverViewModelData extends TeamOverViewEntityData{

   TeamOverViewModelData({
    final dynamic activity,
    final List<InprogressProjectsModel>?inProgressProjects,
    final List<TodaysTasksModel>?todaysTasks,
  }):super(activity: activity,inprogressProjects: inProgressProjects,todaysTasks: todaysTasks);

   factory TeamOverViewModelData.fromJson({required Map<String,dynamic>json}){
     final dataTemp1=json['inprogress_projects']as List<dynamic>;
     final dataList1=dataTemp1.map((e) => InprogressProjectsModel.fromJson(json: e)).toList();

     final dataTemp2=json['todays_tasks']as List<dynamic>;
     final dataList2=dataTemp2.map((e) => TodaysTasksModel.fromModel(json: e)).toList();
    return TeamOverViewModelData(
      activity: json['activity'],
      inProgressProjects: dataList1,
      todaysTasks:dataList2,
    );
   }

}

class InprogressProjectsModel extends InprogressProjectsEntity{

  InprogressProjectsModel({
    final int? projectId,
    final String ?projectTitle,
    final int ?tasksCount,
    final int?projectProgress,
}):super(
    projectId: projectId,
    projectTitle: projectTitle,
    tasksCount: tasksCount,
      projectProgress: projectProgress
  );

  factory InprogressProjectsModel.fromJson({required Map<String,dynamic>json}){
    return InprogressProjectsModel(
      projectId: json['project_id'],
      projectTitle: json['project_title'],
      tasksCount: json['tasks_count'],
      projectProgress: json['project_progress']
    );
  }
}

class TodaysTasksModel extends TodaysTasksEntity{
  TodaysTasksModel({
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

  factory TodaysTasksModel.fromModel({required Map<String,dynamic>json}){
    return TodaysTasksModel(
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

