import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/cached_image.dart';
import 'package:mobile_shop/data/model/product.dart';

import '../bloc/products/product_bloc.dart';
import '../constanse/const.dart';
import '../screens/cart_screen.dart';

class productItem extends StatelessWidget {
  Products _products;
  productItem(
    this._products, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return BlocProvider(
                    create: ((context) => ProductBloc()),
                    child: CartScreen(),
                  );
                },
              ),
            );
          },
          child: Container(
            height: 163,
            width: 160,
            decoration: BoxDecoration(
              color: ColorPicker.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Center(
                        child: Container(
                          height: 130,
                          width: 120,
                          child: CachedImage(
                            imageUrl: _products.thumbnail,
                            radious: 10,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Image.asset('assets/images/icon_like.png'),
                    ),
                    Positioned(
                      left: 10,
                      bottom: 10,
                      child: Container(
                        height: 15,
                        width: 25,
                        decoration: BoxDecoration(
                          color: ColorPicker.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(7.5),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${_products.persent?.round().toString()}%',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SM',
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Text(
                    _products.name,
                    softWrap: true,
                    maxLines: 1,
                    style: TextStyle(fontSize: 14, fontFamily: 'SB'),
                    //overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 53,
          width: 160,
          decoration: BoxDecoration(
            color: ColorPicker.blue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'تومان',
                  style: TextStyle(
                    fontFamily: 'SM',
                    color: Colors.white,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _products.price.toString(),
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.white,
                        fontFamily: 'SM',
                      ),
                    ),
                    Text(
                      _products.realPrice.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SM',
                      ),
                    ),
                  ],
                ),
                Image.asset('assets/images/arrow2.png')
              ],
            ),
          ),
        ),
      ],
    );
  }
}
