import 'package:flutter/material.dart';
import 'package:nymble_labs_pet_adoption/Utils/kconstants.dart';
//AppBar of the page which
class DetailsPageAppBar extends StatelessWidget {
  const DetailsPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black87,
              Colors.transparent,
            ],
          ),),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
