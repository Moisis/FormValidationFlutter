
import 'package:flutter/material.dart';
import 'package:lab5/register_screen.dart';


void main() async {


  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  const MyApp({super.key});
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hedieaty',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      initialRoute:  '/register',


      routes: {
        // Auth Screen
        '/register': (context) =>  RegisterScreen(),
      },
    );
  }
}


