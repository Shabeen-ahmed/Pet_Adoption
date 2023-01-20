import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nymble_labs_pet_adoption/Utils/common widgets/border_box.dart';
import 'package:nymble_labs_pet_adoption/Utils/kconstants.dart';
import 'package:nymble_labs_pet_adoption/Utils/pet_model.dart';
import 'package:nymble_labs_pet_adoption/Utils/sample_data.dart';
import 'package:provider/provider.dart';
import 'package:nymble_labs_pet_adoption/Provider/pet_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nymble_labs_pet_adoption/Screens/pet_details_page.dart';
import 'package:confetti/confetti.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({required this.pet});
  PetProvider petProvider = new PetProvider();
  Pet pet;
  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  bool confettiIsPlaying=false;
  final controller = ConfettiController();
  @override
  void initState() {
    // This function is called when the widget is created
    super.initState();
  }
  @override
  void dispose() {
    // This function is called when the widget is removed
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Consumer<PetProvider>(
      builder: (context, provider, _) =>Stack(
          children:[
            // The main container
            Container(
              padding: const EdgeInsets.all(28.0),
              width: size.width,
              decoration: BoxDecoration(
                color: isDarkMode?Colors.grey[500]:Colors.grey[300],
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(30.0),
                  right: Radius.circular(30.0),
                ),
              ),
              // Gesture detector to handle the tap on the button
              child: GestureDetector(
                child:widget.pet.isadopted ? const adoptedbutton(): notadoptedbutton(),
                onTap: (){
                  provider.adoptPet(widget.pet);
                  setState(() {
                    // Changing the isadopted property of the pet
                    widget.pet.isadopted?widget.pet.isadopted:widget.pet.isadopted= !widget.pet.isadopted;
                    // Saving the adopted pet in shared preferences
                    saveAdoptedPets(widget.pet.id);
                    print('${widget.pet.name}');
                    playconfetti();
                  });
                },
              ),
            ),
            // Confetti widget to display confetti on successful adoption
            ConfettiWidget(
              confettiController: controller,
              shouldLoop: false,
              emissionFrequency: 0.35,
              blastDirectionality: BlastDirectionality.explosive,
              numberOfParticles: 10,
              maxBlastForce: 75,
              minBlastForce: 10,
              gravity: 0.10,
            )]
      ),
    );
  }

  void playconfetti() {
    controller.play();
  }
}

class notadoptedbutton extends StatelessWidget {
  const notadoptedbutton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    final Size size = MediaQuery.of(context).size;
    return Container(
    width: size.width * .65,
    height: 70.0,
    decoration: BoxDecoration(
    boxShadow: myShadow,
    color: primaryColor,
    borderRadius: BorderRadius.circular(20.0),
    ),
    child: Center(
    child: Text(
    'Adopt Me!',
    style: GoogleFonts.montserrat(
    color: isDarkMode?Colors.black:Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 15.0, ),),
    ),
    );
    }
}

class adoptedbutton extends StatelessWidget {
  const adoptedbutton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: Duration(milliseconds:500 ),
      width: size.width * .65,
      height: 70.0,
      decoration: BoxDecoration(
        boxShadow: myShadow,
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text(
          'Adopted!',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15.0, ),),
      ),
    );
  }
}

Future<void> saveAdoptedPets(String petId) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> adoptedPetsIds = prefs.getStringList(kAdoptedPets) ?? [];
  adoptedPetsIds.contains(petId)?print("already"):adoptedPetsIds.add(petId);
  prefs.setStringList(kAdoptedPets, adoptedPetsIds);
}

