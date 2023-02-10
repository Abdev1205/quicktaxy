import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utilis/route.dart';
import 'bid.dart';

// class MyCard extends StatefulWidget {
//   final String destination, passengerID, shared, time, phoneNo, photoURL;

//   const MyCard({
//     super.key,
//     required this.destination,
//     required this.passengerID,
//     required this.shared,
//     required this.time,
//     required this.phoneNo,
//     required this.photoURL,
//   });

//   @override
//   State<MyCard> createState() => _MyCardState();
// }



class UserData {
  final String time;
  final String shared;
  final String destination;
  final String passengerID;
  final String phoneNo;
  final String photoURL;

  UserData({ required this.time,  required this.shared,  required this.destination,  required this.passengerID,
       required this.phoneNo,  required this.photoURL});
}

class MyListTile extends StatefulWidget {
  final UserData userDetails;

  const MyListTile({super.key, required this.userDetails});

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  var color = Colors.pink;

  double rating = 0.0;
  int n = 0;
  
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: ListTile(
          tileColor: Colors.black,
          onTap: ()   {
                              String time = widget.userDetails.time.toString();
                              String shared = widget.userDetails.shared.toString();
                              String destination =
                                  widget.userDetails.destination.toString();
                              String passengerId =
                                  widget.userDetails.passengerID.toString();
                              String phoneNo = widget.userDetails.phoneNo.toString();
                              
                              String photoURL = widget.userDetails.photoURL.toString();

                              FirebaseFirestore.instance
                                  .collection('bids')
                                  .where('driverId',
                                      isEqualTo: FirebaseAuth
                                          .instance.currentUser!.uid)
                                  .get()
                                  .then((value) {
                                if (value.size < 6) {
                                  Navigator.pushNamed(
                                      context, MyRoute.bidingPageRoute,
                                      arguments: UserData(
                                        time : time,
                                        shared:shared,
                                        destination :destination,
                                        passengerID : passengerId,
                                        phoneNo :phoneNo,
                                        photoURL:photoURL,
                                      ));
                                } else {
                                  showDialog<void>(
                                      context: context,
                                      builder: (context) => const AlertDialog(
                                            content: Text(
                                                'You have excceded the bid limit'),
                                          ));
                                }
                              });
                            },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          // subtitle: Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
              
              
          //   ],
          // ),
          leading: CircleAvatar(
            radius: 30,
            foregroundImage: NetworkImage(widget.userDetails.photoURL),
            onForegroundImageError: (exception, stackTrace) {},
            backgroundImage: const AssetImage('assets/GIFs/unknown.gif'),
          ),
          textColor: Colors.white,
          title: Text(
            'Destination : ${widget.userDetails.destination}'
          ),
          isThreeLine: true,
          // dense: true,
          subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text( 'Time : ${widget.userDetails.time}'),
          Text('Shared : ${widget.userDetails.shared == "true" ? 'Yes' : 'No'}' ),
          ],),
        ),
     ),
);
}
}

// class _MyCardState extends State<MyCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10),
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         elevation: 80,
//         color: Colors.black,
//         child: SizedBox(
//           width: 300,
//           height: 180,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,

//                     // ignore: prefer_const_literals_to_create_immutables
//                     children: [
//                       // ignore: prefer_const_constructors
//                       CircleAvatar(
//                         radius: 40,
//                         backgroundImage: NetworkImage(widget.photoURL),
//                       ),
//                       SizedBox(
//                         child: Column(children: [
//                           Row(
//                             children: [
//                               SizedBox(
//                                 width:150,

//                                 child: Text(
                                  
//                                   overflow:TextOverflow.fade,
//                                   softWrap:false,
//                                   maxLines:1 ,
                            
//                                   widget.destination,
//                                   style: const TextStyle(
//                                       color: Colors.white, fontSize: 20),
//                                 ),
//                               ),
//                               Text(
//                                 ' • ${widget.time}',
//                                 style: const TextStyle(
//                                     color: Colors.white, fontSize: 20),
//                               ),
//                             ],
//                           ),
//                           Text(
//                             widget.shared,
//                             style: const TextStyle(
//                                 color: Colors.white, fontSize: 20),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 10),
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 primary: Colors.amber,
//                                 onPrimary: Colors.white,
//                                 shadowColor: Colors.greenAccent,
//                                 elevation: 3,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(32.0)),
//                                 minimumSize: const Size(150, 40), //////// HERE
//                               ),
//                               onPressed: () {
//                                 String time = widget.time.toString();
//                                 String shared = widget.shared.toString();
//                                 String destination =
//                                     widget.destination.toString();
//                                 String passengerId =
//                                     widget.passengerID.toString();
//                                 String phoneNo = widget.phoneNo.toString();
//                                 String photoURL = widget.photoURL.toString();

//                                 FirebaseFirestore.instance
//                                     .collection('bids')
//                                     .where('driverId',
//                                         isEqualTo: FirebaseAuth
//                                             .instance.currentUser!.uid)
//                                     .get()
//                                     .then((value) {
//                                   if (value.size < 6) {
//                                     Navigator.pushNamed(
//                                         context, MyRoute.bidingPageRoute,
//                                         arguments: UserData(
//                                           time,
//                                           shared,
//                                           destination,
//                                           passengerId,
//                                           phoneNo,
//                                           photoURL,
//                                         ));
//                                   } else {
//                                     showDialog<void>(
//                                         context: context,
//                                         builder: (context) => const AlertDialog(
//                                               content: Text(
//                                                   'You have excceded the bid limit'),
//                                             ));
//                                   }
//                                 });
//                               },
//                               child: const Text(
//                                 'Post your Bid',
//                                 style: TextStyle(
//                                     color: Colors.black, fontSize: 15),
//                               ),
//                             ),
//                           )
//                         ]),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
