import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:notes/pages/showdata.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(brightness: Brightness.dark),
      title: "Notes App",
      home: ShowDatapage(),
    );
  }
}
