import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobaily/models/product_model.dart';
import 'package:mobaily/shared/components/products_grid_view.dart';
import 'package:mobaily/shared/cubit/cubit.dart';
import 'package:mobaily/shared/cubit/states.dart';

class FavouritesScreen extends StatelessWidget {

  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
      },
      builder: (context, state) {

        var cubit = AppCubit.get(context);

        return ProductsGridView(cubit.favourites);
      },
    );
  }
}
