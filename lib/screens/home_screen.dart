import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_shop/constanse/const.dart';
import 'package:mobile_shop/screens/home_screen.dart';
import 'package:mobile_shop/widgets/product_item.dart';
import 'package:mobile_shop/widgets/slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class shopHomeScreen extends StatefulWidget {
  const shopHomeScreen({Key? key}) : super(key: key);

  @override
  State<shopHomeScreen> createState() => _shopHomeScreenState();
}

class _shopHomeScreenState extends State<shopHomeScreen> {
  TextEditingController? textController;
  var controller = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffE5E5E5),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffE5E5E5),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: getSearchInput(),
              ),
              SliverToBoxAdapter(
                child: slider(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      EdgeInsets.only(right: 44, left: 44, top: 20, bottom: 10),
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
              ),
              SliverToBoxAdapter(
                child: listCategoryBuilder(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      EdgeInsets.only(right: 44, left: 44, top: 20, bottom: 10),
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
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: productItem(),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      EdgeInsets.only(right: 44, left: 44, top: 10, bottom: 10),
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
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: productItem(),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget listCategoryBuilder() {
  return Padding(
    padding: EdgeInsets.only(right: 44),
    child: SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 20),
            child: categoryHorizontalListView(),
          );
        },
      ),
    ),
  );
}

Column categoryHorizontalListView() {
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
                  color: Colors.red,
                  blurRadius: 25,
                  spreadRadius: -15,
                  offset: Offset(0.0, 15),
                )
              ],
              color: Colors.red,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          Icon(
            Icons.mouse,
            color: Colors.white,
            size: 29,
          )
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'همه',
        style: TextStyle(fontFamily: 'SB', fontSize: 17),
      )
    ],
  );
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
