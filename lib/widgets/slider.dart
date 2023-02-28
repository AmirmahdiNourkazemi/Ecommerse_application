import 'package:mobile_shop/cached_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import '../data/model/banner.dart';

class GetSlider extends StatelessWidget {
  List<BannerCampain> bannerList;
  GetSlider(
    this.bannerList, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: 0.9);
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: controller,
            itemCount: bannerList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedImage(
                  imageUrl: bannerList[index].thumbnail,
                  radious: 15,
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            controller: controller, // PageController
            count: 3,
            effect: ExpandingDotsEffect(
              dotWidth: 9.0,
              dotHeight: 7.0,
              radius: 40,
              dotColor: Colors.white,
              strokeWidth: 0.1,
              activeDotColor: Color(0xff3B5EDF),
            ), // your preferred effect
            onDotClicked: (index) {
              print('object');
            },
          ),
        )
      ],
    );
  }
}
