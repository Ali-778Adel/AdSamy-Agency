
import 'package:ad_samy/features/profile/domain/entities/user-cache-entity.dart';



class UserCacheModel extends UserCacheEntity{
  const  UserCacheModel( { bool ?success ,  String? message , UserCacheModelData? user})
      :super(success:success,message: message,user: user);

  factory UserCacheModel.fromJson(Map<String,dynamic>json){
    return UserCacheModel(
        success: json['success'],
        message: json['message'] ?? 'no message',
        user: json['user']!= null ? UserCacheModelData.fromJson(json['user']):null
    );
  }

  Map<String,dynamic>toJson(){
    return{'success':success,'message':message,'user':user};
  }
}

class  UserCacheModelData extends UserCacheEntityData {

  const UserCacheModelData({ int ?id ,int?clientId, String ?email, String ?name,String ?type, String ?phone, String ?token})
      :super(id:id,clientId:clientId,email:email,name:name,phone:phone,type: type,token:token);

  factory UserCacheModelData.fromJson(Map<String,dynamic>json){
    return UserCacheModelData(
        id: json['id'],
        clientId: json['clientid'],
        name: json['first_name'],
        email: json['email'],
        phone: json['phone'],
        type: json['type'],
        token: json['token']);
  }

  Map<String,dynamic>toJson(){
    return {
      'id':id ,
      'clientid':clientId,
      'first_name':name ,
      'email':email ,
      'phone':phone ,
      'type':type,
      'token':token ,
    };
  }

}