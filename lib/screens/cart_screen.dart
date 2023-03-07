import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/bloc/products/product_bloc.dart';
import 'package:mobile_shop/bloc/products/product_state.dart';
import 'package:mobile_shop/cached_image.dart';
import 'package:mobile_shop/constanse/const.dart';
import 'package:mobile_shop/data/model/product_image.dart';
import 'package:mobile_shop/data/model/varient_type.dart';
import 'package:mobile_shop/data/repository/product_detail_repository.dart';
import 'package:mobile_shop/di/di.dart';

import '../bloc/products/product_event.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);
  var selectedItem = 0;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(ProductGetInitializedData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffE5E5E5),
      child: Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            return SafeArea(
              child: CustomScrollView(
                slivers: [
                  if (state is ProductDetailLoadingState) ...[
                    SliverToBoxAdapter(
                      child: Center(
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                  ],
                  SliverToBoxAdapter(
                    child: getSearchInput(),
                  ),
                  SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        '',
                        style: TextStyle(fontFamily: 'SB', fontSize: 16),
                      ),
                    ),
                  ),
                  if (state is ProductDetailResponseState) ...{
                    state.getImageProduct.fold(
                      (l) {
                        return Text(l);
                      },
                      (r) {
                        return GalleryWidget(r);
                      },
                    )
                  },
                  if (state is ProductDetailResponseState) ...{
                    state.productVarient.fold((l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    }, (varientList) {
                      for (var varient in varientList) {
                        print(varient.varientType.title);
                        for (var object in varient.varientList) {
                          print(object.priceChange);
                        }
                      }
                      return SliverToBoxAdapter(
                        child: Text('data'),
                      );
                    })
                  },
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 44),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'انتخاب حافظه داخلی',
                            style: TextStyle(fontSize: 12, fontFamily: 'SB'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 74,
                                height: 26,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xff3B5EDF),
                                    width: 2.0,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: Center(child: Text('128')),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 74,
                                height: 26,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xff3B5EDF),
                                    width: 2.0,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: Center(child: Text('256')),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 74,
                                height: 26,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xff3B5EDF),
                                    width: 2.0,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: Center(child: Text('512')),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 44, vertical: 20),
                      child: Container(
                        width: 340,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/images/forward_icon.png'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'مشاهده',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'SB',
                                      color: Color(0xff3B5EDF),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                ':مشخصات فنی',
                                style:
                                    TextStyle(fontSize: 12, fontFamily: 'SB'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 44),
                      child: Container(
                        width: 340,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/images/forward_icon.png'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'مشاهده',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'SB',
                                      color: Color(0xff3B5EDF),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                ':توضیحات محصول',
                                style:
                                    TextStyle(fontSize: 12, fontFamily: 'SB'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 44, vertical: 20),
                      child: Container(
                        width: 340,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/images/forward_icon.png'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'مشاهده',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'SB',
                                      color: Color(0xff3B5EDF),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 60),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xff858585),
                                        width: 0.5,
                                      ),
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    width: 26,
                                    height: 26,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 45),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xff858585), width: 0.5),
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    width: 26,
                                    height: 26,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 30),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xff858585),
                                        width: 0.5,
                                      ),
                                      color: Colors.green,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    width: 26,
                                    height: 26,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xff858585),
                                        width: 0.5,
                                      ),
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    width: 26,
                                    height: 26,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xff858585),
                                        width: 0.5,
                                      ),
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    width: 26,
                                    height: 26,
                                    child: Center(
                                        child: Text(
                                      '+10',
                                      style: TextStyle(fontFamily: 'SB'),
                                    )),
                                  )
                                ],
                              ),
                              Text(
                                ':نظرات کاربران',
                                style:
                                    TextStyle(fontSize: 12, fontFamily: 'SB'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 74,
                              width: 140,
                              decoration: BoxDecoration(
                                color: ColorPicker.green,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              bottom: 0,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    height: 53,
                                    width: 160,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'تومان',
                                            style: TextStyle(
                                              fontFamily: 'SM',
                                              color: Colors.white,
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '۴۶٬۰۰۰٬۰۰۰',
                                                style: TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: Colors.white,
                                                  fontFamily: 'SM',
                                                ),
                                              ),
                                              Text(
                                                '۴۵٬۳۵۰٬۰۰۰',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'SM',
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: 25,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              color: ColorPicker.redLight,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                            ),
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                  top: 2,
                                                  left: 5,
                                                ),
                                                child: Text(
                                                  '%۵',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'SM',
                                                    fontSize: 10,
                                                  ),
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              child: Container(
                                height: 60,
                                width: 140,
                                decoration: BoxDecoration(
                                  color: ColorPicker.blue,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              bottom: 0,
                              child: GestureDetector(
                                onTap: () async {
                                  IDetailRepository repository = locator.get();
                                  var response =
                                      await repository.getProductImage();
                                  response.fold((l) {
                                    print(l);
                                  }, (r) {
                                    r.forEach((element) {
                                      print(element.imageUrl);
                                    });
                                  });
                                },
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 10),
                                    child: Container(
                                      height: 53,
                                      width: 160,
                                      child: Center(
                                        child: Text(
                                          'افزودن به سبد خرید',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'SB'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class colorVarient extends StatelessWidget {
  VarientType varientType;
  colorVarient(
    this.varientType, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 44, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              varientType.title!,
              style: TextStyle(fontSize: 12, fontFamily: 'SB'),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff858585), width: 0.5),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  width: 26,
                  height: 26,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff858585), width: 0.5),
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  width: 26,
                  height: 26,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff858585), width: 0.5),
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  width: 26,
                  height: 26,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class GalleryWidget extends StatefulWidget {
  List<ProductImage> _productList;
  var seletedItem = 0;
  GalleryWidget(
    this._productList, {
    Key? key,
  }) : super(key: key);

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: 340,
            height: 282,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Visibility(
              visible: true,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/star_icon.png',
                              ),
                              SizedBox(
                                width: 10,
                                height: 18,
                              ),
                              Text('4.6'),
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/images/icon_like_gray.png',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 140,
                    width: 150,
                    child: CachedImage(
                      imageUrl:
                          widget._productList[widget.seletedItem].imageUrl,
                      radious: 15,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Container(
                      height: 70,
                      child: ListView.builder(
                        reverse: true,
                        itemCount: widget._productList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.seletedItem = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: CachedImage(
                                  imageUrl: widget._productList[index].imageUrl,
                                  radious: 15,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget getSearchInput() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 44, vertical: 20),
    child: Container(
      height: 46,
      width: 340,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset('assets/images/apple_logo.png'),
            SizedBox(
              width: 120,
            ),
            Text(
              'آیفون',
              style: TextStyle(
                fontFamily: 'SB',
                fontSize: 16,
                color: Color(0xff3B5EDF),
              ),
            ),
            SizedBox(
              width: 100,
            ),
            Image.asset('assets/images/back_icon.png')
          ],
        ),
      ),
    ),
  );
}
