import 'package:flutter/material.dart';
//Constant values used through out the development
const primaryColor = Color(0xffc0a566);

List<BoxShadow> myShadow = [
  const BoxShadow(
    blurRadius: 15.0,
    offset: Offset(5, 10.0),
    color: Color.fromRGBO(110, 107, 107, 1.0),
  ),
];

List<BoxShadow> details_page_shadow = [
  const BoxShadow(
    blurRadius: 30.0,
    offset: Offset(0, 10.0),
    color: Color.fromRGBO(110, 107, 107, 1.0),
  ),
];

const kAdoptedPets = 'adopted_pets';
