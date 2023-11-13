import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/widgets/add_info.dart';
import 'package:weather_app/widgets/custom_card.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Map<String, dynamic>> getWeather() async {
    try {
      final res = await http.get(
        Uri.parse(
            "http://api.openweathermap.org/data/2.5/forecast?q=Karachi,pk&APPID=10a60e9e16943ab419a94824bbdab942"),
      );
      final data = jsonDecode(res.body);

      if (data["cod"] != "200") {
        throw data["message"];
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Weather App",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.refresh)),
            )
          ],
        ),
        body: FutureBuilder(
          future: getWeather(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }

            final data = snapshot.data;
            final temp = data?["list"][0]["main"]["temp"];
            final sky = data?["list"][0]["weather"][0]["main"];
            final humidity = data?["list"][0]['main']['humidity'];
            final pressure = data?['list'][0]['main']['pressure'];
            final windSpeed = data?['list'][0]['wind']['speed'];
            final city = data?['city']['name'];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  //card
                  SizedBox(
                    width: double.infinity,
                    child: CustomCard(
                      text: "$temp",
                      icon: sky == 'Clouds' || sky == 'Rain'
                          ? Icons.cloud
                          : Icons.sunny,
                      text1: city,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Weather Forecast",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          final time =
                              DateTime.parse(data?['list'][index]['dt_txt']);
                          return CustomCard(
                            text: DateFormat.j().format(time),
                            icon: data?["list"][index]["weather"][0]["main"] ==
                                        'Clouds' ||
                                    data?["list"][index]["weather"][0]
                                            ["main"] ==
                                        "Rain"
                                ? Icons.cloud
                                : Icons.sunny,
                            text1:
                                data!['list'][index]['main']['temp'].toString(),
                          );
                        }),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Additional Information",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AddInfo(
                        text2: "Humidity",
                        text3: "$humidity",
                        icon: Icons.water_drop,
                      ),
                      AddInfo(
                        icon: Icons.wind_power,
                        text2: "Wind Speed",
                        text3: "$windSpeed",
                      ),
                      AddInfo(
                        icon: Icons.umbrella,
                        text2: "Pressure",
                        text3: "$pressure",
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}
