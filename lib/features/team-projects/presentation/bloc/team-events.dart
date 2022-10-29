import 'package:flutter/material.dart';

abstract class TeamEvents{}

class GetTeamOverViewEvents extends TeamEvents{
  final int?navIndex;
  final String?teamToken;
  GetTeamOverViewEvents({this.teamToken,this.navIndex});
}

class GetTeamAllProjectsEvents extends TeamEvents{
  final int?navIndex;
  final String?teamToken;
  GetTeamAllProjectsEvents({this.teamToken,this.navIndex});
}

class GetTeamProjectTasksEvent extends TeamEvents{
  final String?teamToken;
  final int?projectId;
  final int ?navIndex;
  GetTeamProjectTasksEvent({this.teamToken,this.projectId,this.navIndex});
}
class GetTeamTaskDetailsEvent extends TeamEvents{
  final String?teamToken;
  final int ?taskId;
  final int?navIndex;

  // final bool updateTaskState=false;
  GetTeamTaskDetailsEvent({
    this.teamToken,this.taskId,this.navIndex,});
}
class GetTeamAllTasksEvent extends TeamEvents{
  final String?teamToken;
  final int ?taskId;
  final int? status;
  final int?navIndex;
  GetTeamAllTasksEvent({this.teamToken,this.taskId,this.navIndex, this.status});
}

class UpdateTaskStatusEvent extends TeamEvents{
  final String?teamToken;
  final int ?taskId;
  final int status;
  final int?navIndex;
  UpdateTaskStatusEvent({this.teamToken,this.taskId,this.navIndex,required this.status});
}
class PopEvent extends TeamEvents{
  BuildContext ?context;
  PopEvent({this.context});
}