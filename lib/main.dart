import 'package:flutter/material.dart';
import './Screens/gallery_screen.dart'; 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primaryColor: Colors.purple,
          colorSchemeSeed: Colors.white,
          useMaterial3: true),
      home: GalleryScreen(),
    );
  }
}
