import 'package:json_annotation/json_annotation.dart';

part 'resource_model.g.dart';

@JsonSerializable(createToJson: false)
class ResourceModel {
  List<Data>? data;

  ResourceModel({this.data});

  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return _$ResourceModelFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Data {
  int? id;
  String? name;
  int? year;
  String? color;
  String? pantoneValue;

  Data({this.id, this.name, this.year, this.color, this.pantoneValue});

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }
}
