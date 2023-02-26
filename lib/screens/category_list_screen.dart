import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/bloc/category/category_bloc.dart';
import 'package:mobile_shop/bloc/category/category_state.dart';
import 'package:mobile_shop/cached_image.dart';
import 'package:mobile_shop/data/model/category.dart';
import 'package:mobile_shop/data/repository/category_repository.dart';

import '../bloc/category/category_event.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Category>? list;
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(CategoryRequestList());
    super.initState();
  }

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
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: ((context, state) {
                  if (state is CategoryLoadingState) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is CategoryResponseState) {
                    return state.response.fold(
                      (l) {
                        return SliverToBoxAdapter(child: Text(l));
                      },
                      (r) {
                        return _ListContainer(
                          list: r,
                        );
                      },
                    );
                  }
                  return SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }),
              ),
              //  _ListContainer(list: list)
            ],
          ),
        ),
      ),
    );
  }
}

class _ListContainer extends StatelessWidget {
  List<Category>? list;
  _ListContainer({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 44),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          ((context, index) {
            return CachedImage(imageUrl: list?[index].thumbnail);
          }),
          childCount: list?.length ?? 0,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
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
              'دسته بندی',
              style: TextStyle(
                  fontFamily: 'SB', fontSize: 16, color: Color(0xff3B5EDF)),
            ),
          ],
        ),
      ),
    ),
  );
}
