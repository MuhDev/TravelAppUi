import 'package:flutter/material.dart';
import 'package:travel_app_ui/constants.dart';
import 'package:travel_app_ui/models/recommended_model.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: ()=>Navigator.of(context).pop(),
            child: Container(
              padding: EdgeInsets.all(defaultPadding / 1.2),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(defaultPadding / 1.2),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ));
  }
}

class DetailsPageView extends StatelessWidget {
  const DetailsPageView({
    Key? key,
    required PageController pageController,
    required this.recommendedModel,
  })  : _pageController = pageController,
        super(key: key);
  final PageController _pageController;
  final RecommendedModel recommendedModel;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: List.generate(
        recommendedModel.images.length,
        (index) => Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(recommendedModel.images[index]),
            ),
          ),
        ),
      ),
    );
  }
}
