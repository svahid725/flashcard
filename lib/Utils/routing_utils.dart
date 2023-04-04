import 'package:get/get.dart';
import 'package:getx_flashcard/Views/AddNewFlashcard/add_new_flashcard_screen.dart';
import 'package:getx_flashcard/Views/Home/home_screen.dart';
import 'package:getx_flashcard/Views/Login/login_screen.dart';
import 'package:getx_flashcard/Views/PersonalScreen/personal_screen.dart';
import 'package:getx_flashcard/Views/Register/register_screen.dart';
import 'package:getx_flashcard/Views/Splash/splash_screen.dart';
import 'package:getx_flashcard/Views/Test/test_screen.dart';

class Routes {
  static const Transition defualtTransition = Transition.fade;
  static GetPage splash = GetPage(
    name: '/',
    page: () => SplashScreen(),
    transition: defualtTransition,
  );

  static GetPage home = GetPage(
    name: '/home',
    page: () => Home(),
    transition: defualtTransition,
  );

  static GetPage login = GetPage(
    name: '/login',
    page: () => LoginScreen(),
    transition: defualtTransition,
  );

  static GetPage addNew = GetPage(
    name: '/add_new_flashcard',
    page: () => AddNewFlashCardScreen(),
    transition: defualtTransition,
  );

  static GetPage personal = GetPage(
    name: '/personal',
    page: () => const PersonalScreen(),
    transition: defualtTransition,
  );
  static GetPage test = GetPage(
    name: '/test',
    page: () => TestScreen(),
    transition: defualtTransition,
  );
  static GetPage register = GetPage(
    name: '/register',
    page: () => RegisterScreen(),
    transition: defualtTransition,
  );
}
