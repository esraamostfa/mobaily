import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobaily/models/product_model.dart';
import 'package:mobaily/shared/cubit/cubit.dart';

class FavouriteButton extends StatelessWidget {
  final ProductModel product;
  const FavouriteButton(
      this.product,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        var cubit = AppCubit.get(context);
        cubit.setFavorite(product);
        final snackBar = SnackBar(
          content: product.inFavorites
              ? Text("You added ${product.name} in favorites")
              : Text(
              "You removed ${product.name} from favorites"),
          action: SnackBarAction(
            label: "UNDO",
            onPressed: () {
              cubit.setFavorite(product);
            },
          ),
        );

        ScaffoldMessenger.of(context)
            .showSnackBar(snackBar);
      },
      icon: Icon(
        product.inFavorites
            ? Icons.favorite
            : Icons.favorite_border,
        color: Colors.red,
        size: 25,
      ),
    );
  }
}
