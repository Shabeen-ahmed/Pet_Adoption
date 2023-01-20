import 'package:flutter/material.dart';
import 'package:nymble_labs_pet_adoption/Screens/home_page.dart';
import 'package:nymble_labs_pet_adoption/Provider/pet_provider.dart';
import 'package:nymble_labs_pet_adoption/Utils/kconstants.dart';
import 'package:nymble_labs_pet_adoption/Utils/pet_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nymble_labs_pet_adoption/Utils/pet_utils.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {return _SplashScreenState();}}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //when the widget is initialized, it calls the getAdoptedPets function
    getAdoptedPets();
  }
  @override

  Future<List<Pet>> getAdoptedPets() async {
    //retrieves stored pets id and stores it into list of strings
    List<String> adoptedPetsIds = await getAdoptedPetsIdfromStorage();
    PetProvider petProvider = new PetProvider();
    //Calling petProvider and passing each pet id which is already adopted
    petProvider.alreadyadoptedpets(adoptedPetsIds);
    List<Pet> adoptedPets = [];
    //loop through each id, get the pet by id and add it to the adoptedPets list
    for (String id in adoptedPetsIds) {
      adoptedPets.add(getPetById(id));
    }

    await Future.delayed(const Duration(seconds: 3), () {});
    Route route = MaterialPageRoute(builder: (context) => HomePage());//Route to homepage
    Navigator.pushReplacement(context, route);
    return adoptedPets;
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          //Shows a loading animation while the necessary processes are being taken place
          color: primaryColor,
          size: 100.0,),),);
  }
}
