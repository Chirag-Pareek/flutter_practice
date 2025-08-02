import 'package:flutter/material.dart';
import 'package:love_calculator/Pages/welcome_page.dart';
import 'package:love_calculator/pages/second_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WidgetTree extends StatelessWidget {
  final PageController _pageController;

  WidgetTree({super.key}) : _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // PageView
          PageView(
            controller: _pageController,
            children: [
              // Replace with your actual pages
              WelcomePage(),
              SecondPage(),
            ],
          ),

          // SmoothPageIndicator (positioned at the bottom)
          Positioned(
            bottom: screenHeight * 0.1, // 10% from the bottom
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 2,
                effect: const WormEffect(
                  activeDotColor: Colors.red,
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
