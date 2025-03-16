import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/AppIcon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 80,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.clear),
                  // const Spacer(),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              ),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20),
                        )),
                    padding: EdgeInsets.only(top: 5, bottom: 10),
                    width: double.maxFinite,
                    child: Center(
                      child: BigText(
                        text: 'Chinese Side',
                        size: Dimensions.font26,
                      ),
                    ),
                  )),
              pinned: true,
              backgroundColor: AppColors.yellowColor,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image(
                  image: AssetImage('assets/images/food12.png'),
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  child: ExpandableTextWidget(
                    text:
                        'La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes.La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes. La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes. La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes. La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes.La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes.La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes. La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes. La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes. La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes.a nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes.La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes. La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes. La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes. La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes.La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes.La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes. La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes. La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes. La nourriture est un ensemble de aliments et de boissons consommés par des individus ou des groupes de personnes.',
                  ),
                )
              ],
            )),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20 * 2.5,
                right: Dimensions.width20 * 2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    iconSize: Dimensions.iconSize24,
                    icon: Icons.remove,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                  ),
                  BigText(
                    text: '4500 ' 'X' '  0',
                    color: AppColors.mainBlackColor,
                    size: Dimensions.font26,
                  ),
                  AppIcon(
                      iconSize: Dimensions.iconSize24,
                      icon: Icons.add,
                      backgroundColor: AppColors.mainColor,
                      iconColor: Colors.white),
                ],
              ),
            ),
            Container(
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
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                        size: Dimensions.iconSize24,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor,
                      ),
                      child: BigText(
                        text: 'Ajouter au panier',
                        color: Colors.white,
                        size: Dimensions.font20,
                      ),
                    )
                  ],
                ))
          ],
        ));
  }
}
