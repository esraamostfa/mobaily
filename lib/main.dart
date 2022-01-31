import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobaily/shared/cubit/bloc_observer.dart';
import 'package:mobaily/shared/cubit/cubit.dart';
import 'package:mobaily/shared/cubit/states.dart';
import 'package:mobaily/styles/themes.dart';
import 'layouts/home_layout.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();
  //DioHelper.init();

  //await CacheHelper.init();


  runApp(const MobailyApp());
}

class MobailyApp extends StatelessWidget {
  const MobailyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => AppCubit()..getProducts()..getCategoriesProducts()..getFavourites()..getInCart(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
        } ,
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            home:const HomeLayout()
          );
        },
      ),
    );
  }
}
