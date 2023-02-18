import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/provider/user_provider.dart';
import 'package:furniture_app/view/bottom_navbar.dart';
import 'package:furniture_app/view/home_screen.dart';
import 'package:furniture_app/view/landing_screen.dart';
import 'package:furniture_app/view/login_screen.dart';
import 'package:furniture_app/view/product_screen.dart';
import 'package:furniture_app/view/shopping_cart.dart';
import 'package:furniture_app/view/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FurNurture',
      home: ShoppingCart(),
      debugShowCheckedModeBanner: false,
    );
  }
}
