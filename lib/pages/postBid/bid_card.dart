// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import '../../utilis/route.dart';
// import '../postBid/card.dart';

// class MyListTile extends StatefulWidget {
//   final UserData userDetails;

//   const MyListTile({super.key, required this.userDetails});

//   @override
//   State<MyListTile> createState() => _MyListTileState();
// }

// class _MyListTileState extends State<MyListTile> {
//   var color = Colors.pink;

//   double rating = 0.0;
//   int n = 0;
  
 

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: Material(
//         elevation: 5,
//         borderRadius: BorderRadius.circular(20),
//         child: Ink(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             gradient: LinearGradient(
//               colors: [Colors.amber.shade800, Colors.amber],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: ListTile(
//             onTap: ()   {
//                                 String time = widget.userDetails.time.toString();
//                                 String shared = widget.userDetails.shared.toString();
//                                 String destination =
//                                     widget.userDetails.destination.toString();
//                                 String passengerId =
//                                     widget.userDetails.passengerID.toString();
//                                 String phoneNo = widget.userDetails.phoneNo.toString();
                                
//                                 String photoURL = widget.userDetails.photoURL.toString();

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
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//             // subtitle: Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //   children: [
                
                
//             //   ],
//             // ),
//             leading: CircleAvatar(
//               // radius: 20,
//               foregroundImage: NetworkImage(widget.userDetails.photoURL),
//               onForegroundImageError: (exception, stackTrace) {},
//               backgroundImage: const AssetImage('assets/GIFs/unknown.gif'),
//             ),
//             textColor: Colors.white,
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   width: 125,
//                   child: Text(
//                     // widget.userDetails.driverName,
//                     widget.userDetails.destination,
//                     overflow: TextOverflow.fade,
//                     softWrap: false,
//                     maxLines: 1,
//                   ),
//                 ),
                
//               ],
//             ),
//           ),
//         ),
//      ),
// );
// }
// }