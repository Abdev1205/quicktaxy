import 'package:complete/pages/postBid/card.dart';
import 'package:flutter/material.dart';

import '../utilis/route.dart';
import '../widgets/themes.dart';
import 'AllBid/allbid.dart';
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
          MyRoute.allBidPage:(context) => const AllBidPage(),
          // MyRoute.bidingPageRoute: (context) => const PostBidPage(
          //        destination: '' ,
          //       shared: 'dfd',
          //       time: 'sds',
          //       passengerId: 'sdsds',
          //     )
        },
        onGenerateRoute: (settings) {
          // If you push the PassArguments route
          if (settings.name == MyRoute.bidingPageRoute) {
            // Cast the arguments to the correct
            // type: ScreenArguments.
            final args = settings.arguments as UserData;

            // Then, extract the required data from
            // the arguments and pass the data to the
            // correct screen.
            return MaterialPageRoute<PostBidPage>(
              builder: (context) {
                return PostBidPage(
                  destination: args.destination,
                  shared: args.shared,
                  passengerId: args.passengerID,
                  time: args.time,
                  phoneNo:args.phoneNo,
                );
              },
            );
          }
          // home:
          assert(false, 'Need to implement ${settings.name}');
          return null;
        },
        home: const AuthGate(),);
          
  }
}
