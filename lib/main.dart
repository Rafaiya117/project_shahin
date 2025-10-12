import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_shahin/config/app_route/app_route.dart';
import 'package:project_shahin/config/connectivity/no_connectivity.dart';
import 'package:project_shahin/features/achivement/controller/achivement_controller.dart';
import 'package:project_shahin/features/alpha_circle/controller/controller.dart';
import 'package:project_shahin/features/auth/forgot_password/controller/fortgotpass_controller.dart';
import 'package:project_shahin/features/auth/login/controller/login_controller.dart';
import 'package:project_shahin/features/auth/otp/controller/otp_controller.dart';
import 'package:project_shahin/features/auth/reset_password/controller/reset_passowerd_controller.dart';
import 'package:project_shahin/features/auth/sign_up/controller/signup_controller.dart';
import 'package:project_shahin/features/category/controller/category_controller.dart';
import 'package:project_shahin/features/collection/controller/collection_controller.dart';
import 'package:project_shahin/features/favourite/controller/favourite_controller.dart';
import 'package:project_shahin/features/history/contoller/history_controller.dart';
import 'package:project_shahin/features/home/controller/home_controller.dart';
import 'package:project_shahin/features/search/controller/search_controller.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
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
            ChangeNotifierProvider<CategoryController>(create: (_) => CategoryController()),
            ChangeNotifierProvider<SuggestionController>(create: (_) => SuggestionController()),
            ChangeNotifierProvider<FavouriteController>(create: (_) => FavouriteController()),
            ChangeNotifierProvider<QuoteController>(create: (_) => QuoteController()),
            ChangeNotifierProvider<History_Controller>(create: (_) => History_Controller()),
            ChangeNotifierProvider<AlphaCircleController>(create: (_) => AlphaCircleController()),
            ChangeNotifierProvider<AchivementController>(create: (_) => AchivementController()),
            ChangeNotifierProvider<LoginController>(create: (_) => LoginController()),
            ChangeNotifierProvider<SignupController>(create: (_) => SignupController()),
            ChangeNotifierProvider<FortgotpassController>(create: (_) => FortgotpassController()),
            ChangeNotifierProvider<ResetPassowerdController>(create: (_) => ResetPassowerdController()),
            ChangeNotifierProvider<OtpController>(create: (_) => OtpController()),
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

