class AuthListApi{
  AuthListApi._();


  static const String appKey="d9Vn0K5ygmeg0UGRLBhplmTdSweY";
  static const String baseUrl="https://crm.adsamy.com/api/";


  //endPoints5



  static const clientLogin='client_login';
static const clientLogOut='';
static const getClient='';
static const teamLogin='team_login';
static const teamLogOut='';
static const getUser='get_user';



static String authApis({String?endPoint}){
  return "$baseUrl$endPoint?api_pass=$appKey";
}
}