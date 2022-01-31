import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobaily/models/product_model.dart';
import 'package:mobaily/shared/components/category_item.dart';
import 'package:mobaily/styles/colors.dart';

class CategoriesListView extends StatelessWidget {

  final List<String> categoriesNames;
  final List<String> categoriesImages;
  const CategoriesListView(
      this.categoriesNames,
      this.categoriesImages,
      {Key? key}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      height: 199,
      color: Colors.blue[100],
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildCategoryItem(categoriesNames[index], categoriesImages[index]),
        itemCount: categoriesNames.length,
        separatorBuilder: (context, index) => const SizedBox(width: 5.0,),
      ),
    );
  }

  Widget buildCategoryItem(String categoryName, String categoryImage) => CategoryItem(categoryName, categoryImage);
}
