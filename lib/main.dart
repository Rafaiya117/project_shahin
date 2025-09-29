import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_shahin/config/app_route/app_route.dart';
import 'package:project_shahin/config/connectivity/no_connectivity.dart';
import 'package:project_shahin/features/home/controller/home_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool hasConnection = true;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
    Connectivity().onConnectivityChanged.listen((status) {
      setState(() {
        hasConnection = status != ConnectivityResult.none;
      });
    });
  }

  Future<void> _checkConnectivity() async {
    final status = await Connectivity().checkConnectivity();
    setState(() {
      hasConnection = status != ConnectivityResult.none;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<HomeController>(create: (_) => HomeController()),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            routerConfig: appRouter,
            builder: (context, child) {
              return hasConnection ? child! : const NoInternetWidget();
            },
          ),
        );
      },
    );
  }
}

