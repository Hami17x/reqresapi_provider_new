import 'dart:io';

import 'package:dio/dio.dart';
import 'package:reqresapi_provider/reqres/model/resource_model.dart';

abstract class IReqresService {
  final Dio dio;

  IReqresService(this.dio);

  Future<ResourceModel?> fetchItems();
}

class ReqresService extends IReqresService {
  ReqresService(Dio dio) : super(dio);

  @override
  Future<ResourceModel?> fetchItems() async {
    final response = await dio.get("/unknown");

    if (response.statusCode == HttpStatus.ok) {
      final jsonbody = response.data;

      if (jsonbody is Map<String, dynamic>) {
        return ResourceModel.fromJson(jsonbody);
      }
    }
    return null;
  }
}
