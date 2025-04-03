import 'package:flutter/material.dart';

class MyFakerScreen extends StatefulWidget {
  const MyFakerScreen({super.key});

  @override
  State<MyFakerScreen> createState() => _MyFakerScreenState();
}

class _MyFakerScreenState extends State<MyFakerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MYFaker'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Text('MyFaker'),
      ),
    );
  }
}
