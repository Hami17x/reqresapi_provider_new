import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reqresapi_provider/product/theme/theme_notifier.dart';
import 'package:reqresapi_provider/reqres/view/reqres_view.dart';

void main() {
  runApp(MultiProvider(builder: (context, child) => const MyApp(), providers: [
    ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
    ),
  ]));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: context.watch<ThemeProvider>().currentTheme,
      home: const ReqresView(),
    );
  }
}
