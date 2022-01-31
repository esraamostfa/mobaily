import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobaily/models/product_model.dart';
import 'package:mobaily/shared/components/categories_list_view.dart';
import 'package:mobaily/shared/components/products_grid_view.dart';
import 'package:mobaily/shared/cubit/cubit.dart';
import 'package:mobaily/shared/cubit/states.dart';

class FeedScreen extends StatelessWidget {

  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
      },
      builder: (context, state) {

        var cubit = AppCubit.get(context);

        return FutureBuilder(
            future: cubit.getProducts(),
            builder: (context, AsyncSnapshot<List<ProductModel>> snapshot ){
            if(snapshot.connectionState == ConnectionState.done) {
              return ListView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                children: [
                  CategoriesListView(cubit.categoriesNames, cubit.categoriesImages),
                  const SizedBox(height: 9.0,),
                  ProductsGridView(snapshot.data?? [])
                ],);
            } else if(snapshot.hasError) {
              return(Text("Error"));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
            });
      },
    );
  }

}