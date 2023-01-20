import 'package:flutter/material.dart';
import 'package:nymble_labs_pet_adoption/Utils/kconstants.dart';
import 'package:nymble_labs_pet_adoption/Utils/sample_data.dart';
import 'package:nymble_labs_pet_adoption/Screens/pet_details_page.dart';
import 'package:nymble_labs_pet_adoption/Screens/Components/petCard/pet_card.dart';
import 'package:nymble_labs_pet_adoption/Utils/pet_model.dart';
import 'package:provider/provider.dart';
import 'package:nymble_labs_pet_adoption/Provider/pet_provider.dart';

class history_page extends StatelessWidget {
  const history_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Pet> AdoptedPets = pets.where((Pet) => Pet.isadopted==true).toList();
    final Size size = MediaQuery.of(context).size;
    return Consumer<PetProvider>(
        builder: (context, provider, child)
        =>Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 25,
        centerTitle: true,
        title: Text(
          "History"
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              border: Border.all(),
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: myShadow
          ),
          child:
          ListView.builder(
            itemCount: AdoptedPets.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PetDetailsPage(
                      pet: AdoptedPets[index],
                    ),
                  ),
                ),
                child: PetCardTile(
                  // pet: pets[index].isadopted==true?pets[index]:pets[0],
                    pet: AdoptedPets[index],
                ),
              );
            },
          )
      )
    ));
  }
}

