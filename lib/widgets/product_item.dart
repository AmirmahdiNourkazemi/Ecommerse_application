import 'package:flutter/material.dart';

import '../constanse/const.dart';

class productItem extends StatelessWidget {
  const productItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
