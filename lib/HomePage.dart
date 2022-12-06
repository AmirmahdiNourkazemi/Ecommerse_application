import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      body: Column(
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
                      blurRadius: 30,
                      spreadRadius: -6,
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
          Text('data')
        ],
      ),
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
