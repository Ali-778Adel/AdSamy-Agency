
import 'package:equatable/equatable.dart';

import '../../domain/entities/service_entity.dart';

class ServiceModel extends Equatable {
  final bool? status;
  final String? message;
  final ModelDataTest? dataTest;

  const ServiceModel({this.status, this.message, this.dataTest});

  factory ServiceModel.fromJson({required Map<String, dynamic> json}) {
    return ServiceModel(
        status: json['status'],
        message: json['message'],
        dataTest: json['data'] != null
            ? ModelDataTest.fromJson(json: json['data'])
            : null);
  }
  ServiceEntity toEntity() {
    final se = dataTest!.toEntity();
    return ServiceEntity(status: status, message: message, data: se);
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}



class ModelDataTest extends Equatable {
  final List<ModelCats> modelCats;
  final String imagesBaseUrl;
  const ModelDataTest({required this.modelCats, required this.imagesBaseUrl});

  factory ModelDataTest.fromJson({required Map<String, dynamic> json}) {
    final dataTemp = json['categories'] as List<dynamic>;
    final list = dataTemp.map((e) => ModelCats.fromJson(json: e)).toList();
    return ModelDataTest(modelCats: list, imagesBaseUrl: json['images_url']);
  }

  EntityData toEntity() {
    List<EntityCategories> catsList = modelCats.map<EntityCategories>((e) {
      return EntityCategories(
          catId: e.catId,
          catName: e.catName,
          catType: e.catType,
          catImage: e.catImage);
    }).toList();
    return EntityData(
      categories: catsList,
      imageBaseUrl: imagesBaseUrl,
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}

class ModelCats {
  final int? catId;
  final String? catName;
  final String? catType;
  final String? catImage;
  ModelCats({this.catId, this.catName, this.catType, this.catImage});

  factory ModelCats.fromJson({required Map<String, dynamic> json}) {
    return ModelCats(
        catId: json['category_id'],
        catName: json['category_name'],
        catType: json['category_type'],
        catImage: json['main_image']);
  }
}
