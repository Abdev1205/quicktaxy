import 'package:flutter/material.dart';

import '../utilis/route.dart';
import '../widgets/themes.dart';
import 'auth_gate.dart';
import 'home.dart';
import 'postBid/bid.dart';
import 'under.dart';
import 'bid.dart';
import './postBid/post.dart';

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
        MyRoute.bidroute: (context) => const post(),
        MyRoute.bidingPageRoute:(context) => const PostBidPage(destination: 'dsfdf',shared: 'dfd',time: 'sds',passengerID: 'sdsds',)
        
      },
      // onGenerateRoute: (settings) {
      //   // If you push the PassArguments route
      //   if (settings.name == PassArgumentsScreen.routeName) {
      //     // Cast the arguments to the correct
      //     // type: ScreenArguments.
      //     final args = settings.arguments as ScreenArguments;

      //     // Then, extract the required data from
      //     // the arguments and pass the data to the
      //     // correct screen.
      //     return MaterialPageRoute(
      //       builder: (context) {
      home: const AuthGate(),
    );
  }
}
