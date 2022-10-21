class ClientAllProjectsEntity{
  final bool?status;
  final dynamic message;
  final List<ClientAllProjectsEntityData>?data;
  ClientAllProjectsEntity({this.status,this.message,this.data});
}

class ClientAllProjectsEntityData{
  final int? projectId;
 final String ?projectType;
  final dynamic projectImportid;
  final String? projectCreated;
  final String? projectUpdated;
  final int? projectClientid;
  final int ?projectCreatorid;
  final int? projectCategoryid;
  final dynamic projectCoverDirectory;
  final dynamic projectCoverFilename;
  final String? projectTitle;
  final String? projectDateStart;
  final String ?projectDateDue;
  final String? projectDescription;
  final String? projectStatus;
  final String? projectActiveState;
  final int? projectProgress;
  final String? projectBillingRate;
  final String? projectBillingType;
  final int ?projectBillingEstimatedHours;
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
  final dynamic projectCustomField1;
  final dynamic projectCustomField2;
  ClientAllProjectsEntityData({
    this. projectId,
    this.projectType,
    this. projectImportid,
    this. projectCreated,
    this. projectUpdated,
    this. projectClientid,
    this.projectCreatorid,
    this.projectCategoryid,
    this.projectCoverDirectory,
    this.projectCoverFilename,
    this. projectTitle,
    this. projectDateStart,
    this.projectDateDue,
    this.projectDescription,
    this. projectStatus,
    this. projectActiveState,
    this.projectProgress,
    this. projectBillingRate,
    this. projectBillingType,
    this.projectBillingEstimatedHours,
    this. projectBillingCostsEstimate,
    this. projectProgressManually,
    this.clientpermTasksView,
    this. clientpermTasksCollaborate,
    this. clientpermTasksCreate,
    this. clientpermTimesheetsView,
    this. clientpermExpensesView,
    this. assignedpermMilestoneManage,
    this.assignedpermTasksCollaborate,
    this. projectVisibility,
    this.projectCustomField1,
    this. projectCustomField2,

});
}