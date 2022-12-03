import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/home_page_components.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final  PageController _pageController =
      PageController(viewportFraction: 0.877);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const TravelBottomNavigationBar(),
        body: SafeArea(
          child: Container(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const Header(),
                const TitleOfThePage(),
                const TapBarSection(),
                PhotoVIew(pageController: _pageController),
                SmoothPageIndicatrorSection(pageController: _pageController),
                const PopularCategoriesSection(),
                const PopularCategoriesListView(),
                const BeachListView(),
              ],
            ),
          ),
        ));
  }
}

