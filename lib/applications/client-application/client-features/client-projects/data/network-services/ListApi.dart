class ClientListApi{
  ClientListApi._();

  static const String appKey="d9Vn0K5ygmeg0UGRLBhplmTdSweY";
  static const String baseUrl="https://crm.adsamy.com/api/";



//endpoints
  static const String clientProject="get_project";
  static const String clientAllProject="get_client_projects";


//api address combination
  static String getThisApi( {String?endPoint}){
    return "$baseUrl$endPoint?api_pass=$appKey";
  }

  static String getClientProjectsApi( {String?endPoint,int?clientId}){
    return "$baseUrl$endPoint?api_pass=$appKey&id=$clientId";
  }
}