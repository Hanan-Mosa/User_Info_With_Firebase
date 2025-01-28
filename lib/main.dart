import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user_info_with_firestore/firebase_options.dart';
import 'package:user_info_with_firestore/user/user_data.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Info With FireStore',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
     home: UserData(),
    );
  }
}