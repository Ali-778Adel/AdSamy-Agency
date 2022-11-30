class EmployeeAllTasksEntity{
  final bool?status;
  final dynamic message;
  final List<EmployeeAllTasksEntityData>?teamAllTasksEntityData;
  EmployeeAllTasksEntity({this.status,this.message,this.teamAllTasksEntityData});
}

class EmployeeAllTasksEntityData{
  final int? taskId;
  final String? taskTitle;
  final String?taskDateStart;
  final String?taskDataDue;
  final String?taskDescription;
  final String ?projectTitle;
  final String? taskPriority;
  final String? taskCreator;
  final int?taskStatus;


  EmployeeAllTasksEntityData(
      {this.taskId,
        this.taskTitle,
        this.projectTitle,
        this.taskPriority,
        this.taskDateStart,
        this.taskDataDue,
        this.taskDescription,
        this.taskCreator,
        this.taskStatus

      });

}