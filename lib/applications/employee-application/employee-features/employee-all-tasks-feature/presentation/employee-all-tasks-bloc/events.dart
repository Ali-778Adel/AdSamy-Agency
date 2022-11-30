import 'package:flutter/material.dart';

abstract  class EmployeeAllTasksEvents{}

class GetEmployeeAllTasksEvent extends EmployeeAllTasksEvents{

}

class GetEmployeeTaskDetailsEvent extends EmployeeAllTasksEvents{
  final int?taskId;
  final int? navIndex;
  GetEmployeeTaskDetailsEvent({this.taskId,this.navIndex});
}

class UpdateEmployeeTaskEvent extends EmployeeAllTasksEvents{
  final String?teamToken;
  final int ?taskId;
  final int? status;
  final int?navIndex;
  UpdateEmployeeTaskEvent({this.teamToken,this.taskId,this.status,this.navIndex});

}

class AllTasksPopEvent extends EmployeeAllTasksEvents{
  final BuildContext?context;
  AllTasksPopEvent({this.context});
}