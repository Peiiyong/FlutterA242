import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyFakerScreen extends StatefulWidget {
  const MyFakerScreen({super.key});

  @override
  State<MyFakerScreen> createState() => _MyFakerScreenState();
}

class _MyFakerScreenState extends State<MyFakerScreen> {
  final TextEditingController controller1 = TextEditingController();
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: onPressed, child: Text('Load Data')),
            SizedBox(
              width: 300,
              child: TextField(
                controller: controller1,
                maxLines: 6,
                decoration: InputDecoration(
                  labelText: 'Result',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
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

    // Check if the response is successful (status code 200)--------------------------------------------------------
    //log(response.statusCode.toString());
    log(response.body.toString());
    /*
    O U T P U T 
    [log] 200
    [log] {"status":"success","data":[{"name":"Dr. Liam Hartmann","phone":"886-508-4472 x77854",
            "email":"lferry@yahoo.com","country":"Malta","address":"5842 Hassan Pass\nKellenborough, VA 29059"}]}
    */

    if (response.statusCode == 200) {//------------------------------------------------------------------------------
      //convert json data to array
      var resparr = json.decode(response.body);
      print(
        resparr['status'],
      ); // I/flutter (24653): success  **Use ['status'] || ['data'] || ['data'][0]['name']
      print(resparr['data'][0]['name']);
      // I/flutter (24653): Frank Fahey *第一次按
      // I/flutter (24653): Stephany Haag *第二次
      // I/flutter (24653): Beau Schuppe IV *第三次
      // I/flutter (24653): Mr. Logan Will Sr. *第四次

      // display data in text field --------------------------------------------------------------------------------
      controller1.text = resparr['data'][0]['name'] + '\n' +
          resparr['data'][0]['phone'] +
          '\n' +
          resparr['data'][0]['email'] +
          '\n' +
          resparr['data'][0]['country'] +
          '\n' +
          resparr['data'][0]['address'];

        setState(() {});
    }else {
      controller1.text = 'Error';
      setState(() {});
    }
  }
}
