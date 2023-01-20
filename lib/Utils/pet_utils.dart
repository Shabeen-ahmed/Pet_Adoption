import 'package:flutter/material.dart';
import 'package:nymble_labs_pet_adoption/Utils/sample_data.dart';
import 'package:nymble_labs_pet_adoption/Utils/pet_model.dart';
import 'package:nymble_labs_pet_adoption/Utils/kconstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Pet getPetById(String id) {
  //loop through each pet in the pets list, if the id matches return the pet
  for (Pet pet in pets) {
    if (pet.id == id) {
      pet.isadopted = true;
      return pet;
    }
  }
  //if pet not found return a default pet
  return Pet( name: "Not Found",   id: "0",   age: 0, species: "", isadopted: false, animal: '',
      gender: IconData(0), price: 0,  images: []);
}



Future<List<String>> getAdoptedPetsIdfromStorage() async {
  //function retreives pets id from storage
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList(kAdoptedPets) ?? [];
}
