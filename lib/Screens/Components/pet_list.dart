import 'package:flutter/material.dart';
import 'package:nymble_labs_pet_adoption/Utils/kconstants.dart';
import 'package:nymble_labs_pet_adoption/Screens/pet_details_page.dart';
import 'petCard/pet_card.dart';
import 'package:provider/provider.dart';
import 'package:nymble_labs_pet_adoption/Provider/category_provider.dart';

// List that acts as the base to display Pet cards
class PetList extends StatefulWidget {
  @override
  State<PetList> createState() => _PetListState();
}

class _PetListState extends State<PetList> {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    //assigns true to 'isDarkMode' if the system theme is set to dark mode
    final size = MediaQuery.of(context).size;
    return Consumer<CategoryProvider>(
        // Homepage scaffold wrapped in Consumer inorder to be rebuilt
        builder: (context, provider, child) => Container(
            height: size.height * .6,
            decoration: BoxDecoration(
                border: Border.all(),
                color: isDarkMode ? Color(0xffab945b) : Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: myShadow),
            child: ListView.builder(
              itemCount: provider.pets.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      //On tapping a pet card, it pushes to the details page of the pet
                      builder: (context) =>
                          PetDetailsPage(pet: provider.pets[index]),
                    ),
                  ),
                  child: PetCardTile(pet: provider.pets[index]),
                );
              },
            )));
  }
}
