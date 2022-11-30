import 'package:flutter/material.dart';

import '../../domain/entities/team-overview-entity.dart';


enum WichCycle{homeCycle,allTasksCycle,notificationsCycle,profileCycle}
abstract class TeamEvents{}


class GetTeamOverViewEvents extends TeamEvents{
  final int?navIndex;
  final String?teamToken;
  final WichCycle?wichCycle;
  final TeamOverViewEntity?teamOverViewEntity;
  GetTeamOverViewEvents({this.teamToken,this.navIndex,required this.wichCycle,this.teamOverViewEntity});
}

class GetTeamAllProjectsEvents extends TeamEvents{
  final int?navIndex;
  final String?teamToken;
  final WichCycle?wichCycle;

  GetTeamAllProjectsEvents({this.teamToken,this.navIndex,required this.wichCycle});
}

class GetTeamProjectTasksEvent extends TeamEvents{
  final String?teamToken;
  final int?projectId;
  final int ?navIndex;
  final WichCycle?wichCycle;
  GetTeamProjectTasksEvent({this.teamToken,this.projectId,this.navIndex,required this.wichCycle});
}
class GetTeamTaskDetailsEvent extends TeamEvents{
  final String?teamToken;
  final int ?taskId;
  final int?navIndex;
  final WichCycle?wichCycle;

  // final bool updateTaskState=false;
  GetTeamTaskDetailsEvent({
    this.teamToken,this.taskId,this.navIndex, this.wichCycle});
}
class GetTeamAllTasksEvent extends TeamEvents{
  final String?teamToken;
  final int ?taskId;
  final int? status;
  final int?navIndex;
  final WichCycle?wichCycle;

  GetTeamAllTasksEvent({this.teamToken,this.taskId,this.navIndex, this.status,required this.wichCycle});
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