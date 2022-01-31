import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobaily/screens/cart/cart_screen.dart';
import 'package:mobaily/shared/components/search_box.dart';
import 'package:mobaily/shared/cubit/cubit.dart';
import 'package:mobaily/shared/cubit/states.dart';


class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, status) {},
        builder: (context, status) {

          var cubit = AppCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: const SearchBox(),
              actions: [
                IconButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()
                      )
                  );
                },
                    icon: const Icon(
                        Icons.shopping_cart,
                      color: Colors.white,
                    )
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomNavItems,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavIndex(index);
              },
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        }
    );
  }
}
