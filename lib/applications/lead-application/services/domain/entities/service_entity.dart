import 'package:equatable/equatable.dart';

class ServiceEntity extends Equatable{
  final bool ?status;
  final String? message;
  final EntityData? data;
  const ServiceEntity( {this.message,this.status,this.data});

  @override
  List<Object?> get props => [status,message,data];

}
class EntityData extends Equatable{
  final List<EntityCategories>?categories;
  final String imageBaseUrl;

  const EntityData({this.categories,required this.imageBaseUrl});

  @override
  List<Object?> get props =>[categories,imageBaseUrl];


}

class EntityCategories extends Equatable{
  final int ?catId ;
  final String? catName;
  final String?catType;
  final String ?catImage;

  const EntityCategories({
    this.catId,
    this.catName,
    this.catType,
    this.catImage
  });

  @override
  List<Object?> get props => [
    catId,
    catName,
    catType,
    catImage
  ];

}