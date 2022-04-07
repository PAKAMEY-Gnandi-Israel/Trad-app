import 'package:flutter/material.dart';
import 'package:miagbo/pages/PageOne.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miagbô',
      debugShowCheckedModeBanner: false,
    color:Color(0xffEBF3FF)  ,
      home: PageOne(),
    );
  }
}
