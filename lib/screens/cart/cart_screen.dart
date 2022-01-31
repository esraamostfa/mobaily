import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobaily/shared/components/products_grid_view.dart';
import 'package:mobaily/shared/cubit/cubit.dart';
import 'package:mobaily/shared/cubit/states.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
      },
      builder: (context, state) {

        var cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text("Cart"),
          ),
          body: ProductsGridView(cubit.inCartProducts)
        );
      },
    );
  }
}
