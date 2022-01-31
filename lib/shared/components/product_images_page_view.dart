import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobaily/models/product_model.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class ProductImagesPageView extends StatelessWidget {
  final ProductModel product;

   ProductImagesPageView(
       this.product,
       {Key? key}) : super(key: key);

  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildPageView(),
        _buildCircleIndicator(),
      ],
    );
  }

   _buildPageView() {
     return Container(
       color: Colors.white,
       height: 231.0,
       child: PageView.builder(
           itemCount: product.images.length,
           controller: _pageController,
           itemBuilder: (BuildContext context, int index) {
             return Center(
               child: Image(
                 image: NetworkImage(product.images[index]),
               ),
             );
           },
           onPageChanged: (int index) {
             _currentPageNotifier.value = index;
           }),
     );
   }

  _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          itemCount: product.images.length,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }

}
