import 'package:flutter/material.dart';
import 'package:nymble_labs_pet_adoption/Utils/sample_data.dart';
import 'package:nymble_labs_pet_adoption/Utils/pet_model.dart';

// A global variable to hold the list of pets
List<Pet> _pets = pets;

// PetProvider class which extends ChangeNotifier
// This class is used to provide the list of pets and notify the listeners
// when the pets are adopted
class PetProvider extends ChangeNotifier {

  // A list of pets to hold the pets
  List<Pet> pets = _pets;

  // A method to mark the already adopted pets as adopted
  void alreadyadoptedpets(List<String> alreadyAdoptedpet) {
    // Filter the pets where the id is 1
    pets.where((Pet) => Pet.id=='1');
    // Iterate through the pets
    for(Pet pet in pets ) {
      // Check if the pet id is in the already adopted pet list
      if ( pet.id == alreadyAdoptedpet) {
        // Mark the pet as adopted
        pet.isadopted=true;
      }
    }
    // Notify the listeners that the pets have been updated
    notifyListeners();
  }

  // A method to adopt a pet
  void adoptPet(Pet pet) {
    // Mark the pet as adopted
    pet.isadopted = true;
    // Notify the listeners that the pets have been updated
    notifyListeners();
  }
}




