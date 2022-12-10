import 'under.dart';
import 'package:flutter/material.dart';

import '../utilis/route.dart';
import 'auth_gate.dart';
import 'home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        brightness: Brightness.light,
        /* light theme settings */
      ),
      
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      //   /* dark theme settings */
      // ),
      themeMode: ThemeMode.system, 
      /* ThemeMode.system to follow system theme, 
         ThemeMode.light for light theme, 
         ThemeMode.dark for dark theme
      */
      routes: {
        MyRoute.homeroute: (context) => HomeScreen(),
        
        MyRoute.underroute: (context) => Under(),
      },
      home: const AuthGate(),
    );
  }
}
