import 'package:flutter/material.dart';
import 'package:t3_weatherapi/weatherscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplasehScreen()
    );
  }
}

class SplasehScreen extends StatefulWidget {
  const SplasehScreen({super.key});

  @override
  State<SplasehScreen> createState() => _SplasehScreenState();
}

class _SplasehScreenState extends State<SplasehScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WeatherScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Weather Forecast'),
      ),
    );
  }
}
