import 'package:flutter/material.dart';
import 'package:nymble_labs_pet_adoption/Provider/pet_provider.dart';
import 'package:nymble_labs_pet_adoption/Screens/Components/details_page_components/custom_nav_bar.dart';
import 'package:nymble_labs_pet_adoption/Screens/Components/details_page_components/details_card.dart';
import 'package:nymble_labs_pet_adoption/Screens/Components/details_page_components/details_page_appbar.dart';
import 'package:nymble_labs_pet_adoption/Screens/Components/details_page_components/page_slider.dart';
import 'package:nymble_labs_pet_adoption/Utils/pet_model.dart';
import 'package:provider/provider.dart';

// PetDetailsPage class is responsible for displaying the details of the pet
// after the user has chosen one. It takes in a pet object as an argument
class PetDetailsPage extends StatefulWidget {
  const PetDetailsPage({super.key, required this.pet});

  final Pet pet;

  @override
  State<PetDetailsPage> createState() => _PetDetailsPageState();
}

class _PetDetailsPageState extends State<PetDetailsPage> {
  // Active index keeps track of the current page index
  int _activeIndex = 0;
  // Page controller for the pageview
  final _pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    // Add a listener to the page controller
    _pageViewController.addListener(() {
      setState(() {
        _activeIndex = _pageViewController.page!.round();
      });
    });

    final Size size = MediaQuery.of(context).size;
    return Consumer<PetProvider>(
      builder: (context, provider, child) => Scaffold(
        // Custom bottom navigation bar
        bottomNavigationBar: CustomBottomBar(pet: widget.pet),
        backgroundColor: Colors.grey[900],
        body: Stack(
          children: <Widget>[
            SizedBox(
              height: size.height * .6,
              // PageView to display the images of the pet
              child: PageView.builder(
                itemCount: widget.pet.images.length,
                controller: _pageViewController,
                itemBuilder: (context, index) {
                  return Hero(
                    tag: '${widget.pet.name}',
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      // Display the image
                      child: Image.asset(
                        widget.pet.images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Custom page slider
            CustomPageSlider(
              length: widget.pet.images.length,
              activeIndex: _activeIndex,
              //Slider that displays the active index of image
            ),
            // Display the details of the pet
            DetailsPagePetDetails(pet: widget.pet),
            const DetailsPageAppBar(),
            // const OwnerInfo(),
          ],
        ),
      ),
    );
  }
}
