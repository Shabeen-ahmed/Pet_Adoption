import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nymble_labs_pet_adoption/Utils/common widgets/border_box.dart';
import 'package:nymble_labs_pet_adoption/Utils/kconstants.dart';
import 'package:nymble_labs_pet_adoption/Utils/sample_data.dart';
import 'package:nymble_labs_pet_adoption/Utils/common%20widgets/spacing.dart';
import 'package:provider/provider.dart';
import 'package:nymble_labs_pet_adoption/Provider/category_provider.dart';

//Categories selection row that filters pets according to their species
class Categories extends StatefulWidget {
  const Categories({super.key,});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;  //assigns true to 'isDarkMode' if the system theme is set to dark mode
    final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    return Container(
        decoration: BoxDecoration(
            color: isDarkMode?primaryColor:Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(),
            boxShadow: myShadow
        ),
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(

      decoration: BoxDecoration(
          color: isDarkMode?const Color(0xFF262626):Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(),
          boxShadow: myShadow
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 27,right: 2,top: 20,bottom: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: categories.map((category) {
            return GestureDetector(
              onTap: () {
                if (categoryProvider.selectedCategory == category['name']) return; // check if the selected category is already selected
                setState(() {
                  for (var i = 0; i < categories.length; i++) {
                    categories[i]['active'] = (categories[i]['name'] == category['name']); //activates the category thats chosen and deactivates the rest
                  }
                  categoryProvider.selectedCategory = category['name']; // use the provider's setter method
                });
              },
              child: Container(   //Creates a containers for each pet category
                margin: const EdgeInsets.only(right: 15.0, left: 10),
                child: Column(
                  children: <Widget>[
                    BorderBox(
                      color: category['active'] ? primaryColor : isDarkMode?const Color(0xFF262626):Colors.white,
                      padding: const EdgeInsets.all(8.0),
                      width: 65.0,
                      height: 65.0,
                      child: Image(
                        image: AssetImage('${category["icon"]}'),
                        fit: BoxFit.contain,
                        color: category['active'] ? isDarkMode?const Color(0xFF262626):Colors.white : primaryColor,
                      ),
                    ),
                    addVerticalSpace(12.0),
                    Text(category['name'],
                        style: GoogleFonts.montserrat(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: primaryColor,
                        ))
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
      )
    )));
  }
}
