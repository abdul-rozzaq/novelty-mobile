import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:novelty/screens/auth/primary_screen.dart';
import 'package:novelty/screens/consumer/home_screen.dart';
import 'package:novelty/services/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, // optional
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      themeMode: ThemeMode.light,
      home: const PrimaryScreen(),
      // home: const HomeScreen(),
    );
  }
}
