// ignore_for_file: file_names
import 'package:ad_samy/features/services/domain/entities/service-details-entity.dart';

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
          ? ServiceMainDataModel.fromJson(json: json['category'])
          : null,
    );
  }
}

class ServiceMainDataModel extends ServiceMainDataEntity {
  const ServiceMainDataModel({String? imageUrl, ModelData? modelData})
      : super(imageUrl: imageUrl, serviceDetailsEntityData: modelData);
  factory ServiceMainDataModel.fromJson({required Map<String, dynamic> json}) {
    return ServiceMainDataModel(
      imageUrl: json['image_url'],
      modelData: json['category'] != null
          ? ModelData.fromJson(json: json['category'])
          : null,
    );
  }
}

class ModelData extends ServiceDetailsEntityData {
  const ModelData(
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
      String? categorySlug})
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
            categorySlug: categorySlug);

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
    );
  }
}
