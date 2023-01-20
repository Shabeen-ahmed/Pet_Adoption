import 'package:flutter/material.dart';
import 'package:nymble_labs_pet_adoption/Utils/kconstants.dart';
import 'package:nymble_labs_pet_adoption/Utils/pet_model.dart';
import 'package:nymble_labs_pet_adoption/Utils/kconstants.dart';
//Image displayed on the Pet card in the homepage
class PetCardImage extends StatelessWidget {
  const PetCardImage({
    Key? key,
    required this.size,
    required this.pet,
    //size refers to the size of the system screen
    //pet refers to the pet whose card currently being built
  }) : super(key: key);

  final Size size;
  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${pet.name}',
      child: Stack(
        children: <Widget>[
        Container(
              margin: const EdgeInsets.only(top: 10.0),
              width: size.width * .50,
              height: size.height * .25,
              decoration: BoxDecoration(
                boxShadow: myShadow,
                image: DecorationImage(
                    fit: BoxFit.cover, image:  AssetImage(pet.images[0]),),
                borderRadius: BorderRadius.all(Radius.circular(18.0)),
            ),
            child: SizedBox()
        ),
        ],
      ),
    );
  }
}
