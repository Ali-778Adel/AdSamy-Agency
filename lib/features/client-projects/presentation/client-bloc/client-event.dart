// ignore_for_file: file_names

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ClientProjectsEvents{}

class GetAllClientProjectsEvent extends ClientProjectsEvents{
  final String?clientToken;
  final int?index;
  GetAllClientProjectsEvent({this.clientToken,this.index});

}

class GetClientProjectEvent extends ClientProjectsEvents{
  final int?projectId;
  final int?index;
  GetClientProjectEvent({this.projectId,this.index});

}

class ProjectPopEvent extends ClientProjectsEvents{
 final BuildContext ?context;
  ProjectPopEvent({this.context});

}