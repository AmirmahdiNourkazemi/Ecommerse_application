import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/bloc/categoryProduct/category_product_bloc.dart';
import 'package:mobile_shop/bloc/categoryProduct/category_product_event.dart';
import 'package:mobile_shop/data/model/category.dart';
import 'package:mobile_shop/widgets/product_item.dart';

import '../bloc/categoryProduct/category_product_state.dart';

class CategoryFilter extends StatefulWidget {
  Category _category;
  CategoryFilter(this._category, {Key? key}) : super(key: key);

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  @override
  void initState() {
    BlocProvider.of<CategoryProductBloc>(context)
        .add(CategoryProductInitializa(widget._category.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryProductBloc, CategoryProductState>(
      builder: (context, state) {
        return Container(
          color: Color(0xffE5E5E5),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Color(0xffE5E5E5),
              body: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: getSearchInput(context, widget._category.title!),
                  ),
                  if (state is CategoryProductResponseSuccessState) ...{
                    state.productListByCategory.fold(
                      (l) => SliverToBoxAdapter(
                        child: Text(l),
                      ),
                      (productList) => SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return ProductItem(productList[index]);
                            },
                            childCount: productList.length,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            childAspectRatio: 0.8,
                          ),
                        ),
                      ),
                    )
                  }
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget getSearchInput(context, String categoryTitle) {
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
            Expanded(
              child: Text(
                categoryTitle,
                style: TextStyle(
                    fontFamily: 'SB', fontSize: 16, color: Color(0xff3B5EDF)),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/images/back_icon.png',
              ),
            )
          ],
        ),
      ),
    ),
  );
}
