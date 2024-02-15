import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoshin_tech/model/task_model.dart';
import 'package:shoshin_tech/widgets/widgets_functions.dart';

class OfferDetailsScreen extends StatelessWidget {
  final TaskModel modelData;
  const OfferDetailsScreen({super.key, required this.modelData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        WidgetsItem.background(),
        SafeArea(
            child: Column(
          children: [
            WidgetsItem.customeToolbar(
              title: 'Offer Detail',
              showBack: true,
              onBackClick: () => Get.back(),
            ),
            Expanded(
              child: Container(
                width: Get.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(modelData.thumbnail),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  WidgetsItem.txt16(
                                    text: modelData.title,
                                    maxLine: 1,
                                    textColor: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  WidgetsItem.txt16(
                                    text: modelData.shortDesc,
                                    maxLine: 3,
                                    textColor: Colors.black87,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(
                                    height: 25,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Divider(),
                        const SizedBox(height: 15),
                        WidgetsItem.txt16(
                          text: 'Steps(1/4)',
                          maxLine: 1,
                          textColor: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 10),
                        WidgetsItem.stape(
                          amount: modelData.payout,
                          discription: modelData.shortDesc,
                          icon: WidgetsItem.done,
                          isDiss: false,
                          isDone: true,
                          title: modelData.title,
                          cardBoarColor: Colors.green,
                          amoutCardColor: Colors.green,
                        ),
                        const SizedBox(height: 10),
                        WidgetsItem.stape(
                          amount: modelData.payout,
                          discription: modelData.shortDesc,
                          icon: WidgetsItem.upcomingIcon,
                          isDiss: true,
                          title: modelData.title,
                          height: 130,
                          cardBoarColor: Colors.amber,
                          amoutCardColor: Colors.amber,
                        ),
                        const SizedBox(height: 10),
                        WidgetsItem.stape(
                          amount: modelData.payout,
                          discription: modelData.shortDesc,
                          icon: WidgetsItem.dot,
                          isDiss: false,
                          title: modelData.title,
                          amoutCardColor: Colors.white,
                          txtColor: Colors.black54,
                          cardBackground: Colors.grey.shade300,
                          amountTxtColor: Colors.blue,
                        ),
                        const SizedBox(height: 10),
                        WidgetsItem.stape(
                          amount: modelData.payout,
                          discription: modelData.shortDesc,
                          icon: WidgetsItem.dot,
                          isDiss: false,
                          title: modelData.title,
                          amoutCardColor: Colors.white,
                          txtColor: Colors.black54,
                          cardBackground: Colors.grey.shade300,
                          amountTxtColor: Colors.blue,
                        ),
                        const SizedBox(height: 80),
                        WidgetsItem.iconTextTitle(
                          icon: WidgetsItem.userFireIcon,
                          title:
                              "${modelData.totalLead} Users ha already participated",
                          textColor: Colors.amber,
                          isCenter: true,
                        ),
                        Center(
                          child: Container(
                            height: 55,
                            width: Get.width - 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  WidgetsItem.blue,
                                  WidgetsItem.blueLight,
                                ],
                              ),
                            ),
                            child: WidgetsItem.txt16(
                              text: "Get ${modelData.payout}",
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ))
      ]),
    );
  }
}
