import 'package:flutter/material.dart';
import 'package:geo_locator/utilities/Constant.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff444345),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: TextField(
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: kborderDeco,
              onChanged: (Value) {
                cityName = Value;
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: Image(
              image: AssetImage('assets/Map.gif'),
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, cityName);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
                onPrimary: Colors.grey,
              ),
              child: Text('Get weather'),
            ),
          ),
        ],
      ),
    );
  }
}
