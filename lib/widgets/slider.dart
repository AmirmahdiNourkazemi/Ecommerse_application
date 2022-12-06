import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

var controller = PageController(viewportFraction: 0.8);
Stack slider() {
  return Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      SizedBox(
        height: 177,
        child: PageView.builder(
          controller: controller,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 340,
                height: 177,
                //color: Colors.red,
                child: Image.asset('assets/images/banner.png'),
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
                dotWidth: 10.0,
                dotHeight: 10.0,
                radius: 40,
                dotColor: Colors.white,
                strokeWidth: 0.1,
                activeDotColor: Color(0xff3B5EDF),
              ), // your preferred effect
              onDotClicked: (index) {
                print('object');
              }))
    ],
  );
}
