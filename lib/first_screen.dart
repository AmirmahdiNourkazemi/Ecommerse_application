import 'package:flutter/material.dart';
import 'package:mobile_shop/HomePage.dart';
import 'package:mobile_shop/main.dart';

class firstPage extends StatefulWidget {
  const firstPage({Key? key}) : super(key: key);

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff58AEE8), Color(0xff3B5EDF)],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(),
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                Center(
                  child: Container(
                    height: 340,
                    width: 340,
                    child: Image(
                      image: AssetImage('assets/images/Group 1.png'),
                    ),
                  ),
                ),
                Positioned(
                  right: 171,
                  bottom: 137,
                  left: 170,
                  top: 100,
                  child: Container(
                    height: 100,
                    width: 84,
                    child: Image.asset('assets/images/logo_Apple.png'),
                  ),
                )
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: 516,
                  width: 516,
                  child: Image.asset('assets/images/pattern1.png'),
                ),
                Positioned(
                  top: 100,
                  right: 50,
                  bottom: 100,
                  left: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'اوج هیجان',
                        style: TextStyle(
                          fontFamily: 'SM',
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'باخرید محصولات',
                        style: TextStyle(
                          fontFamily: 'SM',
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '!! اپل',
                        style: TextStyle(
                          fontFamily: 'SM',
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff253DEE),
                          ),
                          child: Image.asset('assets/images/arrow1.png'),
                        ),
                        onTap: () {
                          print('object');
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) {
                                return HomeScreen();
                              }),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 47,
                  child: Column(
                    children: [
                      Text(
                        'From',
                        style: TextStyle(
                          fontFamily: 'SM',
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Amirmahdi',
                        style: TextStyle(
                          fontFamily: 'SM',
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
