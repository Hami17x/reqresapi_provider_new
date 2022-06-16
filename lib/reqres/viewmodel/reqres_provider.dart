import 'package:flutter/cupertino.dart';
import 'package:reqresapi_provider/reqres/service/reqres_service.dart';

import '../model/resource_model.dart';

class ReqresProvider extends ChangeNotifier {
  final IReqresService reqresService;
  List<Data> resources = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  ReqresProvider(this.reqresService) {
    _fetch();
  }

  Future<void> _fetch() async {
    _changeLoading();
    resources = (await reqresService.fetchItems())?.data ?? [];
    _changeLoading();
  }
}
