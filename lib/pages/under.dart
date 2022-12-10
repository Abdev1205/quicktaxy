import 'package:flutter/material.dart';

import '../utilis/route.dart';

class Under extends StatelessWidget {
  const Under({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 120,
          ),
          Image.asset(
            'assets/under.jpg',
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  MyRoute.homeroute,
                );
              },
              
              child: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 20,
                ),
              ))
          
        ],
      ),
    );
  }
}
