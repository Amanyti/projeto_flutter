import 'package:flutter/material.dart';
import 'package:projeto_flutter/pages/splash_screen_page.dart'; //IMPORTE DA PAGE

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Flutter',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}