import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobaily/screens/categories/category_products_screen.dart';
import 'package:mobaily/styles/colors.dart';

class CategoryItem extends StatelessWidget {

  final String categoryName;
  final String categoryImage;

  const CategoryItem(
      this.categoryName,
      this.categoryImage,
      {Key? key}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryProductsScreen(categoryName)
            )
        );
      },
      child: SizedBox(
        height: 199.0,
        width: 225,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image(
              image: AssetImage(categoryImage),
            height: 199,
            width: 225,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              color: Colors.blueGrey.withOpacity(0.7),
              width: 225.0,
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
