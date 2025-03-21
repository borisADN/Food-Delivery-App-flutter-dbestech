import 'package:food_app/controllers/popular_product_controller.dart';
import 'package:food_app/data/api/api_client.dart';
import 'package:food_app/repository/popular_product_repo.dart';
import 'package:food_app/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() =>ApiClient(appBaseUrl: AppConstants.BASE_URL)); 

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}