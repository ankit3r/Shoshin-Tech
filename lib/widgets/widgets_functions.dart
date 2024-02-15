import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shoshin_tech/model/tab_model.dart';

class WidgetsItem {
  static Color blue = const Color(0xFF4088D1);
  static Color blueLight = const Color(0xFF5bb4e5);

  static String drawerIcon = 'assets/icons/menu.svg';
  static String backIcon = 'assets/icons/back.svg';
  static String walletIcon = 'assets/icons/wallet.svg';
  static String allOfferIcon = 'assets/icons/all_offer.svg';
  static String giftIcon = 'assets/icons/gift.svg';
  static String upcomingIcon = 'assets/icons/upcoming.svg';
  static String myOfferIcon = 'assets/icons/my_offer.svg';
  static String trandingIcon = 'assets/icons/tranding.svg';
  static String dot = 'assets/icons/dot.svg';
  static String moreOfferIcon = 'assets/icons/more_offer.svg';
  static String userFireIcon = 'assets/icons/user_light.svg';
  static String done = 'assets/icons/done_fill.svg';
  static String logo = 'assets/images/logo.jpg';

  static Widget customeToolbar({
    required String title,
    bool showBack = false,
    String? walletValue = '100',
    void Function()? onDrawerClick,
    void Function()? onBackClick,
  }) {
    return Container(
      height: 70,
      padding: const EdgeInsets.only(right: 20, left: 10),
      child: Row(
        children: [
          showBack
              ? IconButton(
                  onPressed: onBackClick,
                  icon: SvgPicture.asset(
                    backIcon,
                    height: 32,
                    color: Colors.white,
                  ),
                )
              : IconButton(
                  onPressed: onDrawerClick,
                  icon: SvgPicture.asset(
                    drawerIcon,
                    height: 32,
                    color: Colors.white,
                  ),
                ),
          const SizedBox(width: 12),
          txt16(
            text: title,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          const Spacer(),
          showBack
              ? const SizedBox()
              : Container(
                  width: 110,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        padding: const EdgeInsets.all(6),
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: blueLight,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SvgPicture.asset(
                          walletIcon,
                        ),
                      ),
                      const SizedBox(width: 5),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                          children: <TextSpan>[
                            const TextSpan(
                                text: '₹',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(text: walletValue),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  static Widget background() {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            WidgetsItem.blue,
            WidgetsItem.blueLight,
          ],
        ),
      ),
    );
  }

  static Widget txt16({
    required String text,
    Color? textColor,
    double? fontSize,
    FontWeight? fontWeight,
    int? maxLine,
    bool? isDone,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: TextStyle(
        decoration: isDone ?? false ? TextDecoration.lineThrough : null,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? 16,
        color: textColor ?? Colors.white,
      ),
    );
  }

  static Widget tabButton(TabModel tabModel, {int? index, int? selectedIndex}) {
    bool isSelected = index == selectedIndex;
    return Container(
      height: 75,
      width: 85,
      margin: const EdgeInsets.only(
        left: 6,
        right: 6,
        bottom: 6,
      ),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color.fromARGB(68, 187, 222, 251)
            : Colors.transparent,
        border: isSelected
            ? Border(
                bottom: BorderSide(
                  color: blue,
                  width: 5.0,
                ),
              )
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            tabModel.iconPath,
            height: 26,
          ),
          WidgetsItem.txt16(
              text: tabModel.title, textColor: Colors.black, fontSize: 14)
        ],
      ),
    );
  }

