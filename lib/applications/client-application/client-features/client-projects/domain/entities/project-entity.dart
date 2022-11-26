import 'package:equatable/equatable.dart';

class ClientProjectEntity extends Equatable {
  final bool? status;
  dynamic message;
  final ClientProjectEntityData? data;

  ClientProjectEntity({this.status, this.message, this.data});

  @override
  List<Object?> get props => [status, message, data];
}

class ClientProjectEntityData extends Equatable {
  final int? projectId;
  final String? projectCategory;
  final dynamic projectImportid;
  final String? projectCreated;
  final String? projectClient;
  final String? projectCreatorFirstName;
  final String? projectCreatorLastName;
  final String? projectTitle;
  final String? projectDateStart;
  final String? projectDateDue;
  final String? projectDescription;
  final String? projectStatus;
  final String? projectActiveState;
  final int? projectProgress;
  final String? projectBillingRate;
  final String? projectBillingType;
  final int? projectBillingEstimatedHours;
  final String? projectBillingCostsEstimate;
  final String? projectProgressManually;
  final String? projectVisibility;
  final ProjectInvoices? projectInvoices;
  final ProjectTimeSpent? projectTimeSpent;
  final List<ProjectAssigned>? projectAssigned;
  final ProjectPayments? projectPayments;
  final dynamic projectManger;

  const ClientProjectEntityData(
      {this.projectId,
      this.projectCategory,
      this.projectImportid,
      this.projectCreated,
      this.projectClient,
      this.projectCreatorFirstName,
      this.projectCreatorLastName,
      this.projectTitle,
      this.projectDateStart,
      this.projectDateDue,
      this.projectDescription,
      this.projectStatus,
      this.projectActiveState,
      this.projectProgress,
      this.projectBillingRate,
      this.projectBillingType,
      this.projectBillingEstimatedHours,
      this.projectBillingCostsEstimate,
      this.projectProgressManually,
      this.projectVisibility,
      this.projectInvoices,
      this.projectTimeSpent,
      this.projectAssigned,
      this.projectPayments,
      this.projectManger});

  @override
  List<Object?> get props => [
        projectId,
        projectCategory,
        projectImportid,
        projectCreated,
        projectTitle,
        projectDateStart,
        projectDateDue,
        projectDescription,
        projectStatus,
        projectActiveState,
        projectProgress,
        projectBillingRate,
        projectBillingType,
        projectBillingEstimatedHours,
        projectBillingCostsEstimate,
        projectProgressManually,
        projectVisibility,
      ];
}

class ProjectInvoices {
  final int? totalInvoices;
  ProjectInvoices({this.totalInvoices});
}

class ProjectTimeSpent {
  final String? timeSpent;

  ProjectTimeSpent({this.timeSpent});
}

class ProjectAssigned {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastname;
  final String? position;
  final String? type;

  ProjectAssigned(
      {this.id,
      this.email,
      this.firstName,
      this.lastname,
      this.position,
      this.type});
}

class ProjectPayments {
  final int? payments;
  ProjectPayments({this.payments});
}
