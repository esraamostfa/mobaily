abstract class AppStates {}

class AppInitialState extends AppStates {}
class AppBottomNaveState extends AppStates {}

class AppChangeModeState extends AppStates {}

class GetProductsLoadingState extends AppStates {}
class GetProductsSuccessState extends AppStates {}
class GetProductsErrorState extends AppStates {
  String error;
  GetProductsErrorState(this.error);
}

class ChangeFavoriteState extends AppStates {}
class ChangeInCartState extends AppStates {}

class GetFavouritesLoadingState extends AppStates {}
class GetFavouritesSuccessState extends AppStates {}
class GetFavouritesErrorState extends AppStates {
  String error;
  GetFavouritesErrorState(this.error);
}