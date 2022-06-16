import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reqresapi_provider/extension/string_extension.dart';
import 'package:reqresapi_provider/product/extension/project_dio.dart';
import 'package:reqresapi_provider/product/theme/theme_notifier.dart';
import 'package:reqresapi_provider/reqres/service/reqres_service.dart';
import 'package:reqresapi_provider/reqres/viewmodel/reqres_provider.dart';

import '../model/resource_model.dart';

class ReqresView extends StatefulWidget {
  const ReqresView({Key? key}) : super(key: key);

  @override
  State<ReqresView> createState() => _ReqresViewState();
}

class _ReqresViewState extends State<ReqresView> with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReqresProvider(ReqresService(service)),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: context.watch<ReqresProvider>().isLoading
                ? const Text("loading..")
                : const Text("loaded"),
          ),
          body: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<ThemeProvider>().changeTheme();
                  },
                  child: const Text("change theme")),
              Expanded(
                  child: _listView(
                      context, context.watch<ReqresProvider>().resources)),
            ],
          ),
        );
      },
    );
  }

  ListView _listView(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          color: Color(items[index].color?.colorValue ?? 0),
          child: ListTile(
            subtitle: Text(items[index].pantoneValue ?? ""),
            title:
                Text(items[index].name! + "  " + items[index].year.toString()),
          ),
        );
      },
    );
  }
}
