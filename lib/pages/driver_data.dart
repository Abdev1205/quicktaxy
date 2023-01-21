// ignore_for_file: prefer_const_constructors

import 'package:complete/pages/postBid/post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utilis/route.dart';
import '../widgets/drawer.dart';

String driverName = '';
String driverLicenceNo = '';
String driverVehicleSeat = '';
String driverTaxyNo = '';
String driverMobileno = '';
String driverUPIId = '';

class DriverProfileScreen extends StatefulWidget {
  const DriverProfileScreen({super.key});

  @override
  State<DriverProfileScreen> createState() => _DriverProfileScreenState();
}

CollectionReference drivers = FirebaseFirestore.instance.collection('drivers');

final user = FirebaseAuth.instance.currentUser;

final _formKey = GlobalKey<FormState>();

TextEditingController licenceController = TextEditingController();
TextEditingController seatingCapacityController = TextEditingController();
TextEditingController vehicleNoController = TextEditingController();
TextEditingController phoneNoController = TextEditingController();
TextEditingController upiIdController = TextEditingController();

class _DriverProfileScreenState extends State<DriverProfileScreen> {
   Widget widget1 = const Center(
      child: LoadingIndicator(
    size: 100,
    borderWidth: 5,
  ));

  Future<bool> checkIfDocExists(
      {required String collection, required String docId}) async {
    // Get reference to Firestore collection
    var collectionRef = FirebaseFirestore.instance.collection(collection);

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> docExists = checkIfDocExists(
        collection: 'drivers', docId: FirebaseAuth.instance.currentUser!.uid);
    docExists.then((exists) {
      setState(() {
        if (exists) {
          widget1 = const post();
        } else {
          widget1 = SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                  child: Image.asset(
                    'assets/welcome.gif',
                    height: 120.0,
                    width: 120.0,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -85.0, 0.0),
                  child: Text(
                    'Drivers',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),

                Container(
                  transform: Matrix4.translationValues(0.0, -80.0, 0.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: licenceController,
                            decoration: InputDecoration(
                              labelText: 'Enter Your Driving Licence No',
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter DL number';
                              } else if (value.isNotEmpty) {
                                value.toUpperCase();
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: seatingCapacityController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Enter Seating Capacity',
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Vehicle Seating Capacity';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: vehicleNoController,
                            decoration: InputDecoration(
                              labelText: 'Enter Your Vehicle RC No',
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Vehicle RC No';
                              } else if (value.isNotEmpty) {
                                value.toUpperCase();
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: phoneNoController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Enter Your phone number',
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter valid phone number';
                              } else if (value.length != 10) {
                                return 'Please enter 10 digit number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: upiIdController,
                            decoration: InputDecoration(
                              labelText: 'Enter Your UPI Id',
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your UPI Id';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -60.0, 0.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()){

                      await drivers
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .set({
                        'driverId': user!.uid,
                        'name': user!.displayName,
                        'email': user!.email,
                        'profilePhoto': user!.photoURL,
                        'DLNo': licenceController.text,
                        'PhNo': phoneNoController.text,
                        'Seats': seatingCapacityController.text,
                        'TaxiNo': vehicleNoController.text,
                        'UPIid': upiIdController.text,
                      }).then((value) => print('driver added'));
                      Navigator.pushNamed(context, MyRoute.bidroute);
                      }
                    },
                    child: Text(
                      'Upload',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(250, 40),
                    ),
                  ),
                )

                
              ],
            ),
          ),
        ),
      );
        }
      });
    });
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
      body: widget1,
      drawer: const MyDrawer(),
    );
  }
}
