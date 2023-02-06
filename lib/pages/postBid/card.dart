import 'package:flutter/material.dart';

import '../../utilis/route.dart';
import 'bid.dart';

class MyCard extends StatefulWidget {
  final String destination, passengerID, shared, time, phoneNo, photoURL;

  const MyCard({
    super.key,
    required this.destination,
    required this.passengerID,
    required this.shared,
    required this.time,
    required this.phoneNo,
    required this.photoURL,
  });

  @override
  State<MyCard> createState() => _MyCardState();
}

class UserData {
  final String time;
  final String shared;
  final String destination;
  final String passengerID;
  final String phoneNo;
  final String photoURL;

  UserData(this.time, this.shared, this.destination, this.passengerID,
      this.phoneNo, this.photoURL);
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        elevation: 80,
        color: Colors.black,
        child: SizedBox(
          width: 300,
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
                        backgroundImage: NetworkImage(widget.photoURL),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.amber,
                                onPrimary: Colors.white,
                                shadowColor: Colors.greenAccent,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0)),
                                minimumSize: const Size(150, 40), //////// HERE
                              ),
                              onPressed: () {
                                String time = widget.time.toString();
                                String shared = widget.shared.toString();
                                String destination =
                                    widget.destination.toString();
                                String passengerId =
                                    widget.passengerID.toString();
                                String phoneNo = widget.phoneNo.toString();
                                String photoURL = widget.photoURL.toString();
                                Navigator.pushNamed(
                                    context, MyRoute.bidingPageRoute,
                                    arguments: UserData(
                                      time,
                                      shared,
                                      destination,
                                      passengerId,
                                      phoneNo,
                                      photoURL,
                                    ));
                                // return PostBidPage(
                                //   destination: widget.destination,
                                //   passengerID: widget.passengerID,
                                //   time: widget.time,
                                //   shared: widget.shared,
                                // );
                              },
                              // ignore: prefer_const_constructors
                              child: Text(
                                'Post your Bid',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                          )
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
    );
  }
}
