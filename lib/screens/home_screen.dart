import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/widgets/add_info.dart';
import 'package:weather_app/widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 14.0),
            child: Icon(Icons.refresh),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //card
            const SizedBox(width: double.infinity,child: CustomCard(text: "300 C",icon: Icons.cloud,text1: "Rain",),),
            Container(padding: const EdgeInsets.only(top: 5),alignment: Alignment.centerLeft,child: const Text("Weather Forecast",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),),
            const SizedBox(
              height: 15,
            ),
            const SingleChildScrollView(scrollDirection: Axis.horizontal,child: Row(children: [
              CustomCard(text: "09: 00",icon: Icons.cloud,
              text1: "30.67",),CustomCard(text: "09: 00",icon: Icons.cloud,
              text1: "30.67",),CustomCard(text: "09: 00",icon: Icons.cloud,
              text1: "30.67",),CustomCard(text: "09: 00",icon: Icons.cloud,
              text1: "30.67",),CustomCard(text: "09: 00",icon: Icons.cloud,
              text1: "30.67",),
              ],),),
              Container(padding: const EdgeInsets.only(top: 5),alignment: Alignment.centerLeft,child: const Text("Additional Information",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),),
            const SizedBox(
              height: 15,
            ),
             const Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [AddInfo(text2: "Humidity",text3: "94",icon: Icons.water_drop,),AddInfo(icon: Icons.wind_power,text2: "Wind Speed",text3: "7.67",),AddInfo(icon: Icons.umbrella,text2: "Pressure",text3: "1006",)],),
          ],
        ),
      ),
    );
  }
}
