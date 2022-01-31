//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobaily/models/product_model.dart';
import 'package:mobaily/screens/categories/categories_screen.dart';
import 'package:mobaily/screens/favourites/favourites_screen.dart';
import 'package:mobaily/screens/feed/feed_screen.dart';
import 'package:mobaily/screens/profile/profile_screen.dart';
import 'package:mobaily/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomNavItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_filled),
      label: '',),
    const BottomNavigationBarItem(
      icon: Icon(Icons.category_outlined),
      label: '',),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border_outlined),
      label: '',),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: '',),
  ];

  void changeBottomNavIndex(int index) {
    currentIndex = index;
    emit(AppBottomNaveState());
  }

  List<Widget> screens = [
    const FeedScreen(),
    const CategoriesScreen(),
    const FavouritesScreen(),
    const ProfileScreen()
  ];

  List<String> categoriesNames = ["Phones", "Headphones", "Accessories" ];
  List<String> categoriesImages = ["assets/images/phones.jpg", "assets/images/headphones.jpg", "assets/images/accessories.jpg" ];


  Future<List<ProductModel>> getProducts() async {

    var productsData = await FirebaseFirestore.instance
        .collection('products')
        .get();

    List<ProductModel> products = [];

    for(var productDoc in productsData.docs) {
      products.add(ProductModel.fromJson(productDoc.data()));
    }

    return products;

  }

  // Future<List<ProductModel>> getProducts() async {
  //
  //   emit(GetProductsLoadingState());
  //
  //   List<ProductModel> products = [];
  //
  //   FirebaseFirestore.instance
  //       .collection('products')
  //       .get()
  //       .then((value){
  //     emit(GetProductsSuccessState());
  //
  //     for(var productElement in value.docs) {
  //       products.add(ProductModel.fromJson(productElement.data()));
  //     }
  //   })
  //       .catchError((error) {
  //     print(error.toString());
  //     emit(GetProductsErrorState(error.toString()));
  //   });
  //
  //   return products;
  //
  // }

  List<ProductModel> favourites = [];
  
  void getFavourites() {
    FirebaseFirestore.instance.collection("products").where("in_favorites", isEqualTo: true).get().then((value) {
      for(var query in value.docs) {
        favourites.add(ProductModel.fromJson(query.data()));
      }
    });
  }

  void setFavorite(ProductModel product) {
    product.inFavorites = !product.inFavorites;
    emit(ChangeFavoriteState());

    FirebaseFirestore.instance.collection("products").doc(product.id).update(
        {"in_favorites" : product.inFavorites}
        ).then((value) {
      if(product.inFavorites == true) {
        favourites.add(product);
      } else {
        favourites.removeWhere((element) => element.id == product.id);
      }
          print("favorites were updated successfully");
    }).catchError((error) {
      print("failed to update favorites");
      print(error.toString());
    });

  }

  List<ProductModel> inCartProducts = [];

  void getInCart() {
    FirebaseFirestore.instance.collection("products").where("in_cart", isEqualTo: true).get().then((value) {
      for(var query in value.docs) {
        inCartProducts.add(ProductModel.fromJson(query.data()));
      }
    });
  }

  void setInCart(ProductModel product) {
    product.inCart = !product.inCart;
    emit(ChangeInCartState());

    FirebaseFirestore.instance.collection("products").doc(product.id).update(
        {"in_cart" : product.inCart}
    ).then((value) {
      if(product.inCart == true) {
        inCartProducts.add(product);
      } else {
        inCartProducts.removeWhere((element) => element.id == product.id);
      }
    }).catchError((error) {
      print(error.toString());
    });

  }

  List<ProductModel> phones = [];
  List<ProductModel> headphones = [];
  List<ProductModel> accessories = [];

  getCategoriesProducts() async {
    List<ProductModel> products = await getProducts();

    for (var element in products) {
      if(element.category == 'phones') phones.add(element);
      if(element.category == 'headphones') headphones.add(element);
      if(element.category == 'accessories') accessories.add(element);
    }
  }


}