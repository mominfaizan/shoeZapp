import 'package:ShoeZapp/consts/colors.dart';
import 'package:ShoeZapp/consts/consts.dart';
import 'package:ShoeZapp/view/auth_screen/login_screen.dart';
import 'package:ShoeZapp/view/home_screen/home.dart';
import 'package:ShoeZapp/view/home_screen/home_screen.dart';
import 'package:ShoeZapp/widget_common/applogo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  changescreen() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    changescreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        backgroundColor: redColor,
        body: Center(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    icSplashBg,
                    width: 300,
                  )),
              20.heightBox,
              applogowidget(),
              10.heightBox,
              appname.text.fontFamily(bold).white.size(22).make(),
              5.heightBox,
              appversion.text.white.make(),
            ],
          ),
        ),
      ),
    );
  }
}
