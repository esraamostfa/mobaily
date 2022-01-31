//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobaily/models/product_model.dart';
import 'package:mobaily/screens/product_details/product_details_screen.dart';
import 'package:mobaily/shared/components/favourite_button.dart';
import 'package:mobaily/shared/components/product_images_page_view.dart';
import 'package:mobaily/shared/cubit/cubit.dart';
import 'package:mobaily/styles/colors.dart';

class ProductsGridView extends StatelessWidget {
  final List<ProductModel> products;

  const ProductsGridView(
      this.products,
      {Key? key}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      primary: false,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 7.0,
        mainAxisSpacing: 7.0,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return buildProductItem(products[index], context);
      },
    );
  }

  Widget buildProductItem(ProductModel model, context) => GestureDetector(
    onTap: (){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(model)
          )
      );
    },
    child: Stack(children: [
          Container(
            padding: const EdgeInsets.all(9.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(7.0)),
            child: Column(
              children: [
                Expanded(
                  child: Image(
                    image: NetworkImage(model.images[0]),
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 7,),
                    Text(
                      model.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 19,
                        height: 1.3,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${model.price.round()}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 19, color: defaultColor),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        if (model.discount != 0)
                          Text(
                            '${model.oldPrice}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          ),
                        const Spacer(),
                        FavouriteButton(model)
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          if (model.discount != 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
              color: Colors.red,
              child: const Text(
                'DISCOUNT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
        ]),
  );
}
