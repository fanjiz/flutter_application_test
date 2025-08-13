import 'package:flutter/material.dart';
import 'profile.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false, // ini yang menghilangkan banner debug
      initialRoute: "/",
      routes: {
        '/': (context) => const Home(title: 'Study Club'),
        '/profile': (context) => const Profile(title: 'Profile'),
      },

    );
  }
}