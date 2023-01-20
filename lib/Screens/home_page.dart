import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nymble_labs_pet_adoption/Screens/Components/pet_list.dart';
import 'package:nymble_labs_pet_adoption/Screens/Components/categories.dart';
import 'package:nymble_labs_pet_adoption/Screens/Components/search_bar.dart';
import 'package:nymble_labs_pet_adoption/Screens/history.dart';
import 'package:nymble_labs_pet_adoption/Utils/common%20widgets/spacing.dart';
import 'package:nymble_labs_pet_adoption/Utils/kconstants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

//HomePage
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black87,
                elevation: 25,
                centerTitle: true,
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnimatedTextKit(
                        totalRepeatCount: 5,
                        animatedTexts: [
                          ColorizeAnimatedText(
                            "Nymble Pet Adoption",
                            textStyle: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                wordSpacing: 2,
                                fontSize: 20),
                            colors: [
                              primaryColor,
                              Colors.white,
                            ],),
                        ],),
                      GestureDetector(
                        child: const Icon(
                          Icons.history,
                          color: primaryColor,
                        ),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const history_page(),
                          ),),
                      )
                    ]),
              ),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Column(children: <Widget>[
                  addVerticalSpace(20),
                  const SearchBar(),
                  addVerticalSpace(20.0),
                  const Categories(),
                  addVerticalSpace(10),
                  Expanded(child: PetList()),
                ]),
              ),
    );
  }
}