import 'package:flutter/material.dart';
import 'package:t4_unigo/view/user_registration.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
        backgroundColor: Colors.amber.shade900,
      ),

      body: Center(
        child: Text('Welcome to the Main Screen'),
      ),

      // The button is located at the bottom right corner of the screen.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen()));
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}
