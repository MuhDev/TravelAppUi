import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app_ui/constants.dart';
import 'package:travel_app_ui/models/recommended_model.dart';
import 'package:travel_app_ui/widgets/details_page_components.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({required this.recommendedModel, Key? key}) : super(key: key);
  final PageController _pageController = PageController();
  final RecommendedModel recommendedModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DetailsPageView(pageController: _pageController,recommendedModel: recommendedModel),
          Column(
            children: [
              const Expanded(
                child: DetailsHeader(),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: SmoothPageIndicator(
                          controller: _pageController,
                          count: recommendedModel.images.length,
                          effect: ExpandingDotsEffect(
                            activeDotColor: Colors.grey.shade200,
                            dotColor: Colors.grey.shade800,
                            dotHeight: 5,
                            dotWidth: 6,
                            spacing: 5,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          recommendedModel.title,
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          child: Text(
                            recommendedModel.description,
                            maxLines: 5,
                            overflow: TextOverflow.fade,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Start from",
                                    style: TextStyle(
                                        color: Colors.grey.shade300,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "\$ ${recommendedModel.price}/person",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 180,
                                height: 60,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.white,
                                    ),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            defaultPadding * 0.5),
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    "Explore Now >>",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 2,
                        child: SizedBox(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

