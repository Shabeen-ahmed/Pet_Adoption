import 'package:flutter/material.dart';
//Pet Model
class Pet {
  Pet(
      {required this.id,
        required this.species,
        required this.animal,
        required this.name,
        required this.age,
        required this.images,
        required this.gender,
      required this.price,
      required this.isadopted});
  final String species, name, animal;
  final List images;
  final int age;
  final IconData gender;
  final int price;
  bool isadopted;
  final String id;
}
