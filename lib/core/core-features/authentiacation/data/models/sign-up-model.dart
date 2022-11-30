
import '../../domain/entities/sign-up-entity.dart';

class SignUpModel extends SignUpEntity{
  const SignUpModel({required bool status,required String message, ModelData? data })
      :super(status: status,message: message,data: data);

  factory SignUpModel.fromJson(Map<String,dynamic>json){
    return SignUpModel(status: json['status'], message: json['message'], data:json['data'] ==null?null: ModelData.fromJson(json['data']!) );
  }

  Map<String,dynamic>toJson(){
    return {
      'status':status,
      'message':message,
      'data':data,
    };
  }
}

class ModelData extends EntityData{
  const ModelData({required int id ,required String name,required String email,required String phone,required String imageUrl,required String token})
  :super(id: id,name: name,email: email,phone: phone,imageUrl: imageUrl,token: token);

  factory ModelData.fromJson(Map<String,dynamic>json){
    return ModelData(id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        imageUrl: json['image'],
        token: json['token']);
  }

  Map<String,dynamic>toJson(){
    return {
      'id':id ,
      'name':name ,
      'email':email ,
      'phone':phone ,
      'imageUrl':imageUrl ,
      'token':token ,
    };
  }
}

