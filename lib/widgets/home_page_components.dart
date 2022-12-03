import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app_ui/constants.dart';
import 'package:travel_app_ui/models/beach_model.dart';
import 'package:travel_app_ui/models/popular_model.dart';
import 'package:travel_app_ui/models/recommended_model.dart';
import 'package:travel_app_ui/screens/details_screen.dart';
import 'package:travel_app_ui/widgets/custom_tab_indicator.dart';

class BeachListView extends StatelessWidget {
  const BeachListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: defaultPadding * 1.5, bottom: defaultPadding),
      height: 125,
      width: double.infinity,
      child: ListView.builder(
        padding:
            EdgeInsets.only(right: defaultPadding, left: defaultPadding * 1.8),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: beaches.length,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(right: defaultPadding),
          width: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultPadding * 0.7),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(beaches[index].image),
            ),
          ),
        ),
      ),
    );
  }
}

class PopularCategoriesListView extends StatelessWidget {
  const PopularCategoriesListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: defaultPadding * 1.5, left: defaultPadding * 1.8),
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: populars.length,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(right: defaultPadding * 1.8),
          padding: EdgeInsets.symmetric(horizontal: defaultPadding * 0.5),
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            color: Color(populars[index].color),
            borderRadius: BorderRadius.circular(defaultPadding * 0.6),
          ),
          alignment: Alignment.center,
          child: Image.asset(
            populars[index].image,
            height: defaultPadding,
          ),
        ),
      ),
    );
  }
}

class PopularCategoriesSection extends StatelessWidget {
  const PopularCategoriesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: defaultPadding * 2.3,
        left: defaultPadding * 1.8,
        right: defaultPadding * 1.8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Popular Categories",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: 28, fontWeight: FontWeight.w700),
          ),
          const Text(
            "Show All",
            style: TextStyle(
                color: Color(0xff8a8a8a),
                fontWeight: FontWeight.w500,
                fontSize: 17),
          )
        ],
      ),
    );
  }
}

class SmoothPageIndicatrorSection extends StatelessWidget {
  const SmoothPageIndicatrorSection({
    Key? key,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: defaultPadding * 1.8, left: defaultPadding * 1.8),
      child: SmoothPageIndicator(
        controller: _pageController,
        count: recommendations.length,
        effect: const ExpandingDotsEffect(
          activeDotColor: Color(0xff8a8a8a),
          dotColor: Color(0xffababab),
          dotHeight: 5,
          dotWidth: 6,
          spacing: 5,
        ),
      ),
    );
  }
}

class PhotoVIew extends StatelessWidget {
  const PhotoVIew({
    Key? key,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      height: 220,
      width: double.infinity,
      child: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: List.generate(
          recommendations.length,
          (index) => InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      DetailsPage(recommendedModel: recommendations[index])));
            },
            child: Container(
              margin: EdgeInsets.only(right: defaultPadding * 1.5),
              width: 330,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultPadding / 1.5),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(recommendations[index].image),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: defaultPadding * 1.2,
                    left: defaultPadding * 1.2,
                    child: GlassMorphism(
                      blur: 19,
                      raduis: 5,
                      child: Container(
                        height: 36,
                        padding: EdgeInsets.only(
                          left: defaultPadding,
                          right: defaultPadding * 0.9,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Row(children: [
                          SvgPicture.asset("assets/svg/icon_location.svg"),
                          SizedBox(
                            width: defaultPadding * 0.7,
                          ),
                          Text(
                            recommendations[index].name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TapBarSection extends StatelessWidget {
  const TapBarSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding * 1.5),
      width: double.infinity,
      height: defaultPadding * 2,
      child: DefaultTabController(
        length: 4,
        child: TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: defaultPadding),
            indicatorPadding: EdgeInsets.symmetric(horizontal: defaultPadding),
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            unselectedLabelStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            indicator: RoundedRectangleTabIndicator(
                color: Colors.black, weight: 2.2, width: defaultPadding),
            tabs: [
              Tab(
                child: Container(child: const Text("Recommended")),
              ),
              Tab(
                child: Container(child: const Text("Popular")),
              ),
              Tab(
                child: Container(child: const Text("New Destination")),
              ),
              Tab(
                child: Container(child: const Text("Hidden Gems")),
              )
            ]),
      ),
    );
  }
}

class TitleOfThePage extends StatelessWidget {
  const TitleOfThePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: defaultPadding),
      child: Text("Explore\nthe Nature",
          style: Theme.of(context).textTheme.headline6),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(defaultPadding / 1.2),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.03),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset("assets/svg/icon_drawer.svg"),
          ),
          Container(
            padding: EdgeInsets.all(defaultPadding / 1.2),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.03),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset("assets/svg/icon_search.svg"),
          ),
        ],
      ),
    );
  }
}

class GlassMorphism extends StatelessWidget {
  final double? blur;
  final Widget? child;
  final double? raduis;
  const GlassMorphism({this.blur, this.raduis, this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(raduis!),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur!, sigmaY: blur!), child: child),
    );
  }
}
