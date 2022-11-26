
import 'package:ad_samy/applications/employee-application/employee-features/employee-overview-feature/domain/entities/team-all-projects.dart';

class TeamAllProjectsModel extends TeamAllProjectsEntity {
  TeamAllProjectsModel(
      {final bool? status,
      final dynamic message,
      final TeamAllProjectsModelData? teamAllProjectsModelData})
      : super(
            status: status,
            message: message,
            teamAllProjectsEntityData: teamAllProjectsModelData);
  factory TeamAllProjectsModel.fromJson({required Map<String, dynamic> json}) {
    return TeamAllProjectsModel(
        status: json['status'],
        message: json['message'],
        teamAllProjectsModelData: json['data'] != null
            ? TeamAllProjectsModelData.fromJson(json: json['data'])
            : null);
  }
}

class TeamAllProjectsModelData extends TeamAllProjectsEntityData {
  TeamAllProjectsModelData({
    final List<InProgressProjectsAllProjectsEntity>? inProgressProjectsEntity,
    final List<CompletedProjectsEntity>? completedProjectsEntity,
  }) : super(
            InProgressProjectsEntity: inProgressProjectsEntity,
            completedProjectsEntity: completedProjectsEntity);
  factory TeamAllProjectsModelData.fromJson(
      {required Map<String, dynamic> json}) {
    final dataTemp1 = json['inprogress_projects'] as List<dynamic>;
    final dataList1 = dataTemp1.map((e) => InProgressProjectsAllProjectsModel.fromJson(json: e)).toList();
    final dataTemp2 = json['completed_projects'] as List<dynamic>;
    final dataList2 =
        dataTemp2.map((e) => CompletedProjectsModel.fromJson(json: e)).toList();
    return TeamAllProjectsModelData(
      inProgressProjectsEntity: dataList1,
      completedProjectsEntity: dataList2,
    );
  }
}

class InProgressProjectsAllProjectsModel
    extends InProgressProjectsAllProjectsEntity {
  InProgressProjectsAllProjectsModel({
    final int? projectId,
    final String? projectTitle,
    final int? tasksCount,
    final int?projectProgress,
  }) : super(
          projectId: projectId,
          projectTitle: projectTitle,
          tasksCount: tasksCount,
          projectProgress: projectProgress,
        );
  factory InProgressProjectsAllProjectsModel.fromJson(
      {required Map<String, dynamic> json}) {
    return InProgressProjectsAllProjectsModel(
        projectId: json['project_id'],
        projectTitle: json['project_title'],
        tasksCount: json['tasks_count'],
      projectProgress: json['project_progress']

    );
  }
}

class CompletedProjectsModel extends CompletedProjectsEntity {
  CompletedProjectsModel({
    final int? projectId,
    final String? projectTitle,
    final int? tasksCount,
    final int?projectProgress,
  }) : super(
            projectId: projectId,
            projectTitle: projectTitle,
            tasksCount: tasksCount,
    progressProgress: projectProgress
  );
  factory CompletedProjectsModel.fromJson(
      {required Map<String, dynamic> json}) {
    return CompletedProjectsModel(
        projectId: json['project_id'],
        projectTitle: json['project_title'],
        tasksCount: json['tasks_count'],
      projectProgress: json['project_progress']
    );
  }
}
