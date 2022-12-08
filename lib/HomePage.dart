import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_shop/constanse/const.dart';
import 'package:mobile_shop/widgets/slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? textController;
  var controller = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          height: 140,
                          width: 79,
                          child: Image.asset(
                            'assets/images/iphone-13-pro-max-silver-select 1.png',
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
                            '٪۳',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SM',
                              fontSize: 10,
                            ),
                          )),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10, bottom: 3),
                    child: Text(
                      'آیفون ۱۳ پرومکس',
                      style: TextStyle(fontSize: 14, fontFamily: 'SB'),
                    ),
                  )
                ],
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
                          '۴۶٬۰۰۰٬۰۰۰',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
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
                    Image.asset('assets/images/arrow2.png')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding listCategoryBuilder() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 20),
            child: categoryHorizontalListView(),
          );
        },
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
      padding: EdgeInsets.only(top: 52, left: 44),
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
}
