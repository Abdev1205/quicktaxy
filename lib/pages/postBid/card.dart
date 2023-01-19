import 'package:flutter/material.dart';

import '../../utilis/route.dart';

class MyCard extends StatefulWidget {
  final String destination, passengerID, shared, time;

  const MyCard({
    super.key,
    required this.destination,
    required this.passengerID,
    required this.shared,
    required this.time,
  });

  @override
  State<MyCard> createState() => _MyCardState();
}

class UserData {
  final String time;
  final String shared;
  final String destination;

  UserData(this.time, this.shared ,this.destination);
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
                                Navigator.pushNamed(
                                    context, MyRoute.bidingPageRoute);
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
