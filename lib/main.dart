import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:nav_router/nav_router.dart';
import 'package:sanninstore/core/network/dio_service.dart';
import 'package:sanninstore/core/util/core_function.dart';
import 'package:sanninstore/core/util/size_config.dart';

import 'presentations/home/view/home_view.dart';

Future<void> main() async {
  await init();
  runApp(const MyApp());
}

init() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await DioService.setupDio();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    _setupLogging();
    super.initState();
  }

  void _setupLogging() async {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((rec) {
      CoreFunction.logPrint("", '${rec.level.name}: ${rec.time}; ${rec.message}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sannin Store',
      navigatorKey: navGK,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}