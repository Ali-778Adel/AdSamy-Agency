
import '../../domain/entities/login-entity.dart';


class LoginModel extends LoginEntity{
const  LoginModel( { bool ?success ,  String? message , LoginUserData? user})
      :super(success:success,message: message,user: user);

factory LoginModel.fromJson(Map<String,dynamic>json){
  return LoginModel(
      success: json['success'],
      message: json['message'] ?? 'no message',
      user: json['user']!= null ? LoginUserData.fromJson(json['user']):null
  );
}

  Map<String,dynamic>toJson(){
  return{'success':success,'message':message,'user':user};
  }
}

class  LoginUserData extends LoginUserEntity {

  const LoginUserData({ int ?id ,int?clientId, String ?email, String ?name,String ?type, String ?phone, String ?token})
  :super(id:id,clientId:clientId,email:email,name:name,phone:phone,type: type,token:token);

 factory LoginUserData.fromJson(Map<String,dynamic>json){
   return LoginUserData(
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