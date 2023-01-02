// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

import '../utilis/route.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text('User Name'),
                accountEmail: Text('User Email'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/logo.png'),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                    child: Column(children: [
                      Material(
                        child: InkWell(
                          enableFeedback: true,
                          onTap: () {
                            FlutterFireUIAuth.signOut();
                          },
                          child: Container(
                            color: Colors.amber,
                            height: 40,
                            width: 150,
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Log Out',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 9.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
                  )
                ],
              )),
              
          ListTile(
            leading: Icon(
              size: 30.0,
              Icons.home_outlined,
              color: Colors.black,
            ),
            title: const Text(
              'Home',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            onTap: () {
              Navigator.pushNamed(context, MyRoute.homeroute);
            },
          ),
          ListTile(
            leading: Icon(
              size: 30.0,
              Icons.info_outline_rounded,
              color: Colors.black,
            ),
            title: const Text(
              'About Us',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            onTap: () {
              Navigator.pushNamed(context, MyRoute.underroute);
            },
          ),
          ListTile(
            leading: Icon(
              size: 30.0,
              Icons.mobile_screen_share_rounded,
              color: Colors.black,
            ),
            title: const Text(
              'Share Our App',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            onTap: () {
              Navigator.pushNamed(context, MyRoute.underroute);
            },
          ),
          ListTile(
            leading: Icon(
              size: 30.0,
              Icons.settings_outlined,
              color: Colors.black,
            ),
            title: const Text(
              'User Setting',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => ProfileScreen(
                    actions: [
                      SignedOutAction((context) {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      })
                    ],
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Divider(),
                    ],
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              size: 30.0,
              Icons.list_alt_rounded,
              color: Colors.black,
            ),
            title: const Text(
              'T & C',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            onTap: () {
              Navigator.pushNamed(context, MyRoute.underroute);
            },
          ),
          ListTile(
            leading: Icon(
              size: 30.0,
              Icons.privacy_tip_outlined,
              color: Colors.black,
            ),
            title: const Text(
              'Privacy Policy',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            onTap: () {
              Navigator.pushNamed(context, MyRoute.underroute);
            },
          ),
          ListTile(
            leading: Icon(
              size: 30.0,
              Icons.logout,
              color: Colors.black,
            ),
            title: const Text(
              'Log Out',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            onTap: () {
              FlutterFireUIAuth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
