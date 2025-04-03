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
              child:
                  weatherData.isEmpty
                      ? Text('no data')
                      : ListView.builder(
                        itemCount: weatherData.length,
                        itemBuilder: (context, value) {
                          String name = weatherData[value]['location']['location_name'];
                          String date = weatherData[value]['date'];
                          String morning = weatherData[value]['morning_forecast'];
                          String afternoon = weatherData[value]['afternoon_forecast'];
                          String evening = weatherData[value]['night_forecast'];
                          String summary = weatherData[value]['summary_forecast'];

                          return Card(
                            child: ListTile(
                              title: Text(name),
                              subtitle: Text('$date\n$morning\n$afternoon\n$evening\n$summary'),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getWeather() async {
    String loc = _controller.text;
    
    var response = await http.get(
      Uri.parse('https://api.data.gov.my/weather/forecast?state=$loc'), // not accurate
    ); 
    //https://api.data.gov.my/weather/forecast/?contains=$loc@location__location_name *cant use this 
    //https://api.data.gov.my/weather/forecast/?contains=Jitra@location__location_name * success
    log(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        weatherData = data;
      });
    } else {
      log('Error: ${response.statusCode}');
    }
  }
}
