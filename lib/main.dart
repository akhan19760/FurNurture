import 'package:flutter/material.dart';
import 'package:furniture_store/constants.dart';
import 'package:furniture_store/provider/user_provider.dart';
import 'package:furniture_store/view/bottom_navbar.dart';
import 'package:furniture_store/view/home_screen.dart';
import 'package:furniture_store/view/landing_screen.dart';
import 'package:furniture_store/view/login_screen.dart';
import 'package:furniture_store/view/product_screen.dart';
import 'package:furniture_store/view/shopping_cart.dart';
import 'package:furniture_store/view/signup_screen.dart';
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
      home: BottomNavbar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
