import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:shoshin_tech/controlle/all_offer_controller.dart';
import 'package:shoshin_tech/model/event_model.dart';
import 'package:shoshin_tech/model/task_model.dart';
import 'package:shoshin_tech/screens/offer/offer_details.dart';
import 'package:shoshin_tech/widgets/widgets_functions.dart';

class AllOfferPage extends StatelessWidget {
  final AllOfferController _controller = Get.put(AllOfferController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.parseTasksFromAsset(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 30,
                  color: Colors.grey.shade200,
                  alignment: Alignment.center,
                  child: Marquee(
                    text:
                        'There once was a boy who told this story about a boy: "',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 8,
                  ),
                  child: Column(
                    children: [
                      WidgetsItem.iconTextTitle(
                        icon: WidgetsItem.trandingIcon,
                        title: 'Tramding offers',
                        textColor: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () => SizedBox(
                          height: 250,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _controller.tasks.length,
                            itemBuilder: (context, index) {
                              TaskModel data = _controller.tasks[index];
                              return FutureBuilder<Color?>(
                                future: _controller
                                    .getImageDominantColor(data.thumbnail),
                                builder: (context, colorSnapshot) {
                                  if (colorSnapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Container(
                                      width: 100,
                                      height: 100,
                                      color: Colors.grey, // Placeholder color
                                    );
                                  } else {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () => Get.to(OfferDetailsScreen(
                                            modelData: data)),
                                        child: WidgetsItem.trandingOfferCard(
                                          topTitle: data.title,
                                          totalUser: "${data.totalLead} Users",
                                          priceGet: "Get ${data.payout}",
                                          image: data.thumbnail,
                                          cardColor: colorSnapshot.data,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      WidgetsItem.iconTextTitle(
                        title: 'More offers',
                        icon: WidgetsItem.moreOfferIcon,
                        textColor: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _controller.event.length,
                        itemBuilder: (context, index) {
                          EventModel modelData = _controller.event[index];
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: WidgetsItem.moreOfferCard(
                              title: modelData.description,
                              priceGet: modelData.payout,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
