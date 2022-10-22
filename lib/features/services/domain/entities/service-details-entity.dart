import 'package:equatable/equatable.dart';

class ServiceDetailsEntity extends Equatable{
  final bool? status;
  final String? message;
  final ServiceMainDataEntity ?serviceMainDataEntity;
const ServiceDetailsEntity({this.serviceMainDataEntity,this.message,this.status});
  @override

  List<Object?> get props => [status,message,serviceMainDataEntity];

}
class ServiceMainDataEntity extends Equatable{
  final String?imageUrl;
  final ServiceDetailsEntityData?serviceDetailsEntityData;
 const ServiceMainDataEntity({this.imageUrl,this.serviceDetailsEntityData});

  @override
  List<Object?> get props => [imageUrl,serviceDetailsEntityData];
}

class ServiceDetailsEntityData extends Equatable{
 final int? categoryId;
 final dynamic categoryCreated;
 final dynamic categoryUpdated;
 final dynamic categoryCreatorid;
 final String? categoryName;
 final dynamic categoryDescription;
 final String? categorySystemDefault;
 final String? categoryVisibility;
 final String ?categoryIcon;
 final String ?categoryType;
 final String ?categorySlug;
 final String?mainImage;
 final String?subImage1;
 final String?subImage2;
 final int?serviceDiscount;

const ServiceDetailsEntityData(
      {
        this.categoryId,
        this.categoryCreated,
        this.categoryUpdated,
        this.categoryCreatorid,
        this.categoryName,
        this.categoryDescription,
        this.categorySystemDefault,
        this.categoryVisibility,
        this.categoryIcon,
        this.categoryType,
        this.categorySlug,
        this.mainImage,
        this.subImage1,
        this.subImage2,
        this.serviceDiscount,
      });

  @override
  List<Object?> get props => [
    categoryId,
    categoryCreated,
    categoryUpdated,
    categoryCreatorid,
    categoryName,
    categoryDescription,
    categorySystemDefault,
    categoryVisibility,
    categoryIcon,
    categoryType,
    categorySlug,
    mainImage,
    subImage1,
    subImage2,
    serviceDiscount,
  ];
}
