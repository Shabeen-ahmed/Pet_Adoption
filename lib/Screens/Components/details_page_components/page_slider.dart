import 'package:flutter/material.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';
import 'package:nymble_labs_pet_adoption/Utils/kconstants.dart';

//Slider displayed on PetDetailPage indicating the image user is in.
class CustomPageSlider extends StatelessWidget {
  const CustomPageSlider(
      {super.key, required this.length, required this.activeIndex});
  final int length;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {

    return Align(
      // Align the child widget to the center of the screen
      alignment: Alignment.center,
      // Use the SliderIndicator to display the page slider
      child: SliderIndicator(
        activeIndex: activeIndex,
        length: length,
        // Icon for inactive pages
        indicator: const Icon(
          Icons.radio_button_unchecked,
          color: primaryColor,
          size: 20.0,
        ),
        // Icon for active page
        activeIndicator: const Icon(
          Icons.radio_button_checked,
          color: primaryColor,
          size: 20.0,
        ),
      ),
    );
  }
}
