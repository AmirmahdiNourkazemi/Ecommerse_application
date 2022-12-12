import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile_shop/constanse/const.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffE5E5E5),
      child: Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: getSearchInput(),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'آیفون SE 2022',
                    style: TextStyle(fontFamily: 'SB', fontSize: 16),
                  ),
                ),
              ),
              SliverToBoxAdapter(
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
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
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
                          Image.asset(
                            'assets/images/iphoneSE2022.png',
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                    'assets/images/iphoneSE2022Ex1.png'),
                                SizedBox(
                                  width: 20,
                                ),
                                Image.asset(
                                    'assets/images/iphoneSE2022EX2.png'),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'assets/images/iphoneSE2022.png',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'انتخاب رنگ',
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
                              border: Border.all(
                                  color: Color(0xff858585), width: 0.5),
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
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xff858585), width: 0.5),
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
              ),
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
                  padding: EdgeInsets.symmetric(horizontal: 44, vertical: 20),
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
                            style: TextStyle(fontSize: 12, fontFamily: 'SB'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44, vertical: 20),
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
                            style: TextStyle(fontSize: 12, fontFamily: 'SB'),
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
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 53,
                                width: 160,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
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
                                              decoration:
                                                  TextDecoration.lineThrough,
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
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 53,
                                width: 160,
                                child: Center(
                                  child: Text(
                                    'افزودن به سبد خرید',
                                    style: TextStyle(
                                        color: Colors.white, fontFamily: 'SB'),
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
        ),
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
