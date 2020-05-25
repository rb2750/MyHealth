import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'pages/home/home.dart';

class MyHealthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(133, 205, 202, 0.1),
      100: Color.fromRGBO(133, 205, 202, 0.2),
      200: Color.fromRGBO(133, 205, 202, 0.3),
      300: Color.fromRGBO(133, 205, 202, 0.4),
      400: Color.fromRGBO(133, 205, 202, 0.5),
      500: Color.fromRGBO(133, 205, 202, 0.6),
      600: Color.fromRGBO(133, 205, 202, 0.7),
      700: Color.fromRGBO(133, 205, 202, 0.8),
      800: Color.fromRGBO(133, 205, 202, 0.9),
      900: Color.fromRGBO(133, 205, 202, 1)
    };
    
    return MaterialApp(
      title: 'MyHealth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: MaterialColor(0xFF85cdca, color)),
      home: HomePage(title: 'MyHealth'),
    );
  }
}