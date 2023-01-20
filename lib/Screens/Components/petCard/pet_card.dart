import 'package:flutter/material.dart';
import 'package:nymble_labs_pet_adoption/Screens/Components/petCard/petcard_adopted.dart';
import 'package:nymble_labs_pet_adoption/Screens/Components/petCard/petcard_not_adopted.dart';
import 'package:nymble_labs_pet_adoption/Utils/pet_model.dart';
import 'package:nymble_labs_pet_adoption/Utils/sample_data.dart';
import 'pet_card_details.dart';
import 'pet_card_image.dart';
import 'package:provider/provider.dart';
import 'package:nymble_labs_pet_adoption/Provider/pet_provider.dart';
import 'package:provider/provider.dart';
import 'package:nymble_labs_pet_adoption/Provider/category_provider.dart';

//Pet Card Tile
class PetCardTile extends StatefulWidget {
  const PetCardTile({super.key, required this.pet});
  final Pet pet;

  @override
  State<PetCardTile> createState() => _PetCardTileState();
}

class _PetCardTileState extends State<PetCardTile> {
  @override
  Widget build(BuildContext context) {
    return
      Consumer<PetProvider>(
        //Wrapped in Consumer so that the widget is rebuilt as soon as a pet is adopted
        builder: (context, provider, child)
    => widget.pet.isadopted ? petCardadopted(pet: widget.pet,)
          : petCard_notadopted(pet: widget.pet));
    //Condition to evaluate whether a pet is adopted so that the card is built accordingly.
  }
}