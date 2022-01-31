import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobaily/models/product_model.dart';
import 'package:mobaily/shared/components/products_grid_view.dart';
import 'package:mobaily/shared/cubit/cubit.dart';
import 'package:mobaily/shared/cubit/states.dart';

class CategoryProductsScreen extends StatelessWidget {

  final String category;

  const CategoryProductsScreen(
      this.category,
      {Key? key}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var cubit = AppCubit.get(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) { },
        builder: (context, state) {

          List<ProductModel> categoryProducts;

          if(category == 'Phones') {
            categoryProducts = cubit.phones;
          } else if (category == 'Headphones') {
            categoryProducts = cubit.headphones;
          } else {
            categoryProducts = cubit.accessories;
          }

          return  ProductsGridView(categoryProducts);
        },
      ),
    );
  }
}
