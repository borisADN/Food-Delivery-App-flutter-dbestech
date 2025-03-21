import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/AppIcon.dart';
import 'package:food_app/widgets/app_column.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/expandable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/food11.png'),
                  ),
                ),
              )),
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              )),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - 20,
            child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20)),
                    color: Colors.white),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text: 'Nourriture de la semaine'),
                      SizedBox(height: Dimensions.height20),
                      BigText(text: 'Introduce'),
                      SizedBox(height: Dimensions.height20),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                              text:
                                  'La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes.La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes. La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes. La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes. La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes.La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes.La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes. La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes. La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes. La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes.'),
                        ),
                      )
                    ])),
          )
        ]),
        bottomNavigationBar: Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20),
                  topRight: Radius.circular(Dimensions.radius20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.remove,
                        color: AppColors.signColor,
                        size: Dimensions.iconSize24,
                      ),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      BigText(text: '0'),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      Icon(
                        Icons.add,
                        color: AppColors.signColor,
                        size: Dimensions.iconSize24,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                  child: BigText(
                    text: 'Ajouter au panier',
                    color: Colors.white,
                    size: Dimensions.font20,
                  ),
                )
              ],
            )));
  }
}
