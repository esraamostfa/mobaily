import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobaily/models/product_model.dart';
import 'package:mobaily/shared/components/add_to_cart_button.dart';
import 'package:mobaily/shared/components/favourite_button.dart';
import 'package:mobaily/shared/components/product_images_page_view.dart';
import 'package:mobaily/shared/components/search_box.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsScreen(
      this.product,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (
        const SearchBox()
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  color: Colors.white,
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),),
                        Row(
                          children: const [
                            Icon(
                              Icons.star_border,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star_border,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star_border,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star_border,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star_border,
                              color: Colors.amber,
                            ),
                            Text("0")
                          ],)
                      ],
                    ),
                    ProductImagesPageView(product),
                    const SizedBox(height: 11.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Price:",
                              style: TextStyle(
                                  fontSize: 25.5,
                                  color: Colors.redAccent
                              ),),
                            const SizedBox(width: 15.0,),
                            Text("${product.price.toString()} EGP",
                            style: const TextStyle(
                              fontSize: 25.0
                            ),),
                        ],),
                        Row(
                          children: [
                            FavouriteButton(product),
                            const SizedBox(width: 15.0,),
                            AddToCartButton(product),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
