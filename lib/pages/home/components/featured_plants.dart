import 'package:flutter/material.dart';
import 'package:plant_app_flutter_ui/theme.dart';

class FeaturedPlants extends StatelessWidget {
  const FeaturedPlants({
    required this.listOfFeaturedPlants,
  });

  final List<String> listOfFeaturedPlants;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 185,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listOfFeaturedPlants.length,
        itemBuilder: (context, index) => FeaturePlantCard(
          image: listOfFeaturedPlants[index],
          press: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Featured Plant Clicked',
                  style: TextStyle(color: primaryColor),
                ),
                duration: const Duration(milliseconds: 1000),
                width: size.width * 0.7, // Width of the SnackBar.
                padding: const EdgeInsets.symmetric(
                  horizontal: 18, // Inner padding for SnackBar content.
                ),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: backgroundColor,
              ),
            );
          },
        ),
      ),
    );
  }
}

class FeaturePlantCard extends StatelessWidget {
  const FeaturePlantCard({
    required this.image,
    required this.press,
  });

  final String image;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        width: size.width * 0.8,
        height: 185,
        margin: EdgeInsets.only(
          left: defaultPadding,
          top: defaultPadding / 2,
          bottom: defaultPadding / 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
