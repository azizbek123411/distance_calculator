import 'package:distance_calculator/models/cordinates.dart';
import 'package:distance_calculator/models/result_model.dart';
import 'package:distance_calculator/service/api_service.dart';
import 'package:distance_calculator/widgets/textfields.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ResultModel? resultModel;
  TextEditingController startLong = TextEditingController();
  TextEditingController startLat = TextEditingController();
  TextEditingController endLong = TextEditingController();
  TextEditingController endLat = TextEditingController();

  Widget HBox(double height) {
    return SizedBox(
      height: height,
    );
  }

  void calculate() async {
    Cordinates cordinates = Cordinates(
      startLatitude: startLat.text.trim(),
      startLongitude: startLong.text.trim(),
      endLatitude: endLat.text.trim(),
      endLongitude: endLong.text.trim(),
    );
    final result = await ApiService.calculate(cordinates);
    if (result != null) {
      setState(() {
        resultModel = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Distance calculator',
          style: TextStyle(color: Colors.white, fontSize: 23),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          child: Column(
            children: [
              HBox(10),
              AppTextField(
                controller: startLong,
                title: 'Start longtitude',
              ),
              HBox(10),
              AppTextField(
                controller: startLat,
                title: 'Start latitude',
              ),
              HBox(10),
              AppTextField(
                controller: endLong,
                title: 'End longtitude',
              ),
              HBox(10),
              AppTextField(
                controller: endLat,
                title: 'End latitude',
              ),
              HBox(30),
              ElevatedButton(
                onPressed: calculate,
                child: const Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              HBox(20),
              if (resultModel != null)
                Center(
                  child: Text(
                    "${resultModel!.mile} metr",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
