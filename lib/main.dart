import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mobile_shop/first_screen.dart';
import 'package:mobile_shop/screens/basket_screen.dart';
import 'package:mobile_shop/screens/buyList_screen.dart';
import 'package:mobile_shop/screens/category_list_screen.dart';
import 'package:mobile_shop/screens/home_screen.dart';
import 'package:mobile_shop/screens/profile_Screen.dart';
import 'package:mobile_shop/screens/topSale_screen.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headline4: TextStyle(
            fontFamily: 'SM',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      home: Scaffold(
        body: IndexedStack(index: selectedIndex, children: getScreen()),
        bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 80, sigmaY: 70),
            child: BottomNavigationBar(
              unselectedLabelStyle: TextStyle(fontFamily: 'SB', fontSize: 10),
              selectedLabelStyle: TextStyle(fontFamily: 'SB', fontSize: 10),
              onTap: (int index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              currentIndex: selectedIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    child: Image.asset('assets/images/homeBottonNav.png'),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue,
                          blurRadius: 20,
                          spreadRadius: -7,
                          offset: Offset(0.0, 13),
                        )
                      ],
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Container(
                      child:
                          Image.asset('assets/images/HomeActiveBottonNav.png'),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0.0, 13),
                          )
                        ],
                      ),
                    ),
                  ),
                  label: 'خانه',
                ),
                BottomNavigationBarItem(
                    icon: Container(
                      child: Image.asset('assets/images/categoryBottonNav.png'),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0.0, 13),
                          )
                        ],
                      ),
                    ),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Container(
                        child: Image.asset(
                            'assets/images/categoryActiveBottonNav.png'),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue,
                              blurRadius: 20,
                              spreadRadius: -7,
                              offset: Offset(0.0, 13),
                            )
                          ],
                        ),
                      ),
                    ),
                    // icon: ,
                    label: 'دسته بندی'),
                BottomNavigationBarItem(
                    icon: Container(
                      child: Image.asset('assets/images/bagBottonNav.png'),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0.0, 13),
                          )
                        ],
                      ),
                    ),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Container(
                        child:
                            Image.asset('assets/images/ActivebagbottonNav.png'),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue,
                              blurRadius: 20,
                              spreadRadius: -7,
                              offset: Offset(0.0, 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // icon: ,
                    label: 'سبد خرید'),
                BottomNavigationBarItem(
                    icon: Container(
                      child: Image.asset('assets/images/profileBottonNav.png'),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0.0, 13),
                          )
                        ],
                      ),
                    ),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Container(
                        child: Image.asset(
                            'assets/images/profileActiveBottonNav.png'),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue,
                              blurRadius: 20,
                              spreadRadius: -7,
                              offset: Offset(0.0, 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                    label: 'حساب کاربری')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> getScreen() {
  return <Widget>[
    shopHomeScreen(),
    CategoryScreen(),
    BasketScreen(),
    ProfileScreen()
  ];
}
