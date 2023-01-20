import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nymble_labs_pet_adoption/Utils/kconstants.dart';
import 'package:nymble_labs_pet_adoption/Utils/pet_model.dart';
import 'package:nymble_labs_pet_adoption/Utils/common widgets/spacing.dart';

class DetailsPagePetDetails extends StatelessWidget {
  const DetailsPagePetDetails({super.key, required this.pet});
  final Pet pet;
  @override
  Widget build(BuildContext context) {

    var brightness = MediaQuery.of(context).platformBrightness;
    // Checking the theme of the device
    bool isDarkMode = brightness == Brightness.dark;
//Getting the size of the screen
    final Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 10.0,
        ),
//margin to position the container
        margin: EdgeInsets.only(top: size.height * .325),
        width: size.width * .85,
        height: size.height * .30,
        decoration: BoxDecoration(
//Adding a shadow to the container
          boxShadow: details_page_shadow,
//Changing the background color based on device brightness
          color: isDarkMode ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
//Row for name and gender of the pet
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  pet.name,
                  style: GoogleFonts.montserrat(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 45.0,
                  ),
                ),
                Icon(
                  pet.gender,
                  color: primaryColor,
                  size: 40.0,
                ),
              ],
            ),
//Row for species of the pet
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Species : ",
                  style: GoogleFonts.montserrat(
                    color: primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  pet.species,
                  style: GoogleFonts.montserrat(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
//Row for age of the pet
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Age : ',
                  style: GoogleFonts.montserrat(
                    color: primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  '${pet.age} years old',
                  style: GoogleFonts.montserrat(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 25.0,
                  ),
                ),
              ],
            ),
//Row for price of the pet
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Price : ',
                  style: GoogleFonts.montserrat(
                    color: primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                  ),
                ),
                addHorizontalSpace(8.0),
                Text(
                  '${pet.price} rupees',
                  style: GoogleFonts.montserrat(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
