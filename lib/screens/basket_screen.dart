import 'package:flutter/material.dart';
import 'package:mobile_shop/constanse/const.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffE5E5E5),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffE5E5E5),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: getSearchInput()),
              SliverToBoxAdapter(
                  child: SizedBox(
                height: 900,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return basketContainerView();
                    }),
              ))
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: FloatingActionButton.extended(
              backgroundColor: ColorPicker.green,
              extendedPadding:
                  EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              onPressed: () {},
              label: Text(
                'ادامه فرآیند خرید',
                style: TextStyle(
                  fontFamily: 'SM',
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector floatingActionBotton() {
    return GestureDetector(
      onTap: () {
        print('object');
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 53,
            width: 340,
            margin: const EdgeInsets.symmetric(horizontal: 44, vertical: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorPicker.green,
              borderRadius: BorderRadius.circular(
                15,
              ),
            ),
            child: Center(
              child: Text(
                'ادامه فرآیند خرید',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'SB',
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class basketContainerView extends StatelessWidget {
  const basketContainerView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 44, vertical: 10),
      child: Container(
        height: 239,
        width: 340,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '...آیفون ۱۳ پرومکس دوسیم کا',
                      style: TextStyle(fontFamily: 'SM', fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'گارانتی 18 ماه مدیا پردازش',
                      style: TextStyle(
                        fontFamily: 'SM',
                        fontSize: 12,
                        color: Color(0xff858585),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 15,
                          width: 25,
                          decoration: BoxDecoration(
                            color: ColorPicker.redLight,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '٪۳',
                              style: TextStyle(
                                fontFamily: 'SM',
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'تومان',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 12,
                            color: Color(0xff858585),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '۴۶٬۰۰۰٬۰۰۰',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 12,
                            color: Color(0xff858585),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
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
                          width: 94,
                          height: 24,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/up-arrow.png',
                                  ),
                                  Image.asset(
                                    'assets/images/down-arrow.png',
                                  ),
                                ],
                              ),
                              Text(
                                'سبز کله غازی',
                                style: TextStyle(
                                  fontFamily: 'SM',
                                  fontSize: 10,
                                  color: Color(0xff858585),
                                ),
                              ),
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  color: Color(0xff004703),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xff858585), width: 0.5),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          width: 94,
                          height: 24,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/up-arrow.png',
                                  ),
                                  Image.asset(
                                    'assets/images/down-arrow.png',
                                  ),
                                ],
                              ),
                              Text(
                                'گیگابایت ۲۵۶ ',
                                style: TextStyle(
                                  fontFamily: 'SM',
                                  fontSize: 10,
                                  color: Color(0xff858585),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: Image.asset(
                    'assets/images/iphone-13-pro-max-silver-select 1.png',
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 120),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff858585),
                        width: 0.5,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    width: 69,
                    height: 24,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'ذخیره',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 10,
                            color: Color(0xff858585),
                          ),
                        ),
                        Container(
                          height: 15,
                          width: 15,
                          child: Image.asset('assets/images/trash_icon.png'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff858585),
                        width: 0.5,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    width: 62,
                    height: 24,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'ذخیره',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 10,
                            color: Color(0xff858585),
                          ),
                        ),
                        Container(
                          height: 15,
                          width: 15,
                          child: Image.asset('assets/images/icon_like.png'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff858585), width: 0.5),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    width: 45,
                    height: 24,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/up-arrow.png',
                            ),
                            Image.asset(
                              'assets/images/down-arrow.png',
                            ),
                          ],
                        ),
                        Text(
                          '1',
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 10,
                            color: Color(0xff858585),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(child: Image.asset('assets/images/line_seprator.png')),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'تومان',
                    style: TextStyle(fontFamily: 'SB'),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    ' ۴۵٬۳۵۰٬۰۰۰',
                    style: TextStyle(fontFamily: 'SB'),
                  ),
                ],
              ),
            )
          ],
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
              width: 100,
            ),
            Text(
              'سبد خرید',
              style: TextStyle(
                  fontFamily: 'SB', fontSize: 16, color: Color(0xff3B5EDF)),
            ),
          ],
        ),
      ),
    ),
  );
}
