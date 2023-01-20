import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'card.dart';

class post extends StatefulWidget {
  const post({Key? key}) : super(key: key);
  @override
  State<post> createState() => _postState();
}

class _postState extends State<post> {
  final Stream<QuerySnapshot> _userStream =
      FirebaseFirestore.instance.collection('post').snapshots();

  Widget widget1 = const Center(
      child: LoadingIndicator(
    size: 100,
    borderWidth: 5,
  ));

  @override
  Widget build(BuildContext context) {
    widget1 = StreamBuilder<QuerySnapshot>(
      stream: _userStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong !');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: LoadingIndicator(
            size: 100,
            borderWidth: 5,
          ));
        }

        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          children: snapshot.data!.docs
              .map((document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return MyCard(
                  destination: data['destination'].toString(),
                  passengerID: data['passengerID'].toString(),
                  shared: data['shared'].toString(),
                  time: data['time'].toString(),
                );
              })
              .toList()
              .cast(),
        );
      },
    );
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text(
      //     'Quick Taxy',
      //     style: TextStyle(color: Colors.black, fontSize: 20),
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(
      //         Icons.person,
      //         color: Colors.black,
      //         size: 30.0,
      //       ),
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute<ProfileScreen>(
      //             builder: (context) => ProfileScreen(
      //               appBar: AppBar(
      //                 title: const Text('User Profile'),
      //               ),
      //               actions: [
      //                 SignedOutAction((context) {
      //                   Navigator.popUntil(context, (route) => route.isFirst);
      //                 })
      //               ],
      //               children: const [
      //                 Divider(),
      //               ],
      //             ),
      //           ),
      //         );
      //       },
      //     ),
      //   ],
      //   automaticallyImplyLeading: true,
      // ),
      body: widget1,
    );
  }
}
