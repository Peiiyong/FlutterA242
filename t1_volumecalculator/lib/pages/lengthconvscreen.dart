import 'package:flutter/material.dart';

class LengthConvScreen extends StatefulWidget {
  const LengthConvScreen({super.key});

  @override
  State<LengthConvScreen> createState() => _LengthConvScreenState();
}

class _LengthConvScreenState extends State<LengthConvScreen> {
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _widthController = TextEditingController();

  double volume = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text('Area Calculator', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LENGTH
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Length (cm): '),
                SizedBox(width: 50),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _lengthController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            // WIDTH
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Width (cm):  '),
                SizedBox(width: 50),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _widthController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              '$volume cm²',  // **修正单位**
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text('Square Centimeters'),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _calculator,
                  child: Text('Calculate'),
                ),
                SizedBox(width: 15),
                ElevatedButton(
                  onPressed: _reset, 
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _calculator() {
    try {
      double length = double.parse(_lengthController.text);
      double width = double.parse(_widthController.text);

      setState(() {
        volume = length * width;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter valid numbers'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _reset() {
    setState(() {
      _lengthController.clear();
      _widthController.clear();
      volume = 0;
    });
  }
}
