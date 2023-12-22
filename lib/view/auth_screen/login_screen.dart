import 'package:ShoeZapp/consts/auth_controller.dart';
import 'package:ShoeZapp/consts/consts.dart';
import 'package:ShoeZapp/consts/list.dart';
import 'package:ShoeZapp/view/auth_screen/signup_screen.dart';
import 'package:ShoeZapp/view/home_screen/home.dart';
import 'package:ShoeZapp/widget_common/applogo_widget.dart';
import 'package:ShoeZapp/widget_common/custom_textfield.dart';
import 'package:ShoeZapp/widget_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:ShoeZapp/widget_common/bg_widget.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(children: [
          (context.screenHeight * 0.1).heightBox,
          applogowidget(),
          Text(
            "Log in to $appname",
            style:
                TextStyle(fontFamily: bold, fontSize: 18, color: Colors.white),
          ),
          15.heightBox,
          Column(
            children: [
              customtextfiled(
                  title: email,
                  hint: emailhint,
                  ispass: false,
                  controller: emailController),
              customtextfiled(
                  title: password,
                  hint: passwordHint,
                  ispass: true,
                  controller: controller.passwordcontroller),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {}, child: forgetpassword.text.make())),
              5.heightBox,
              ourbutton(
                  color: redColor,
                  title: login,
                  textcolor: whiteColor,
                  onpress: () async {
                    await controller
                        .loginMethod(context: context)
                        .then((value) {
                      if (value != null) {
                        VxToast.show(context, msg: loggedin);
                        Get.offAll(() => Home());
                      } else {
                        VxToast.show(context, msg: 'loggedin success');
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Home(
                            email: emailController.text,
                            name: emailController.text,
                          ),
                        ));
                      }
                    });
                  }).box.width(context.screenWidth - 50).make(),
              5.heightBox,
              createaccount.text.color(fontGrey).make(),
              ourbutton(
                  color: lightGolden,
                  title: signup,
                  textcolor: redColor,
                  onpress: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Signup(),
                    ));
                  }).box.width(context.screenWidth - 50).make(),
              10.heightBox,
              loginwith.text.color(fontGrey).make(),
              5.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    3,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: lightGrey,
                            child: Image.asset(
                              sociaaliconlist[index],
                              width: 30,
                            ),
                          ),
                        )),
              ),
            ],
          )
              .box
              .white
              .rounded
              .padding(EdgeInsets.all(16))
              .shadowSm
              .width(context.screenWidth - 70)
              .make()
        ]),
      ),
    ));
  }
}
