import 'package:go_router/go_router.dart';
import 'package:project_shahin/features/category/view/select_category.dart';
import 'package:project_shahin/features/landing_pages/view/first_landingpage.dart';
import 'package:project_shahin/features/landing_pages/view/second_landing_page.dart';
import 'package:project_shahin/features/landing_pages/view/third_landing_page.dart';
import 'package:project_shahin/features/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/first_landingpage',
      builder: (context, state) => FirstLandingpage(),
    ),
    GoRoute(
      path: '/second_landingpage',
      builder: (context, state) => SecondLandingPage(),
    ),
    GoRoute(
      path: '/third_landingpage',
      builder: (context, state) => ThirdLandingPage(),
    ),
    GoRoute(
      path: '/select_category_page',
      builder: (context, state) => SelectCategory(),
    ),
  ],
);

   

    
       
