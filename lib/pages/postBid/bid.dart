import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class PostBidPage extends StatefulWidget {
  final String destination, passengerId, shared, time;

  const PostBidPage({
    super.key,
    required this.destination,
    required this.passengerId,
    required this.shared,
    required this.time,
  });

  @override
  State<PostBidPage> createState() => _PostBidPageState();
}

// class PostData {
//   final String time;
//   final String shared;
//   final String destination;
//   final String passengerID;

//   PostData(this.time, this.shared, this.destination, this.passengerID);
// }

class _PostBidPageState extends State<PostBidPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Quick Taxy',
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
                        Navigator.popUntil(context, (route) => route.isFirst);
                      })
                    ],
                    children: const [
                      Divider(),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // Text(widget.destination),
          // Text(widget.shared),
          // Text(widget.time),
          // Text(widget.passengerId),
          ElevatedButton(onPressed: () async {
                      await FirebaseFirestore.instance.collection('bids')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .set(<String, dynamic>{
                        'driverId': FirebaseAuth.instance.currentUser!.uid,
                        'passengerId':widget.passengerId,
                        'price': 500,

                      }).then((value) => print('bid added'));
                      
                    }, child: Text('Bid'))

        ]),
      ),
    );
  }
}
