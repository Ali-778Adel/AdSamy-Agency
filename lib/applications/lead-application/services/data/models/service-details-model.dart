// ignore_for_file: file_names

import '../../domain/entities/service-details-entity.dart';

class ServiceDetailsModel extends ServiceDetailsEntity {
  const ServiceDetailsModel(
      {bool? status,
      String? message,
      ServiceMainDataModel? serviceMainDataModel})
      : super(
            status: status,
            message: message,
            serviceMainDataEntity: serviceMainDataModel);

  factory ServiceDetailsModel.fromJson({required Map<String, dynamic> json}) {
    return ServiceDetailsModel(
      status: json['status'],
      message: json['message'],
      serviceMainDataModel: json['data'] != null
          ? ServiceMainDataModel.fromJson(json: json['data'])
          : null,
    );
  }
}

class ServiceMainDataModel extends ServiceMainDataEntity {
  const ServiceMainDataModel({String? imageUrl, ModelData? modelData})
      : super(imageUrl: imageUrl, serviceDetailsEntityData: modelData);
  factory ServiceMainDataModel.fromJson({required Map<String, dynamic> json}) {
    return ServiceMainDataModel(
      imageUrl: json['images_url'],
      modelData: json['category'] != null
          ? ModelData.fromJson(json: json['category'])
          : null,
    );
  }
}

class ModelData extends ServiceDetailsEntityData {
   ModelData(
      {int? categoryId,
      dynamic categoryCreated,
      dynamic categoryUpdated,
      dynamic categoryCreatorid,
      String? categoryName,
      dynamic categoryDescription,
      String? categorySystemDefault,
      String? categoryVisibility,
      String? categoryIcon,
      String? categoryType,
      String? categorySlug,
      String?mainImage,
      String?subImage1,
      String?subImage2,
      int?serviceDiscount,

      })
      : super(
            categoryId: categoryId,
            categoryCreated: categoryCreated,
            categoryUpdated: categoryUpdated,
            categoryCreatorid: categoryCreatorid,
            categoryName: categoryName,
            categoryDescription: categoryDescription,
            categorySystemDefault: categorySystemDefault,
            categoryVisibility: categoryVisibility,
            categoryIcon: categoryIcon,
            categoryType: categoryType,
            categorySlug: categorySlug,
            mainImage: mainImage,
            subImage1: subImage1,
            subImage2: subImage2,
            serviceDiscount:serviceDiscount

  );

  factory ModelData.fromJson({required Map<String, dynamic> json}) {
    return ModelData(
      categoryId: json['category_id'],
      categoryCreated: json['category_created'],
      categoryUpdated: json['category_updated'],
      categoryCreatorid: json['category_creatorid'],
      categoryName: json['category_name'],
      categoryDescription: json['category_description'],
      categorySystemDefault: json['category_system_default'],
      categoryVisibility: json['category_visibility'],
      categoryIcon: json['category_icon'],
      categoryType: json['category_type'],
      categorySlug: json['category_slug'],
      mainImage: json['main_image'],
      subImage1: json['sup_image'],
      subImage2: json['sup_image2'],
      serviceDiscount: json['discount']
    );
  }
}
