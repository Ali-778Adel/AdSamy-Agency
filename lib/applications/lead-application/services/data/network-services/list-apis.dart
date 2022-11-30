class ListApis{
ListApis._();
//base url

static const String appKey="d9Vn0K5ygmeg0UGRLBhplmTdSweY";
static const String baseUrl="https://crm.adsamy.com/api/";



//endpoints
static const String categories="categories";
static const String serviceDetails="get_category";
static const String registerLead="lead";

//api address combination
static String getThisApi( {String?endPoint}){
  return "$baseUrl$endPoint?api_pass=$appKey";
}

}