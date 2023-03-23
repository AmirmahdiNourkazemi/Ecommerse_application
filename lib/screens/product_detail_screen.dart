import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/bloc/products/product_bloc.dart';
import 'package:mobile_shop/bloc/products/product_state.dart';
import 'package:mobile_shop/cached_image.dart';
import 'package:mobile_shop/constanse/const.dart';
import 'package:mobile_shop/constant/color.dart';
import 'package:mobile_shop/data/model/product_image.dart';
import 'package:mobile_shop/data/model/product_variant.dart';
import 'package:mobile_shop/data/model/properties.dart';
import 'package:mobile_shop/data/model/varient_type.dart';

import '../bloc/products/product_event.dart';
import '../data/model/product.dart';
import '../data/model/varient.dart';

class ProductDetailScreen extends StatefulWidget {
  Products products;
  ProductDetailScreen(this.products, {Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(ProductGetInitializedData(
        widget.products.id, widget.products.categoryId));
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
                  if (state is ProductDetailResponseState) ...{
                    SliverToBoxAdapter(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 44, vertical: 20),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.asset('assets/images/apple_logo.png'),
                                Expanded(
                                  child: state.getCategoryProduct.fold(
                                    (l) {
                                      return Text(l);
                                    },
                                    (productCategory) {
                                      return Text(
                                        productCategory.title ?? 'دسته بندی',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'SB',
                                          fontSize: 16,
                                          color: Color(0xff3B5EDF),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    return Navigator.pop(context);
                                  },
                                  child: Image.asset(
                                      'assets/images/back_icon.png'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  },
                  SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        widget.products.name,
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
                        return GalleryWidget(r, widget.products.thumbnail);
                      },
                    )
                  },
                  if (state is ProductDetailResponseState) ...{
                    state.productVarient.fold(
                      (l) {
                        return SliverToBoxAdapter(
                          child: Text(l),
                        );
                      },
                      (productVarientList) {
                        return VarientContainerGenarator(productVarientList);
                      },
                    )
                  },
                  if (state is ProductDetailResponseState) ...{
                    state.getProductProperties.fold(
                        (l) => SliverToBoxAdapter(
                              child: Text(l),
                            ), (propertiesList) {
                      return GetProperties(propertiesList);
                    })
                  },
                  ProductDescription(widget.products.description),
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
                                      ),
                                    ),
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
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
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

class GetProperties extends StatefulWidget {
  List<Properties> _listProperties;
  GetProperties(
    this._listProperties, {
    Key? key,
  }) : super(key: key);

  @override
  State<GetProperties> createState() => _GetPropertiesState();
}

class _GetPropertiesState extends State<GetProperties> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 44, vertical: 20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
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
                        style: TextStyle(fontSize: 12, fontFamily: 'SB'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Visibility(
              visible: _isVisible,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  width: 340,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget._listProperties.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Flexible(
                              child: Text(
                                '${widget._listProperties[index].title}:${widget._listProperties[index].value}',
                                style: TextStyle(
                                  overflow: TextOverflow.clip,
                                  fontFamily: 'SM',
                                  height: 1.8,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDescription extends StatefulWidget {
  String productDescription;
  ProductDescription(
    this.productDescription, {
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 44),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
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
                        style: TextStyle(fontSize: 12, fontFamily: 'SB'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Visibility(
                visible: _isVisible,
                child: Container(
                  width: 340,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26, width: 1),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.productDescription,
                      style:
                          TextStyle(fontFamily: 'SM', height: 2, fontSize: 14),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VarientContainerGenarator extends StatefulWidget {
  List<ProductVarient> productVarient;
  VarientContainerGenarator(this.productVarient, {super.key});

  @override
  State<VarientContainerGenarator> createState() =>
      _VarientContainerGenaratorState();
}

class _VarientContainerGenaratorState extends State<VarientContainerGenarator> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          for (var productVarient in widget.productVarient) ...{
            if (productVarient.varientList.isNotEmpty) ...{
              VarientWidgetGenerator(productVarient)
            }
          }
        ],
      ),
    );
  }
}

class VarientWidgetGenerator extends StatefulWidget {
  ProductVarient productVarient;
  VarientWidgetGenerator(this.productVarient, {super.key});

  @override
  State<VarientWidgetGenerator> createState() => _VarientWidgetGeneratorState();
}

class _VarientWidgetGeneratorState extends State<VarientWidgetGenerator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 44, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            widget.productVarient.varientType.title!,
            style: TextStyle(fontSize: 12, fontFamily: 'SB'),
          ),
          SizedBox(
            height: 10,
          ),
          if (widget.productVarient.varientType.type ==
              VarientTypeEnum.COLOR) ...{
            ColorVarient(widget.productVarient.varientList)
          },
          if (widget.productVarient.varientType.type ==
              VarientTypeEnum.STORAGE) ...{
            StorageVarientList(widget.productVarient.varientList)
          }
        ],
      ),
    );
  }
}

class ColorVarient extends StatefulWidget {
  List<Variant> varientList;
  ColorVarient(this.varientList, {super.key});

  @override
  State<ColorVarient> createState() => _ColorVarientState();
}

class _ColorVarientState extends State<ColorVarient> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 26,
        child: ListView.builder(
          itemCount: widget.varientList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            String categoryColor = 'ff${widget.varientList[index].value}';
            int hexColor = int.parse(categoryColor, radix: 16);
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  border: (selectedIndex == index)
                      ? Border.all(
                          color: CustomColors.blueIndicator,
                          width: 3,
                          strokeAlign: StrokeAlign.outside)
                      : Border.all(
                          color: Color(0xff858585),
                          width: 0.5,
                          strokeAlign: StrokeAlign.outside,
                        ),
                  color: Color(hexColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
                width: 26,
                height: 26,
              ),
            );
          },
        ),
      ),
    );
  }
}

class GalleryWidget extends StatefulWidget {
  List<ProductImage> productList;
  int seletedItem = 0;
  String? defaultProductThumnail;
  GalleryWidget(
    this.productList,
    this.defaultProductThumnail, {
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
            height: 322,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                      Image.asset(
                        'assets/images/icon_like_gray.png',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: CachedImage(
                    imageUrl: (widget.productList.isEmpty)
                        ? widget.defaultProductThumnail
                        : widget.productList[widget.seletedItem].imageUrl,
                    radious: 15,
                  ),
                ),
                if (widget.productList.isNotEmpty) ...{
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: SizedBox(
                      height: 70,
                      child: ListView.builder(
                        // reverse: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.productList.length,
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
                                  imageUrl: widget.productList[index].imageUrl,
                                  radious: 15,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                }
              ],
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
            GestureDetector(child: Image.asset('assets/images/back_icon.png'))
          ],
        ),
      ),
    ),
  );
}

class StorageVarientList extends StatefulWidget {
  List<Variant> storage;
  StorageVarientList(this.storage, {super.key});

  @override
  State<StorageVarientList> createState() => _StorageVarientListState();
}

class _StorageVarientListState extends State<StorageVarientList> {
  var selectedIndex = 0;
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 26,
        child: ListView.builder(
            itemCount: widget.storage.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    width: 74,
                    height: 26,
                    decoration: BoxDecoration(
                      border: (selectedIndex == index)
                          ? Border.all(
                              color: CustomColors.blueIndicator,
                              width: 3,
                              strokeAlign: StrokeAlign.outside)
                          : Border.all(
                              color: Color(0xff858585),
                              width: 0.5,
                              strokeAlign: StrokeAlign.outside,
                            ),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(widget.storage[index].value!),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
