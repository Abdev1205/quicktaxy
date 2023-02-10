import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

import '../../utilis/route.dart';

class PostBidPage extends StatefulWidget {
  final String destination, passengerId, shared, time, phoneNo;

  const PostBidPage({
    super.key,
    required this.destination,
    required this.passengerId,
    required this.shared,
    required this.time,
    required this.phoneNo,
  });

  @override
  State<PostBidPage> createState() => _PostBidPageState();
}

TextEditingController priceController = TextEditingController();
final _formKey = GlobalKey<FormState>();
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
            icon: const Icon(
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
        child: Form(
          key: _formKey,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Card(
                elevation: 80,
                color: Colors.black,
                child: SizedBox(
                  width: 500,
                  height: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              // ignore: prefer_const_constructors
                              CircleAvatar(
                                radius: 70,
                                backgroundImage: const NetworkImage(
                                    'https://thumbs.dreamstime.com/b/portrait-young-smiling-woman-black-dress-white-background-i-fashion-model-isolated-isolated-34626081.jpg'),
                              ),
                              SizedBox(
                                child: Column(children: [
                                  Text(
                                    widget.destination,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Text(
                                    widget.shared,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Text(
                                    widget.time,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ]),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Your Bid Price',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Your Bid Price';
                  }
                  return null;
                },
              ),
            ),
            // Text(widget.destination),
            // Text(widget.shared),
            // Text(widget.time),
            // Text(widget.passengerId),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  int price = int.parse(priceController.text);
                  await FirebaseFirestore.instance
                      .collection('bids')
                      .add(<String, dynamic>{
                        'driverId': FirebaseAuth.instance.currentUser!.uid,
                        'driverPhoto':
                            FirebaseAuth.instance.currentUser!.photoURL,
                        'driverName':
                            FirebaseAuth.instance.currentUser!.displayName,
                        'driverPhone':
                            FirebaseAuth.instance.currentUser!.phoneNumber,
                        'passengerId': widget.passengerId,
                        'price': price,
                        'destination': widget.destination,
                        'shared': widget.shared,
                        'time': widget.time,
                        'accepted': false,
                      })
                      .then((value) => print('bid added'))
                      .then((value) => Navigator.popAndPushNamed(
                          context, MyRoute.allBidPage))
                      .then((value) => print(
                          FirebaseAuth.instance.currentUser!.phoneNumber));

                  // Navigator.pushNamed(context, MyRoute.allBidPage);
                }
              },
              // ignore: sort_child_properties_last
              child: const Text(
                'Bid',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: const Size(250, 40),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
