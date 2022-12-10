import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import '../widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Quick Taxy",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.black,
              
              size: 30.0,
              ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => ProfileScreen(
                    appBar: AppBar(
                      title: const Text('User Profile'),
                    ),
                    actions: [
                      SignedOutAction((context) {
                        Navigator.popUntil(context,(route) =>route.isFirst); 
                      })
                    ],
                    children: [
                      const Divider(),
                      
                    ],
                  ),
                ),
              );
            },
          ),
        ],
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/under.jpg'),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: const Center(
                child: Text(
                  'We will make soon as possible',
                  style: TextStyle(color: Colors.black,fontSize: 20)
                ),
              ),
            ),
            const SignOutButton(),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    
    );
  }
}
