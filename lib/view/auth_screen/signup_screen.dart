import 'package:ShoeZapp/consts/auth_controller.dart';
import 'package:ShoeZapp/consts/consts.dart';
import 'package:ShoeZapp/consts/list.dart';
import 'package:ShoeZapp/view/auth_screen/login_screen.dart';
import 'package:ShoeZapp/view/home_screen/home.dart';
import 'package:ShoeZapp/widget_common/applogo_widget.dart';
import 'package:ShoeZapp/widget_common/custom_textfield.dart';
import 'package:ShoeZapp/widget_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:ShoeZapp/widget_common/bg_widget.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _obscureText = true;

  bool? ischeck = false;
  var controller = Get.put(AuthController());
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordretypeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(children: [
          (context.screenHeight * 0.1).heightBox,
          applogowidget(),
          Text(
            "Sign up to $appname",
            style:
                TextStyle(fontFamily: bold, fontSize: 18, color: Colors.white),
          ),
          15.heightBox,
          Column(
            children: [
              customtextfiled(
                  title: name,
                  hint: namehint,
                  controller: nameController,
                  ispass: false),
              customtextfiled(
                  title: email,
                  hint: emailhint,
                  controller: emailController,
                  ispass: false),
              customtextfiled(
                  title: password,
                  hint: passwordHint,
                  controller: passwordController,
                  ispass: true),
              customtextfiled(
                  title: retypepassword,
                  hint: passwordHint,
                  controller: passwordretypeController,
                  ispass: true),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {}, child: forgetpassword.text.make())),
              5.heightBox,
              Row(
                children: [
                  Checkbox(
                      activeColor: redColor,
                      checkColor: whiteColor,
                      value: ischeck,
                      onChanged: (newValue) {
                        setState(() {
                          ischeck = newValue;
                        });
                      }),
                  10.heightBox,
                  Expanded(
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "i agree to the ",
                          style:
                              TextStyle(fontFamily: regular, color: fontGrey)),
                      TextSpan(
                          text: temsandcondition,
                          style:
                              TextStyle(fontFamily: regular, color: redColor)),
                      TextSpan(
                          text: " & ",
                          style:
                              TextStyle(fontFamily: regular, color: fontGrey)),
                      TextSpan(
                          text: privacypolicy,
                          style:
                              TextStyle(fontFamily: regular, color: redColor))
                    ])),
                  )
                ],
              ),
              10.heightBox,
              ourbutton(
                  color: ischeck == true ? redColor : lightGrey,
                  title: signup,
                  textcolor: whiteColor,
                  onpress: () async {
                    if (ischeck != false) {
                      try {
                        await controller
                            .signupmethod(
                                email: emailController.text,
                                password: passwordController.text,
                                context: context)
                            .then((value) {
                          return controller.storedata(
                              name: nameController.text,
                              password: passwordController.text,
                              email: emailController.text);
                        }).then((value) {
                          VxToast.show(context, msg: loggedin);
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => Home(
                              name: nameController.text,
                              email: emailController.text,
                            ),
                          ));
                        });
                      } catch (e) {
                        auth.signOut();
                        VxToast.show(context, msg: e.toString());
                      }
                    }
                  }).box.width(context.screenWidth - 50).make(),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  alreadyaccount.text.color(fontGrey).make(),
                  login.text.color(redColor).make().onTap(() {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                  })
                ],
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