  static Widget iconTextTitle({
    String? title,
    double? iconSize,
    String? icon,
    Color? textColor,
    double? fontSize,
    FontWeight? fontWeight,
    double? space,
    bool? isCenter,
  }) {
    return Row(
      mainAxisAlignment: isCenter ?? false
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          icon ?? drawerIcon,
          height: iconSize ?? 32,
        ),
        SizedBox(width: space ?? 5),
        txt16(
          text: title ?? "title",
          fontSize: fontSize,
          textColor: textColor,
          fontWeight: fontWeight,
        )
      ],
    );
  }

  static Widget trandingOfferCard({
    String? topTitle,
    String? priceGet,
    String? totalUser,
    Color? cardColor,
    Color? textColor,
    String? image,
  }) {
    print('image url = $image');
    return Container(
        width: 200,
        decoration: BoxDecoration(
          color: cardColor ?? Colors.deepPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Flexible(
              child: SizedBox(
                height: 150,
                width: 200,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(image ?? ''),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    txt16(
                        text: topTitle ?? '2 player Game',
                        fontWeight: FontWeight.bold,
                        textColor: textColor ?? Colors.white,
                        fontSize: 14),
                    txt16(
                        text: priceGet ?? 'Get Rs. 100',
                        fontWeight: FontWeight.bold,
                        textColor: textColor ?? Colors.white,
                        fontSize: 14),
                    iconTextTitle(
                      icon: userFireIcon,
                      title: totalUser ?? '7443 users',
                      fontSize: 12,
                      iconSize: 19,
                      space: 2,
                      textColor: textColor ?? Colors.white,
                    )
                  ]),
            )
          ],
        ));
  }

  static Widget moreOfferCard({
    String? image,
    String? title,
    String? priceGet,
    String? totalUsers,
    Color? boaderColor,
    Color? iconTextColor,
  }) {
    return Container(
      height: 100,
      width: Get.width - 40,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 84,
            width: 84,
            child: Image.asset(
              logo,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                txt16(
                  text: title ?? 'Alta`o offers',
                  textColor: Colors.black,
                  fontWeight: FontWeight.bold,
                  maxLine: 1,
                ),
                Container(
                  padding: const EdgeInsets.all(3),
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: blue),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: txt16(
                      text: 'Get ${priceGet ?? '₹100'}',
                      fontWeight: FontWeight.bold,
                      textColor: blue,
                      fontSize: 14),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                iconTextTitle(
                  icon: userFireIcon,
                  title: '74,443',
                  fontSize: 12,
                  iconSize: 19,
                  space: 2,
                  textColor: Colors.black,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  static Widget stape({
    double? height,
    required bool isDiss,
    required String icon,
    required String title,
    required String amount,
    required String discription,
    required Color amoutCardColor,
    Color? cardBoarColor,
    Color? txtColor,
    Color? cardBackground,
    Color? amountTxtColor,
    bool? isDone,
  }) {
    return Container(
        height: height ?? 54,
        width: double.infinity,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: cardBackground,
          border: Border.all(
            color: cardBoarColor ?? Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(22),
        ),
        child: isDiss
            ? Column(
                children: [
                  topRow(
                    icon: icon,
                    title: title,
                    amount: amount,
                    amoutCardColor: amoutCardColor,
                    txtColor: txtColor,
                    amountTxtColor: amountTxtColor,
                    isDone: isDone,
                  ),
                  const SizedBox(height: 5),
                  txt16(
                    text: discription,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textColor: Colors.black54,
                    maxLine: 3,
                  )
                ],
              )
            : topRow(
                icon: icon,
                title: title,
                amount: amount,
                amoutCardColor: amoutCardColor,
                txtColor: txtColor,
                amountTxtColor: amountTxtColor,
                isDone: isDone));
  }

  static Widget topRow({
    required String icon,
    required String title,
    required String amount,
    required Color amoutCardColor,
    Color? txtColor,
    Color? amountTxtColor,
    bool? isDone,
  }) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          height: 38,
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: WidgetsItem.txt16(
            text: title,
            maxLine: 1,
            textColor: txtColor ?? Colors.black,
            fontWeight: FontWeight.bold,
            isDone: isDone,
          ),
        ),
        const Spacer(),
        Container(
          width: 60,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: amoutCardColor,
            borderRadius: BorderRadius.circular(22),
          ),
          child: txt16(
            text: amount,
            textColor: amountTxtColor ?? Colors.white,
          ),
        ),
      ],
    );
  }
}
