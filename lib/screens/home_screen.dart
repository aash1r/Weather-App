import 'dart:ui';

import 'package:flutter/material.dart';

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
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: const Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Column(
                        children: [
                          Text(
                            "300°C",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 33),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.cloud,
                            size: 65,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Rain",
                            style: TextStyle(
                                fontWeight: FontWeight.w200, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Placeholder(
              fallbackWidth: 120,
              fallbackHeight: 100,
            ),
            const SizedBox(
              height: 15,
            ),
            const Placeholder(
              fallbackHeight: 100,
            )
          ],
        ),
      ),
    );
  }
}
