class TeamTaskDetailsEntity{
  final bool ?status;
  final dynamic message;
  final TeamTaskDetailsEntityData?taskDetailsEntityData;
  TeamTaskDetailsEntity({this.status,this.message,this.taskDetailsEntityData});
}
class  TeamTaskDetailsEntityData{
 final int ?taskId;
 final dynamic ?taskImportid;
 final  int ?taskPosition;
 final String? taskCreated;
 final  String ?taskUpdated;
 final  String ?taskCreator;
 // final int ?taskClientid;
 final String? taskProjectid;
 final String? taskDateStart;
 final dynamic? taskDateDue;
 final String? taskTitle;
 final dynamic? taskDescription;
 final String? taskClientVisibility;
 final int? taskMilestoneid;
 final String ?taskPreviousStatus;
 final String? taskPriority;
 final int? taskStatus;
 final String? taskActiveState;
 final String? taskBillable;
 final String? taskBillableStatus;
 final dynamic taskBillableInvoiceid;
 final dynamic taskBillableLineitemid;
 final String? taskVisibility;
 final String? taskOverdueNotificationSent;
 final String? taskRecurring;
 final dynamic taskRecurringDuration;
 final dynamic taskRecurringPeriod;
 final dynamic taskRecurringCycles;
 final int? taskRecurringCyclesCounter;
 final dynamic taskRecurringLast;
 final dynamic taskRecurringNext;
 final String? taskRecurringChild;
 final dynamic taskRecurringParentId;
 final String? taskRecurringCopyChecklists;
 final String? taskRecurringCopyFiles;
 final String? taskRecurringAutomaticallyAssign;
 final String? taskRecurringFinished;
 final dynamic taskCustomField1;

 TeamTaskDetailsEntityData({
   this.taskId,
   this.taskImportid,
   this.taskPosition,
   this.taskCreated,
   this.taskUpdated,
   this.taskCreator,
   // this.taskClientid,
   this.taskProjectid,
   this.taskDateStart,
   this.taskDateDue,
   this.taskTitle,
   this.taskDescription,
   this.taskClientVisibility,
   this.taskMilestoneid,
   this.taskPreviousStatus,
   this.taskPriority,
   this.taskStatus,
   this.taskActiveState,
   this.taskBillable,
   this.taskBillableStatus,
   this.taskBillableInvoiceid,
   this.taskBillableLineitemid,
   this.taskVisibility,
   this.taskOverdueNotificationSent,
   this.taskRecurring,
   this.taskRecurringDuration,
   this.taskRecurringPeriod,
   this.taskRecurringCycles,
   this.taskRecurringCyclesCounter,
   this.taskRecurringLast,
   this.taskRecurringNext,
   this.taskRecurringChild,
   this.taskRecurringParentId,
   this.taskRecurringCopyChecklists,
   this.taskRecurringCopyFiles,
   this.taskRecurringAutomaticallyAssign,
   this.taskRecurringFinished,
   this.taskCustomField1,
});
}