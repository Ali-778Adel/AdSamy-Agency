class TeamOverViewEntity {
  final bool ?status;
  final dynamic message;
  final TeamOverViewEntityData ?teamOverViewEntityData;

  TeamOverViewEntity({this.status, this.message, this.teamOverViewEntityData});
}

class TeamOverViewEntityData {
  final dynamic  activity;
  final List<InprogressProjectsEntity>? inprogressProjects;
  final List<TodaysTasksEntity>? todaysTasks;

  TeamOverViewEntityData({this.activity, this.inprogressProjects, this.todaysTasks});

}

class InprogressProjectsEntity {
 final int? projectId;
 final String ?projectTitle;
 final int ?tasksCount;
 final int?projectProgress;

 InprogressProjectsEntity({this.projectId, this.projectTitle,this.tasksCount,this.projectProgress});


}

class TodaysTasksEntity {
 final int? taskId;
 final String? taskTitle;
 final String?taskDateStart;
 final String?taskDataDue;
 final String?taskDescription;
 final String ?projectTitle;
 final String? taskPriority;
 final String? taskCreator;

 TodaysTasksEntity(
      {this.taskId,
        this.taskTitle,
        this.projectTitle,
        this.taskPriority,
        this.taskDateStart,
        this.taskDataDue,
        this.taskDescription,
        this.taskCreator});


}