import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_ui/screens/home_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
  statusBarColor: Colors.grey[100],
  statusBarIconBrightness: Brightness.dark
  ));

  //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: HomeScreen(),
    );
  }
}