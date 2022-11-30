
import 'package:ad_samy/applications/employee-application/employee-features/employee-overview-feature/domain/entities/team-task-details-entity.dart';

class TeamTaskDetailsModel extends TeamTaskDetailsEntity{
TeamTaskDetailsModel({final bool ?status,final dynamic message,final TeamTaskDetailsModelData ?teamTaskDetailsModelData})
    :super(status: status,message: message,taskDetailsEntityData: teamTaskDetailsModelData);
factory TeamTaskDetailsModel.fromJson({required Map<String,dynamic>json}){
  return TeamTaskDetailsModel(
    status: json['status'],
    message: json['message'],
    teamTaskDetailsModelData: json['data']!=null?TeamTaskDetailsModelData.fromJson(json: json['data']):null,
  );
}

}
class TeamTaskDetailsModelData extends TeamTaskDetailsEntityData{
  TeamTaskDetailsModelData({
    final int ?taskId,
    final dynamic taskImportid,
    final  int ?taskPosition,
    final String? taskCreated,
    final  String ?taskUpdated,
    final  String ?taskCreator,
    // final int ?taskClientid,
    final String? taskProjectid,
    final String? taskDateStart,
    final dynamic? taskDateDue,
    final String? taskTitle,
    final dynamic? taskDescription,
    final String? taskClientVisibility,
    final int? taskMilestoneid,
    final String ?taskPreviousStatus,
    final String? taskPriority,
    final int? taskStatus,
    final String? taskActiveState,
    final String? taskBillable,
    final String? taskBillableStatus,
    final dynamic taskBillableInvoiceid,
    final dynamic taskBillableLineitemid,
    final String? taskVisibility,
    final String? taskOverdueNotificationSent,
    final String? taskRecurring,
    final dynamic taskRecurringDuration,
    final dynamic taskRecurringPeriod,
    final dynamic taskRecurringCycles,
    final int? taskRecurringCyclesCounter,
    final dynamic taskRecurringLast,
    final dynamic taskRecurringNext,
    final String? taskRecurringChild,
    final dynamic taskRecurringParentId,
    final String? taskRecurringCopyChecklists,
    final String? taskRecurringCopyFiles,
    final String? taskRecurringAutomaticallyAssign,
    final String? taskRecurringFinished,
    final dynamic taskCustomField1,
}):super(
  taskId:taskId,
  taskImportid:taskImportid,
  taskPosition:taskPosition,
   taskCreated: taskCreated,
  taskUpdated:taskUpdated,
  taskCreator:taskCreator,
  // taskClientid:taskClientid,
  taskProjectid:taskProjectid,
  taskDateStart:taskDateStart,
  taskDateDue:taskDateDue,
  taskTitle:taskTitle,
   taskDescription:taskDescription,
  taskClientVisibility:taskClientVisibility,
  taskMilestoneid:taskMilestoneid,
  taskPreviousStatus:taskPreviousStatus,
  taskPriority:taskPreviousStatus,
  taskStatus:taskStatus,
  taskActiveState:taskActiveState,
    taskBillable:taskBillable,
    taskBillableStatus:taskBillableStatus,
    taskBillableInvoiceid:taskBillableInvoiceid,
    taskBillableLineitemid: taskBillableLineitemid,
    taskVisibility: taskVisibility,
    taskOverdueNotificationSent:taskOverdueNotificationSent,
    taskRecurring: taskRecurring,
    taskRecurringDuration:taskRecurringDuration,
    taskRecurringPeriod:taskRecurringPeriod,
    taskRecurringCycles:taskRecurringCycles,
    taskRecurringCyclesCounter:taskRecurringCyclesCounter,
    taskRecurringLast :taskRecurringLast,
    taskRecurringNext: taskRecurringNext,
    taskRecurringChild:taskRecurringChild,
    taskRecurringParentId:taskRecurringParentId,
    taskRecurringCopyChecklists:taskRecurringCopyChecklists,
    taskRecurringCopyFiles:taskRecurringCopyFiles,
    taskRecurringAutomaticallyAssign:taskRecurringAutomaticallyAssign,
    taskRecurringFinished:taskRecurringFinished,  );
  factory TeamTaskDetailsModelData.fromJson({required Map<String,dynamic>json}){
   return TeamTaskDetailsModelData(
       taskId : json['task_id'],
       taskImportid : json['task_importid'],
       taskPosition : json['task_position'],
       taskCreated : json['task_created'],
       taskUpdated : json['task_updated'],
       taskCreator : json['task_creator'],
       // taskClientid : json['task_clientid'],
       taskProjectid : json['task_projectid'],
       taskDateStart : json['task_date_start'],
       taskDateDue : json['task_date_due'],
       taskTitle : json['task_title'],
       taskDescription : json['task_description'],
       taskClientVisibility : json['task_client_visibility'],
   taskMilestoneid : json['task_milestoneid'],
   taskPreviousStatus : json['task_previous_status'],
   taskPriority : json['task_priority'],
   taskStatus : json['task_status'],
   taskActiveState : json['task_active_state'],
   taskBillable : json['task_billable'],
   taskBillableStatus : json['task_billable_status'],
   taskBillableInvoiceid : json['task_billable_invoiceid'],
   taskBillableLineitemid : json['task_billable_lineitemid'],
   taskVisibility : json['task_visibility'],
   taskOverdueNotificationSent : json['task_overdue_notification_sent'],
   taskRecurring : json['task_recurring'],
   taskRecurringDuration : json['task_recurring_duration'],
   taskRecurringPeriod : json['task_recurring_period'],
   taskRecurringCycles : json['task_recurring_cycles'],
   taskRecurringCyclesCounter : json['task_recurring_cycles_counter'],
   taskRecurringLast : json['task_recurring_last'],
   taskRecurringNext : json['task_recurring_next'],
   taskRecurringChild : json['task_recurring_child'],
   taskRecurringParentId : json['task_recurring_parent_id'],
   taskRecurringCopyChecklists : json['task_recurring_copy_checklists'],
   taskRecurringCopyFiles  :json['task_recurring_copy_files'],
   taskRecurringAutomaticallyAssign :
   json['task_recurring_automatically_assign'],
   taskRecurringFinished : json['task_recurring_finished'],
   taskCustomField1 : json['task_custom_field_1'],
   ) ;
  }

}