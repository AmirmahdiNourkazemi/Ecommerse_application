import 'package:flutter/material.dart';
import 'package:mobile_shop/widgets/product_item.dart';

class TopSaleScreen extends StatelessWidget {
  const TopSaleScreen({Key? key}) : super(key: key);

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
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    ((context, index) {
                      return Text('data'); //productItem();
                    }),
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 2.7,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20),
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
              width: 100,
            ),
            Text(
              'پرفروش ترین ها',
              style: TextStyle(
                  fontFamily: 'SB', fontSize: 16, color: Color(0xff3B5EDF)),
            ),
          ],
        ),
      ),
    ),
  );
}
