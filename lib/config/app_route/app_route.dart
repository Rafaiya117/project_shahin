import 'package:go_router/go_router.dart';
import 'package:project_shahin/features/achivement/view/achivement_view.dart';
import 'package:project_shahin/features/auth/forgot_password/view/forgot_passowrd.dart';
import 'package:project_shahin/features/auth/login/view/loginpage.dart';
import 'package:project_shahin/features/auth/otp/view/otp.dart';
import 'package:project_shahin/features/auth/reset_password/view/reset_passowrd.dart';
import 'package:project_shahin/features/auth/sign_up/view/sign_up.dart';
import 'package:project_shahin/features/auth/signin_signup.dart';
import 'package:project_shahin/features/category/view/select_category.dart';
import 'package:project_shahin/features/collection/view/my_collection.dart';
import 'package:project_shahin/features/expolre_topics/view/explore_topics.dart';
import 'package:project_shahin/features/favourite/view/favourite_collection.dart';
import 'package:project_shahin/features/history/history.dart';
import 'package:project_shahin/features/home/view/home_view.dart';
import 'package:project_shahin/features/landing_pages/view/first_landingpage.dart';
import 'package:project_shahin/features/landing_pages/view/second_landing_page.dart';
import 'package:project_shahin/features/landing_pages/view/third_landing_page.dart';
import 'package:project_shahin/features/notifiaction/notification.dart';
import 'package:project_shahin/features/notification_settings/view/notification_settings.dart';
import 'package:project_shahin/features/profile/view/edit_password.dart';
import 'package:project_shahin/features/profile/view/edit_profile.dart';
import 'package:project_shahin/features/profile/view/profile_menu.dart';
import 'package:project_shahin/features/settings/help_and_support/help_support.dart';
import 'package:project_shahin/features/settings/priavacy_policy/privacy_policy.dart';
import 'package:project_shahin/features/settings/settings.dart';
import 'package:project_shahin/features/settings/terms_and_condition/term_&_condition.dart';
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
    GoRoute(
      path: '/signin-signup_option',
      builder: (context, state) => SigninSignup(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => Loginpage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignUp(),
    ),
    GoRoute(
      path: '/forgot_password',
      builder: (context, state) => ForgotPassowrd(),
    ),
    GoRoute(
      path: '/otp_page',
      builder: (context, state) => Otppage(),
    ),
    GoRoute(
      path: '/reset_password',
      builder: (context, state) => ResetPassowrd(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => ProfileMenu(),
    ),
    GoRoute(
      path: '/edit_profile',
      builder: (context, state) => EditProfile(),
    ),
    GoRoute(
      path: '/edit_password',
      builder: (context, state) => EditPassword(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => Settings(),
    ),
    GoRoute(
      path: '/terms',
      builder: (context, state) => Term_and_Condition(),
    ),
    GoRoute(
      path: '/privacy',
      builder: (context, state) => PrivacyPolicy(),
    ),
    GoRoute(
      path: '/help_support',
      builder: (context, state) => HelpSupport(),
    ),
    GoRoute(
      path: '/general_notification',
      builder: (context, state) => NotificationSettings(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => Home(),
    ),
    GoRoute(
      path: '/expolre_topics',
      builder: (context, state) => ExploreTopics(),
    ),
    GoRoute(
      path: '/favorite',
      builder: (context, state) => FavouriteCollection(),
    ),
    GoRoute(
      path: '/my_collection',
      builder: (context, state) => MyCollection(),
    ),
    GoRoute(
      path: '/notification',
      builder: (context, state) => Notification(),
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => History(),
    ),
    GoRoute(
      path: '/achivment',
      builder: (context, state) => AchivementView(),
    ),
  ],
);

   

    
       
