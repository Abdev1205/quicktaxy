import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/app.dart';
import 'pages/firebase_options.dart';

// ignore: todo
// TODO(codelab user): Get API key
const clientId = 'YOUR_CLIENT_ID';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
