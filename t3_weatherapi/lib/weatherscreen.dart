import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _controller = TextEditingController();
  List<dynamic> weatherData = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),

      body: Center(
        child: Column(
          children: [
            TextField(controller: _controller),
            ElevatedButton(child: Text('Search'), onPressed: getWeather),
            Expanded(
              child: weatherData.isEmpty? Text('no data'): ListView.builder(
                itemCount: weatherData.length,
                itemBuilder: (context, value) => 
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getWeather() async {
    String loc = _controller.text;
    var response = await http.get(
      Uri.parse(
        'https://api.data.gov.my/weather/forecast?state=$loc',
      ),
    );
    log(response.body);
    if(response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        weatherData = data;
      });  
    } else {
      log('Error: ${response.statusCode}');
    }

  }
}
