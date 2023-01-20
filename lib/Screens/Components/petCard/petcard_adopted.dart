import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nymble_labs_pet_adoption/Screens/Components/petCard/petcard_not_adopted.dart';
import 'package:nymble_labs_pet_adoption/Utils/kconstants.dart';
import 'package:nymble_labs_pet_adoption/Utils/pet_model.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
// Pet card for adopted pets which is displayed in the pet list by greying out
class petCardadopted extends StatefulWidget {
  const petCardadopted({super.key, required this.pet});
  //each pet is passed as as argument to be used to build the pet card.
  final Pet pet;

  @override
  State<petCardadopted> createState() => _petCardadoptedState();
}

class _petCardadoptedState extends State<petCardadopted> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 10, bottom: 25),
      child: SizedBox(
        height: size.height * .25,
        child: Stack(
          children: <Widget>[
            petCard_notadopted(pet: widget.pet),
            //not_adopted pet card is called here to display it underneath the greyed out container
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 15),
              child: Container(
                height: size.height * .25,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                    blurRadius: 100.0,
                    offset: Offset(0, 50.0),
                    color: Color.fromRGBO(50, 50, 50, 1.0),
                  ),],
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.topLeft,
                      colors: [ Color(0xe5805a00),
                        Color(0x2A000000),
                        Color(0xFF000000),
                      ],
                    )),
              ),
            ),
            Align(
              //Text on top of adopted pet card
              alignment: Alignment.center,
              child: AnimatedTextKit(
                totalRepeatCount: 5,
                animatedTexts: [
                  ColorizeAnimatedText(
                    "Already Adopted.",
                    textStyle: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        shadows: <Shadow>[
                          const Shadow(
                            offset: Offset(0.0, 8.0),
                            blurRadius: 20.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ]),
                    colors: [
                      primaryColor,
                      const Color(0xfff5a54a),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
