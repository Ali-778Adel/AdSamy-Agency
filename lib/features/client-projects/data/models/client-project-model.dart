
import 'package:ad_samy/features/client-projects/domain/entities/project-entity.dart';

class ClientProjectModel {
final bool?status;
final dynamic message;
final ClientProjectModelData ?data;

 ClientProjectModel({this.status,this.message,this.data});

factory ClientProjectModel.fromJson(Map<String,dynamic>json){
  return ClientProjectModel(
      status: json['status'],
      message: json['message'],
      data: json['data']!=null?ClientProjectModelData.fromJson(json: json['data']):null
  );
}
ClientProjectEntity toEntity(){
  final se=data!.toEntity();
  return ClientProjectEntity(
    status:status,
    message: message ,
    data: se,
  );
}

}

class ClientProjectModelData{
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
  final ProjectModelInvoices? projectModelInvoices;
  final ProjectModelTimeSpent? projectModelTimeSpent;
  final List<ProjectModelAssigned>? projectModelAssigned;
  final ProjectModelPayments? projectModelPayments;
  final dynamic projectManger;

  const ClientProjectModelData(
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
        this.projectModelInvoices,
        this.projectModelTimeSpent,
        this.projectModelAssigned,
        this.projectModelPayments,
        this.projectManger});


  factory ClientProjectModelData.fromJson({required Map<String,dynamic>json}){
    final dataTemp=json['project_assigned']==null?null:json['project_assigned'] as List<dynamic>;
    final list=dataTemp!.map((e) => ProjectModelAssigned.fromJson(json: e)).toList();
    return ClientProjectModelData(
        projectId:json['project_id'],
        projectCategory:json['project_category'],
        projectImportid:json['project_importid'],
        projectCreated:json['project_created'],
        projectClient:json['project_client'],
        projectCreatorFirstName:json['project_creator_first_name'] ,
        projectCreatorLastName:json['project_creator_last_name'] ,
        projectTitle:json['project_title'] ,
        projectDateStart:json['project_date_start'] ,
        projectDateDue:json['project_date_due'] ,
        projectDescription:json['project_description'] ,
        projectStatus:json['project_status'],
        projectActiveState: json['project_active_state'] ,
        projectProgress:json['project_progress'],
        projectBillingRate: json['project_billing_rate'] ,
        projectBillingType:json['project_billing_type'],
        projectBillingEstimatedHours: json['project_billing_estimated_hours'] ,
        projectBillingCostsEstimate:json['project_billing_costs_estimate'],
        projectProgressManually: json['project_progress_manually'] ,
        projectVisibility: json['project_visibility'] ,
        projectManger: json['project_manger'],
        projectModelAssigned:list,
        projectModelPayments:ProjectModelPayments.fromJson(json: json['project_payments']),
        projectModelTimeSpent:ProjectModelTimeSpent.fromJson(json: json['project_time_spent']),
        projectModelInvoices:ProjectModelInvoices.fromJson(json: json['project_invoices'])
    );

  }
  ClientProjectEntityData toEntity(){
  List<ProjectAssigned>cpes=projectModelAssigned!.map<ProjectAssigned>((e) => ProjectAssigned(
    id: e.id,
    email: e.email,
    firstName: e.firstName,
    lastname: e.lastname,
    position: e.position,
    type: e.type
  )).toList();

  return ClientProjectEntityData(
   projectId: projectId ,
    projectCategory: projectCategory,
    projectImportid: projectImportid,
    projectCreated: projectCreated,
    projectClient: projectClient,
    projectCreatorFirstName: projectCreatorFirstName,
    projectCreatorLastName: projectCreatorLastName,
    projectTitle: projectTitle,
    projectDateStart: projectDateStart,
    projectDateDue: projectDateDue,
    projectDescription: projectDescription,
    projectStatus: projectStatus,
    projectActiveState: projectActiveState,
    projectProgress: projectProgress,
    projectBillingRate:projectBillingRate,
    projectBillingType:projectBillingType ,
    projectBillingEstimatedHours: projectBillingEstimatedHours,
    projectBillingCostsEstimate:projectBillingCostsEstimate,
    projectProgressManually:projectProgressManually,
    projectVisibility: projectVisibility,
    projectPayments: projectModelPayments,
    projectInvoices: projectModelInvoices,
    projectTimeSpent: projectModelTimeSpent,
      projectAssigned:cpes


  );
  }
}
class ProjectModelInvoices extends ProjectInvoices {
  final int? totalInvoices;
  ProjectModelInvoices({this.totalInvoices}):super(totalInvoices: totalInvoices);

 factory ProjectModelInvoices.fromJson({required Map<String,dynamic>json}){
    return ProjectModelInvoices(totalInvoices: json['total_invoices']);
  }
}

class ProjectModelTimeSpent extends ProjectTimeSpent{
  @override
  final String? timeSpent;
  ProjectModelTimeSpent({this.timeSpent}):super(timeSpent: timeSpent);

  factory ProjectModelTimeSpent.fromJson({required Map<String,dynamic>json}){
   return ProjectModelTimeSpent(timeSpent: json['time_spent']);
  }
}

class ProjectModelAssigned extends ProjectAssigned{
  final int? id ;
  final String? email;
  final String? firstName;
  final String? lastname;
  final String? position;
  final String? type;

  ProjectModelAssigned(
      {this.id,
        this.email,
        this.firstName,
        this.lastname,
        this.position,
        this.type}):super(id: id,email: email,firstName: firstName,lastname: lastname,type: type);

  factory ProjectModelAssigned.fromJson({required Map<String,dynamic>json}){
    return ProjectModelAssigned(
        id:json['id'],
       email: json['email'],
      firstName: json['first_name'],
      lastname: json['lastname'],
      position: json['position'],
      type: json['type']
    );
  }
}

class   ProjectModelPayments extends ProjectPayments {
  final int? payments;
  ProjectModelPayments({this.payments}):super(payments: payments);

  factory ProjectModelPayments.fromJson({required Map<String,dynamic>json}){
    return ProjectModelPayments(payments: json['payments']);
  }
}
