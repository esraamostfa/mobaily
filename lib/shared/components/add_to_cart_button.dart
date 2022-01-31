import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobaily/models/product_model.dart';
import 'package:mobaily/shared/cubit/cubit.dart';

class AddToCartButton extends StatelessWidget {
  final ProductModel product;

  const AddToCartButton(
      this.product,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        var cubit = AppCubit.get(context);
        cubit.setInCart(product);
        final snackBar = SnackBar(
          content: product.inCart
              ? Text("You added ${product.name} in cart")
              : Text(
              "You removed ${product.name} from cart"),
          action: SnackBarAction(
            label: "UNDO",
            onPressed: () {
              cubit.setInCart(product);
            },
          ),
        );

        ScaffoldMessenger.of(context)
            .showSnackBar(snackBar);
      },
      icon: Icon(
        product.inCart
            ? Icons.shopping_cart
            : Icons.add_shopping_cart_rounded,
        color: Colors.blue,
        size: 25,
      ),
    );;
  }
}
