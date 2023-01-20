import 'package:flutter/material.dart';
import 'package:nymble_labs_pet_adoption/Utils/pet_model.dart';
import 'pet_card_details.dart';
import 'pet_card_image.dart';

// Pet card for pets which is displayed in the pet list
class petCard_notadopted extends StatefulWidget {
  const petCard_notadopted({super.key, required this.pet});
  //each pet is passed as as argument to be used to build the pet card.
  final Pet pet;

  @override
  State<petCard_notadopted> createState() => _petCard_notadoptedState();
}

class _petCard_notadoptedState extends State<petCard_notadopted> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(

      margin: const EdgeInsets.only(left: 15, right: 10, bottom: 25),
      child: Stack(
        children: <Widget>[
          //Pet card divided into two, i.e, Based on details of the pet and the image of the pet
          Align(
            alignment: Alignment.centerRight,
            child: PetcardDetails(size: size, pet: widget.pet),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: PetCardImage(size: size, pet: widget.pet),
          ),

        ],
      ),
    );
  }
}
