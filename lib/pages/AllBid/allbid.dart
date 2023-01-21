import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

import '../../widgets/drawer.dart';
import 'mybidcard.dart';

class AllBidPage extends StatefulWidget {
  const AllBidPage({Key? key}) : super(key: key);
  @override
  State<AllBidPage> createState() => _AllBidPageState();
}

class _AllBidPageState extends State<AllBidPage> {
  final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance
      .collection('bids')
      .where('driverId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

  /// Check If Document Exists
  Future<bool> checkIfDocExists(
      {required String collection, required String docId}) async {
    // Get reference to Firestore collection
    var collectionRef = FirebaseFirestore.instance.collection(collection);

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  }

  Widget widget1 = const Center(
      child: LoadingIndicator(
    size: 100,
    borderWidth: 5,
  ));

  @override
  Widget build(BuildContext context) {
    Future<bool> docExists = checkIfDocExists(
        collection: 'bids', docId: FirebaseAuth.instance.currentUser!.uid);
    docExists.then(
      (exists) {
        setState(() {
          if (exists) {
            widget1 = StreamBuilder<QuerySnapshot>(
              stream: _userStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  children: snapshot.data!.docs
                      .map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return MyBidCard(
                          destination: data['destination'].toString(),
                          passengerID: data['passengerID'].toString(),
                          shared: data['shared'].toString(),
                          time: data['time'].toString(),
                          price: data['price'].toString(),
                        );
                      })
                      .toList()
                      .cast(),
                );
              },
            );
          } else {
            widget1 = const Center(
              child: Text(
                'No Bid Yet',
                style: TextStyle(color: Colors.redAccent),
              ),
            );
          }
        });
      },
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Your Bids'),
      ),
      body: widget1,
      drawer: const MyDrawer(),
    );
  }
}
