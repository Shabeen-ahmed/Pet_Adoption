import 'package:flutter/foundation.dart';
import 'package:nymble_labs_pet_adoption/Utils/pet_model.dart';
import '../Utils/sample_data.dart';

// A global variable to hold the list of pets
List<Pet> _pets = pets;
List<Pet> _originalPets = pets;

// CategoryProvider class which extends ChangeNotifier
// This class is used to provide the list of pets based on the selected category and search text
class CategoryProvider with ChangeNotifier {

  // A variable to hold the selected category
  String _selectedCategory = 'All';
  // A getter to return the selected category
  String get selectedCategory => _selectedCategory;

  // A variable to hold the search text
  String _searchText = "";
  // A getter and setter for the search text
  String get searchText => _searchText;
  set searchText(String value) {
    _searchText = value;
    // Notify the listeners that the search text has been updated
    notifyListeners();
  }

  // A getter to return the pets based on the selected category and search text
  List<Pet> get pets {
    // If the selected category is "All"
    if(_selectedCategory=="All") {
      // Return all the pets where the name contains the search text
      return _originalPets.where((pet) => pet.name.toLowerCase().contains(_searchText.toLowerCase())).toList();
    }
    // Return all the pets where the animal is the selected category
    return _pets.where((pet) => pet.animal == _selectedCategory).toList();
  }

  // A setter to set the selected category
  set selectedCategory(String value) {
    _selectedCategory = value;
    // Print the selected category
    print('$_selectedCategory here');
    // Notify the listeners that the selected category has been updated
    notifyListeners();
  }
}
