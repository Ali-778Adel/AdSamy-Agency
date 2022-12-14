import 'dart:convert';
import 'package:ad_samy/core/utils/exceptions.dart';
import '../../domain/use_cases/send-lead-form-sue-case.dart';
import '../models/register-lead-model.dart';
import '../models/service-details-model.dart';
import '../models/service_model.dart';
import 'package:http/http.dart' as http;

import '../network-services/list-apis.dart';

abstract class ServicesDataSource {
  Future<ServiceModel> showAllServices();
  Future<ServiceDetailsModel>showServiceDetails({int ?catId});
  Future<RegisterLeadModel>registerLead({required LeadFormParams leadFormParams});
}

class ServiceDataSourceImplWithHttp implements ServicesDataSource {
  final http.Client client;

  ServiceDataSourceImplWithHttp({required this.client});

  @override
  Future<ServiceModel> showAllServices() async {
    final res = await client
        .get(Uri.parse(ListApis.getThisApi(endPoint: ListApis.categories)));
    if(res.statusCode==200){
      var decodeResponse = jsonDecode(res.body) ;
      ServiceModel serviceModel=  ServiceModel.fromJson( json: decodeResponse);
      return serviceModel;
    }else{
      throw ServerErrorException();
    }

  }

  @override
  Future<ServiceDetailsModel> showServiceDetails({int?catId})async {
    final response=await client.post(Uri.parse(ListApis.getThisApi(endPoint:ListApis.serviceDetails)),
    body: {
      'id':'$catId'
    });
      if(response.statusCode==200){
        print(response.body);
        final decodeResponse=jsonDecode(response.body);
        final result=ServiceDetailsModel.fromJson(json: decodeResponse);
        return result;
      }else{
        throw ServerErrorException();
      }


    }

  @override
  Future<RegisterLeadModel>registerLead({required LeadFormParams leadFormParams})async {
    final response=await client.post(
        Uri.parse(ListApis.getThisApi(endPoint: ListApis.registerLead)),
        body: leadFormParams.toJsonn(),
    );
    Map<String,dynamic> decodeResponse=jsonDecode(response.body);
    final result=RegisterLeadModel.fromJson(decodeResponse);
    if(response.statusCode==200){
     return result;
     } else{
       throw ServerErrorException();
     }

  }

}
<<<<<<< HEAD


=======
>>>>>>> 230a0cab7852a1b5ee14ebb56c6bad628c9998c7
