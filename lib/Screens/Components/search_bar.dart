import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nymble_labs_pet_adoption/Utils/kconstants.dart';
import 'package:provider/provider.dart';
import 'package:nymble_labs_pet_adoption/Provider/category_provider.dart';
//Search Bar
class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: (value) {
          Provider.of<CategoryProvider>(context, listen: false)
              .searchText = value;
        },
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search, color: primaryColor),
            labelText: "Search pets",
            labelStyle:
                GoogleFonts.montserrat(color: primaryColor, fontSize: 16)));
  }
}
