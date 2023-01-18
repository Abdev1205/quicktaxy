import 'package:flutter/material.dart';

import '../utilis/route.dart';
import '../widgets/themes.dart';
import 'auth_gate.dart';
import 'home.dart';
import 'under.dart';
import 'bid.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      // darkTheme: MyTheme.DarkTheme(context),
      themeMode: ThemeMode.system,
      routes: {
        MyRoute.homeroute: (context) => const HomeScreen(),
        MyRoute.underroute: (context) => const Under(),
        MyRoute.bidroute: (context) => const bid(),
      },
      home: const AuthGate(),
    );
  }
}
