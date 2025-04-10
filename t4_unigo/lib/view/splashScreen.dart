import 'package:flutter/material.dart';
import 'package:t4_unigo/view/mainscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    Future.delayed(Duration(seconds: 5), () {
      //Navigator.pushReplacementNamed(context, '/mainScreen'); Style 1

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      );

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Change the background color for the whole splash screen
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.amber.shade900,
              Colors.purple.shade900,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/unigo.png', scale: 5,),
              const CircularProgressIndicator(color: Colors.white,), // loading --> CircularProgressIndicator()

              SizedBox(height: 10,),
              const CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
              ),

              RefreshProgressIndicator(), // loading 

              LinearProgressIndicator(),

              CircularProgressIndicator.adaptive(backgroundColor: Colors.amber,),
          
/*               Text(
                'UNIGO',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 64,
                  color: Colors.blue[800],
                ),
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
