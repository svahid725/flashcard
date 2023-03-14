import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_flashcard/Models/Home/translate.dart';
import 'package:getx_flashcard/Utils/routing_utils.dart';
import 'package:getx_flashcard/Views/Splash/splash_screen.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light),
  );
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        appBarTheme: const AppBarTheme(color: Colors.black),
      ),
      debugShowCheckedModeBanner: false,
      getPages: [
        Routes.splash,
        Routes.home,
        Routes.personal,
        Routes.addNew,
        Routes.sign
      ],
      translations: Translate(),
      initialRoute: Routes.splash.name,
      home: SplashScreen(),
    ),
  );
}
