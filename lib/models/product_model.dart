class ProductModel {
  late String id;
  late String name;
  late List<dynamic> images;
  late dynamic price;
  late dynamic oldPrice;
  late dynamic discount;
  late bool inFavorites;
  late bool inCart;
  late String category;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    images = json['images'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
    category = json['category'];
  }
}