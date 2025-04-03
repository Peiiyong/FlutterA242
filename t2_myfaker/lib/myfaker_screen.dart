import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        title: Text('MyFaker'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: onPressed, child: Text('Load Data')),
          ],
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    // Call the API and get the response
    var response = await http.get(
      Uri.parse('https://slumberjer.com/myfaker/myfaker.php'),
    );
    log(response.statusCode.toString());

    log(response.body.toString());
    /*
    O U T P U T 
    [log] 200
    [log] {"status":"success","data":[{"name":"Dr. Liam Hartmann","phone":"886-508-4472 x77854",
            "email":"lferry@yahoo.com","country":"Malta","address":"5842 Hassan Pass\nKellenborough, VA 29059"}]}
    */
  }
}
