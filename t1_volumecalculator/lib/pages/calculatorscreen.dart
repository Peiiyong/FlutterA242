import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  //GET THE INPUT
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  double volume = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text('Volume Calculator', style: TextStyle(color: Colors.white)),
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

                SizedBox(width: 50,),

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

                SizedBox(width: 50,),

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
            // HEIGHT
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Height (cm): '),

                SizedBox(width: 50,),

                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _heightController,
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
              volume.toString() + ' cm³',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),

            Text('Meters Cubed'),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _calculator,
                  child: Text('Calculate'),
                ),
                SizedBox(width: 15),
                ElevatedButton(onPressed: _reset, child: Text('Reset')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //calculate the volume
 void _calculator() {
  try {
    double length = double.parse(_lengthController.text);
    double width = double.parse(_widthController.text);
    double height = double.parse(_heightController.text);

    setState(() {
      volume = length * width * height;
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
      _heightController.clear();
      volume = 0;
    });
  }
}
