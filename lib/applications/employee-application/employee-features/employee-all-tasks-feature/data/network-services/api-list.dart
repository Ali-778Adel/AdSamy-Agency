class EmployeeAllTasksApiList{
  EmployeeAllTasksApiList._();
//base url

  static const String appKey="d9Vn0K5ygmeg0UGRLBhplmTdSweY";
  static const String baseUrl="https://crm.adsamy.com/api/";



//endpoints

  static const String getTeamAllTasks="get_team_tasks";
  static const String projectTasksDetails="get_task";
  static const String updateTaskStatus="update_task";



//api address combination
  static String getThisApi( {String?endPoint}){
    return "$baseUrl$endPoint?api_pass=$appKey";
  }

  static String getTaskDetailsApi( {String?endPoint,int?taskId}){
    return "$baseUrl$endPoint?api_pass=$appKey&id=$taskId";
  }

}