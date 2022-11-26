class TeamAllProjectsEntity{
  final bool ?status;
  final dynamic ?message;
  final TeamAllProjectsEntityData?teamAllProjectsEntityData;
  TeamAllProjectsEntity({this.status,this.message,this.teamAllProjectsEntityData});
}
class TeamAllProjectsEntityData{
  final List<InProgressProjectsAllProjectsEntity>?InProgressProjectsEntity;
  final List<CompletedProjectsEntity>?completedProjectsEntity;
  TeamAllProjectsEntityData({this.InProgressProjectsEntity,this.completedProjectsEntity});
}

class InProgressProjectsAllProjectsEntity{
  final int?projectId;
  final String?projectTitle;
  final int ?tasksCount;
  final int?projectProgress;
  InProgressProjectsAllProjectsEntity({this.projectId,this.projectTitle,this.tasksCount,this.projectProgress});
}

class CompletedProjectsEntity{
  final int?projectId;
  final String?projectTitle;
  final int ?tasksCount;
  final int?progressProgress;
  CompletedProjectsEntity({this.projectId,this.projectTitle,this.tasksCount,this.progressProgress});
}