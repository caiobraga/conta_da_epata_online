import 'package:conta_da_epata_online/features/contaEpata/presenterContaEpata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:conta_da_epata_online/config.dart';
import 'package:seo_renderer/seo_renderer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyApp();
  // This widget is the root of your application.

}

class _MyApp extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      print('mudanças');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      title: 'Conta da Epata online',
      navigatorObservers: [
        routeObserver,
      ],
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
      home: PresenterContaEpata.presenter(),
    );
  }
}
