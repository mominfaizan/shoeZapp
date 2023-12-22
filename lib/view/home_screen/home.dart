import 'package:ShoeZapp/consts/consts.dart';
import 'package:ShoeZapp/controllers/home_controller.dart';
import 'package:ShoeZapp/view/cart_screen/cart_screen.dart';
import 'package:ShoeZapp/view/category_screen/category_screen.dart';
import 'package:ShoeZapp/view/home_screen/home_screen.dart';
import 'package:ShoeZapp/view/profile_screen/profile.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({this.name = "default", this.email = "default@gmail.com", Key? key})
      : super(key: key);
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(homecontroller());

    var navbaritem = [
      BottomNavigationBarItem(
        icon: Image.asset(icHome, width: 26),
        label: home,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(icCategories, width: 26),
        label: categories,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(icCart, width: 26),
        label: cart,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(icProfile, width: 26),
        label: account,
      )
    ];

    var navbody = [
      HomeScreen(),
      categoryscreen(),
      cartscreen(),
      profilescreen(
        name: name,
        email: email,
      ),
    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(
              child: navbody.elementAt(controller.currentnavindex.value))),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            currentIndex: controller.currentnavindex.value,
            selectedItemColor: redColor,
            selectedLabelStyle: TextStyle(fontFamily: semibold),
            type: BottomNavigationBarType.fixed,
            backgroundColor: whiteColor,
            onTap: (value) {
              controller.currentnavindex.value = value;
            },
            items: navbaritem),
      ),
    );
  }
}
