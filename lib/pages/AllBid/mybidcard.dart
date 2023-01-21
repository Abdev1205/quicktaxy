import 'package:flutter/material.dart';

import '../../utilis/route.dart';
import 'allbid.dart';

class MyBidCard extends StatefulWidget {
  final String destination, passengerID, shared, time, price;

  const MyBidCard(
      {super.key,
      required this.destination,
      required this.passengerID,
      required this.shared,
      required this.time,
      required this.price});

  @override
  State<MyBidCard> createState() => _MyBidCardState();
}

class UserData {
  final String time;
  final String shared;
  final String destination;
  final String passengerID;
  final String price;

  UserData(this.time, this.shared, this.destination, this.passengerID,this.price);
}

class _MyBidCardState extends State<MyBidCard> {
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
                          Text(
                            'Rs. ${widget.price}',
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
    );
  }
}
