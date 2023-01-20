import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nymble_labs_pet_adoption/Utils/kconstants.dart';
import 'package:nymble_labs_pet_adoption/Utils/pet_model.dart';
//Details displayed on the Pet card in the homepage
class PetcardDetails extends StatelessWidget {
  const PetcardDetails({
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
    return Container(
      margin: const EdgeInsets.only(top: 30.0),
      padding: const EdgeInsets.fromLTRB(30.0, 0, 8.0, 0),
      width: size.width * .45,
      height: size.height * .2,
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                pet.name,
                style: GoogleFonts.montserrat(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              Icon(
                pet.gender,
                color: primaryColor,
                size: 37.0,
              ),
            ],
          ),
          Text(
            pet.species,
            style: GoogleFonts.montserrat(
              fontSize: 13.0,
              fontWeight: FontWeight.w400,
              color: primaryColor,
            ),
          ),
          Text(
            '${pet.age} years old',
            style: GoogleFonts.montserrat(
              fontSize: 13.0,
              fontWeight: FontWeight.w400,
              color: primaryColor,
            ),
          ),

        ],
      ),
    );
  }
}
