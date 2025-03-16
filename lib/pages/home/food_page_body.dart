import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/app_column.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/icon_and_text_widget.dart';
import 'package:food_app/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        // color: Colors.redAccent,
        height: Dimensions.pageView,
        child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            }),
      ),
      // Dots
      new DotsIndicator(
        dotsCount: 5,
        position: _currentPageValue,
        decorator: DotsDecorator(
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          //   color: Colors.black87,
          activeColor: AppColors.mainColor,
        ),
      ),
      SizedBox(
        height: Dimensions.height30,
      ),
      Container(
        margin: EdgeInsets.only(left: Dimensions.width30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BigText(text: 'Mets Populaires'),
            SizedBox(
              width: Dimensions.width10,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 3),
              child: BigText(text: '.', color: Colors.black26),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: SmallText(
                text: 'Tout voir',
                color: Colors.black54,
              ),
            )
          ],
        ),
      ),
      // List of food and images
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: Dimensions.height10,
            ),
            child: Row(
              children: [
                Container(
                  width: Dimensions.listViewImgSize,
                  height: Dimensions.listViewImgSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white38,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/food0.png')),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    //   width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          bottomRight: Radius.circular(Dimensions.radius20)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.width10, right: Dimensions.width10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigText(
                            text:
                                'Lorem ipsum dolor sit abet consenter advising emit',
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          SmallText(
                            text:
                                'Lorem ipsum dolor sit amet consectetur adipiscing elit',
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconAndTextWidget(
                                icon: Icons.circle_sharp,
                                text: 'Normal',
                                iconColor: AppColors.iconColor1,
                              ),
                              IconAndTextWidget(
                                icon: Icons.location_on,
                                text: '1.7km',
                                iconColor: AppColors.mainColor,
                              ),
                              IconAndTextWidget(
                                icon: Icons.access_time_rounded,
                                text: '32min',
                                iconColor: AppColors.iconColor2,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    ]);
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();

    if (index == _currentPageValue.floor()) {
      // var currentTrans = _height * (1 - currentScale) / 2;
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);

      // var currTrans = height * (1 - currScale) / 2;
      // matrix.translate(0, currTrans);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/food0.png"))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15, left: 15, right: 15),
                child: AppColumn(
                  text: "Togo",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
