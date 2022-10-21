class ProjectTasksEntity{
  final bool?status;
  final dynamic message;
  final List<ProjectsTasksEntityData>?projectsTasksEntityData;
  ProjectTasksEntity({this.status,this.message,this.projectsTasksEntityData});
}

class ProjectsTasksEntityData{
  final int? taskId;
  final String? taskTitle;
  final String?taskDateStart;
  final String?taskDataDue;
  final String?taskDescription;
  final String ?projectTitle;
  final String? taskPriority;
  final String? taskCreator;

  ProjectsTasksEntityData(
      {this.taskId,
        this.taskTitle,
        this.projectTitle,
        this.taskPriority,
        this.taskDateStart,
        this.taskDataDue,
        this.taskDescription,
        this.taskCreator});

}