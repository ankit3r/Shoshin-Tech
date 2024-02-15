import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoshin_tech/model/tab_model.dart';
import 'package:shoshin_tech/screens/dashbord_screens/all_affers.dart';
import 'package:shoshin_tech/screens/dashbord_screens/gift.dart';
import 'package:shoshin_tech/widgets/widgets_functions.dart';

class DashboardController extends GetxController {
  PageController pageController = PageController();
  RxInt currentPageIndex = 0.obs;
  RxList<TabModel> tabs = [
    TabModel(
        title: "All Offers",
        iconPath: WidgetsItem.allOfferIcon,
        screen: AllOfferPage()),
    TabModel(
        title: "Gifts",
        iconPath: WidgetsItem.giftIcon,
        screen: const GiftPage()),
    TabModel(
        title: "Upcomings",
        iconPath: WidgetsItem.upcomingIcon,
        screen: const GiftPage()),
    TabModel(
        title: "My Offers",
        iconPath: WidgetsItem.myOfferIcon,
        screen: const GiftPage()),
  ].obs;

  // RxList<Widget> tabScreens = [
  //   AllOfferPage(),
  //   GiftPage(),
  //   GiftPage(),
  //   GiftPage(),
  // ].obs;

  // Future<List<TaskModel>> parseTasksFromAsset() async {
  //   try {
  //     String jsonString =
  //         await rootBundle.loadString('assets/json/dummy_tasks.json');
  //     List<dynamic> jsonList = json.decode(jsonString);
  //     List<TaskModel> tasks =
  //         jsonList.map((json) => TaskModel.fromJson(json)).toList();
  //     return tasks;
  //   } catch (e) {
  //     print('Error loading or parsing the JSON file: $e');
  //     return [];
  //   }
  // }
}
