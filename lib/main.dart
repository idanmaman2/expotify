import 'package:flutter/material.dart';
import 'package:igals_expotify/design/color.dart';
import 'package:igals_expotify/widgets/spotify_login.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ISPOT',
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xFF01DB954, colorSpotifyMainPallet),  
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const SpotifyLogin();
  }
}