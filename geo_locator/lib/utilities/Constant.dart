import 'package:flutter/material.dart';

const textcolor = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 50.0,
  color: Colors.white,
);

const textcolor2 = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: 30.0,
  color: Colors.white,
);

const kborderDeco = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide.none,
  ),
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter a City Name',
  icon: Icon(Icons.location_city, color: Colors.white),
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
);
