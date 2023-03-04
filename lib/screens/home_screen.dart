import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/bloc/home/home_bloc.dart';
import 'package:mobile_shop/bloc/home/home_event.dart';
import 'package:mobile_shop/bloc/home/home_state.dart';
import 'package:mobile_shop/bloc/products/product_bloc.dart';
import 'package:mobile_shop/cached_image.dart';
import 'package:mobile_shop/constanse/const.dart';
import 'package:mobile_shop/data/datasource/product_datasource.dart';
import 'package:mobile_shop/data/model/banner.dart';
import 'package:mobile_shop/screens/home_screen.dart';
import 'package:mobile_shop/widgets/product_item.dart';
import 'package:mobile_shop/widgets/slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../data/model/category.dart';
import '../data/model/product.dart';
import '../data/repository/banner_repository.dart';
import 'buyList_screen.dart';

class ShopHomeScreen extends StatefulWidget {
  const ShopHomeScreen({Key? key}) : super(key: key);

  @override
  State<ShopHomeScreen> createState() => _ShopHomeScreenState();
}

class _ShopHomeScreenState extends State<ShopHomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeGetInitializedData());
    super.initState();
  }

  TextEditingController? textController;
  var controller = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffE5E5E5),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffE5E5E5),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  if (state is HomeLoadingState) ...[
                    SliverToBoxAdapter(
                      child: Center(
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                  GetSearchBox(),
                  if (state is HomeRequestSuccesState) ...[
                    state.bannerList.fold(
                      (exeptionMessage) {
                        return SliverToBoxAdapter(
                          child: Text(exeptionMessage),
                        );
                      },
                      (listBanner) => _getBanners(listBanner),
                    )
                  ],
                  GetCategoryList(),
                  if (state is HomeRequestSuccesState) ...[
                    state.categoryList.fold(
                      (l) {
                        return SliverToBoxAdapter(
                          child: Text(l),
                        );
                      },
                      (categoryList) {
                        return GetCategoryBuilder(categoryList);
                      },
                    )
                  ],
                  GetBestSellerTitle(),
                  if (state is HomeRequestSuccesState) ...[
                    state.bestSellerProductList.fold((l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    }, (productList) {
                      return GetBestSellerProducts(productList);
                    })
                  ],
                  GetMostViewTitle(),
                  if (state is HomeRequestSuccesState) ...[
                    state.hotestProductList.fold((l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    }, (productList) {
                      return NetMostViewProducts(productList);
                    })
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class NetMostViewProducts extends StatelessWidget {
  List<Products> _productList;
  NetMostViewProducts(
    this._productList, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(right: 40),
        child: SizedBox(
          height: 250,
          child: ListView.builder(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: _productList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 20),
                child: productItem(_productList[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

class GetMostViewTitle extends StatelessWidget {
  const GetMostViewTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(right: 44, left: 44, top: 10, bottom: 10),
        child: Row(
          children: [
            Image.asset('assets/images/back_arrow.png'),
            SizedBox(
              width: 10,
            ),
            Text(
              'مشاهده بیشتر',
              style: TextStyle(
                color: Color(0xff3B5EDF),
                fontFamily: 'SM',
                fontSize: 12,
              ),
            ),
            Spacer(),
            Text(
              'پر بازدید ترین ها',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GetBestSellerProducts extends StatelessWidget {
  List<Products> _productList;
  GetBestSellerProducts(
    this._productList, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(right: 40),
        child: SizedBox(
          height: 250,
          child: GestureDetector(
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
            child: ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: _productList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: productItem(_productList[index]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class GetBestSellerTitle extends StatelessWidget {
  const GetBestSellerTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(right: 44, left: 44, top: 20, bottom: 10),
        child: Row(
          children: [
            Image.asset('assets/images/back_arrow.png'),
            SizedBox(
              width: 10,
            ),
            Text(
              'مشاهده بیشتر',
              style: TextStyle(
                color: Color(0xff3B5EDF),
                fontFamily: 'SM',
                fontSize: 12,
              ),
            ),
            Spacer(),
            Text(
              'پرفروش ترین ها',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GetCategoryList extends StatelessWidget {
  const GetCategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(right: 44, left: 44, top: 20, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'دسته بندی',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GetSearchBox extends StatelessWidget {
  const GetSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: getSearchInput(),
    );
  }
}

class _getBanners extends StatelessWidget {
  List<BannerCampain> bannerCampain;
  _getBanners(
    this.bannerCampain, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GetSlider(bannerCampain),
    );
  }
}

class GetCategoryBuilder extends StatelessWidget {
  List<Category> _categoryList;
  GetCategoryBuilder(this._categoryList, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(right: 44),
        child: SizedBox(
          height: 90,
          child: ListView.builder(
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: _categoryList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 20),
                child: CategoryHorizantalListview(_categoryList[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CategoryHorizantalListview extends StatelessWidget {
  final Category _category;
  CategoryHorizantalListview(this._category, {super.key});

  @override
  Widget build(BuildContext context) {
    String categoryColor = 'ff${_category.color}';
    int hexColor = int.parse(categoryColor, radix: 16);
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: ShapeDecoration(
                shadows: [
                  BoxShadow(
                    color: Color(hexColor),
                    blurRadius: 25,
                    spreadRadius: -15,
                    offset: Offset(0.0, 15),
                  )
                ],
                color: Color(hexColor),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            SizedBox(
              height: 30,
              child: CachedImage(
                imageUrl: _category.icon,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          _category.title!,
          style: TextStyle(fontFamily: 'SB', fontSize: 15),
        )
      ],
    );
  }
}

ListView getBannerBuilder() {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 3,
    itemBuilder: (context, index) {
      return Container(
        width: 340,
        height: 177,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/banner.png'),
        ),
      );
    },
  );
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
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text(
                        'جستجو محصولات',
                        style: TextStyle(
                          fontFamily: 'SM',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle: TextStyle(),
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Image.asset('assets/images/search_icon.png')
          ],
        ),
      ),
    ),
  );
}
