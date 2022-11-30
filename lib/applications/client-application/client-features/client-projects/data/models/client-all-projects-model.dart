
import '../../domain/entities/clint-all-projects-entity.dart';

class ClientAllProjectsModel {
  final bool? status;
  final dynamic message;
  final List<ClientAllProjectsModelData>? data;
  ClientAllProjectsModel({this.status, this.message, this.data});

  factory ClientAllProjectsModel.fromJson(
      {required Map<String, dynamic> json}) {
    final dataTemp = json['data'] as List<dynamic>;
    final list = dataTemp
        .map((e) => ClientAllProjectsModelData.fromJson(json: e))
        .toList();
    return ClientAllProjectsModel(
        status: json['status'], message: json['message'], data: list);
  }

  ClientAllProjectsEntity toEntity() {
    List<ClientAllProjectsEntityData> list =
        data!.map<ClientAllProjectsEntityData>((e) {
      return ClientAllProjectsEntityData(
        projectId: e.projectId,
        projectType: e.projectType,
        projectImportid: e.projectType,
        projectCreated: e.projectCreated,
        projectUpdated: e.projectUpdated,
        projectClientid: e.projectClientid,
        projectCreatorid: e.projectCreatorid,
        projectCategoryid: e.projectCategoryid,
        projectCoverDirectory: e.projectCoverDirectory,
        projectCoverFilename: e.projectCoverFilename,
        projectTitle: e.projectTitle,
        projectDateStart: e.projectDateStart,
        projectDateDue: e.projectDateDue,
        projectDescription: e.projectDescription,
        projectStatus: e.projectStatus,
        projectActiveState: e.projectActiveState,
        projectProgress: e.projectProgress,
        projectBillingRate: e.projectBillingRate,
        projectBillingType: e.projectBillingType,
        projectBillingEstimatedHours: e.projectBillingEstimatedHours,
        projectBillingCostsEstimate: e.projectBillingCostsEstimate,
        projectProgressManually: e.projectProgressManually,
        clientpermTasksView: e.clientpermTasksView,
        clientpermTasksCollaborate: e.clientpermTasksCollaborate,
        clientpermTasksCreate: e.clientpermTasksCreate,
        clientpermTimesheetsView: e.clientpermTimesheetsView,
        clientpermExpensesView: e.clientpermExpensesView,
        assignedpermMilestoneManage: e.assignedpermMilestoneManage,
        assignedpermTasksCollaborate: e.assignedpermTasksCollaborate,
        projectVisibility: e.projectVisibility,
        projectCustomField1: e.projectCustomField1,
        projectCustomField2: e.projectCustomField2,
        projectTasks: e.projectTasks
      );
    }).toList();
    return ClientAllProjectsEntity(
        status: status, message: message, data: list);
  }
}

class ClientAllProjectsModelData {
  final int? projectId;
  final String? projectType;
  final dynamic projectImportid;
  final String? projectCreated;
  final String? projectUpdated;
  final int? projectClientid;
  final int? projectCreatorid;
  final int? projectCategoryid;
  final dynamic projectCoverDirectory;
  final dynamic projectCoverFilename;
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
  final String? clientpermTasksView;
  final String? clientpermTasksCollaborate;
  final String? clientpermTasksCreate;
  final String? clientpermTimesheetsView;
  final String? clientpermExpensesView;
  final String? assignedpermMilestoneManage;
  final String? assignedpermTasksCollaborate;
  final String? projectVisibility;
  final dynamic projectTasks;
  final dynamic projectCustomField1;
  final dynamic projectCustomField2;
  ClientAllProjectsModelData({
    this.projectId,
    this.projectType,
    this.projectImportid,
    this.projectCreated,
    this.projectUpdated,
    this.projectClientid,
    this.projectCreatorid,
    this.projectCategoryid,
    this.projectCoverDirectory,
    this.projectCoverFilename,
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
    this.clientpermTasksView,
    this.clientpermTasksCollaborate,
    this.clientpermTasksCreate,
    this.clientpermTimesheetsView,
    this.clientpermExpensesView,
    this.assignedpermMilestoneManage,
    this.assignedpermTasksCollaborate,
    this.projectTasks,
    this.projectVisibility,
    this.projectCustomField1,
    this.projectCustomField2,
  });

  factory ClientAllProjectsModelData.fromJson(
      {required Map<String, dynamic> json}) {
    return ClientAllProjectsModelData(
      projectId: json['project_id'],
      projectType: json['project_type'],
      projectImportid: json['project_importid'],
      projectCreated: json['project_created'],
      projectUpdated: json['project_updated'],
      projectClientid: json['project_clientid'],
      projectCreatorid: json['project_creatorid'],
      projectCategoryid: json['project_categoryid'],
      projectCoverDirectory: json['project_cover_directory'],
      projectCoverFilename: json['project_cover_filename'],
      projectTitle: json['project_title'],
      projectDateStart: json['project_date_start'],
      projectDateDue: json['project_date_due'],
      projectDescription: json['project_description'],
      projectStatus: json['project_status'],
      projectActiveState: json['project_active_state'],
      projectProgress: json['project_progress'],
      projectBillingRate: json['project_billing_rate'],
      projectBillingType: json['project_billing_type'],
      projectBillingEstimatedHours: json['project_billing_estimated_hours'],
      projectBillingCostsEstimate: json['project_billing_costs_estimate'],
      projectProgressManually: json['project_progress_manually'],
      clientpermTasksView: json['clientperm_tasks_view'],
      clientpermTasksCollaborate: json['clientperm_tasks_collaborate'],
      clientpermTasksCreate: json['clientperm_tasks_create'],
      clientpermTimesheetsView: json['clientperm_timesheets_view'],
      clientpermExpensesView: json['clientperm_expenses_view'],
      assignedpermMilestoneManage: json['assignedperm_milestone_manage'],
      assignedpermTasksCollaborate: json['assignedperm_tasks_collaborate'],
      projectVisibility: json['project_visibility'],
      projectTasks: json['project_tasks'],
      projectCustomField1: json['project_custom_field_1'],
      projectCustomField2: json['project_custom_field_2'],
    );
  }
}
