import 'package:ShoeZapp/consts/auth_controller.dart';
import 'package:ShoeZapp/consts/consts.dart';
import 'package:ShoeZapp/consts/list.dart';
import 'package:ShoeZapp/view/auth_screen/login_screen.dart';
import 'package:ShoeZapp/view/profile_screen/component/detail_card.dart';
import 'package:ShoeZapp/widget_common/bg_widget.dart';
import 'package:get/get.dart';

class profilescreen extends StatelessWidget {
  const profilescreen({required this.name, required this.email, super.key});
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.edit, color: whiteColor).onTap(() {})),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Image.asset(
                    imgProfile2,
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.widthBox,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      name.text.fontFamily(semibold).color(whiteColor).make(),
                      email.text.color(whiteColor).make()
                    ],
                  )),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: whiteColor)),
                      onPressed: () async {
                        await Get.put(AuthController())
                            .signout(context: context);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                      },
                      child: "Logout".text.fontFamily(semibold).white.make())
                ],
              ),
            ),
            5.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailcard(
                    count: "00",
                    title: "In Your Cart",
                    width: context.screenWidth / 3.2),
                detailcard(
                    count: "12",
                    title: "In Your Wishlist",
                    width: context.screenWidth / 3.2),
                detailcard(
                    count: "03",
                    title: "Your Orders",
                    width: context.screenWidth / 3.2),
              ],
            ),
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return Divider(
                  color: lightGrey,
                );
              },
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(
                    profilebuttonicon[index],
                    width: 22,
                  ),
                  title: "${profilebuttonlist[index]}"
                      .text
                      .fontFamily(semibold)
                      .color(darkFontGrey)
                      .make(),
                );
              },
              itemCount: profilebuttonlist.length,
            )
                .box
                .rounded
                .margin(EdgeInsets.all(12))
                .white
                .shadowSm
                .padding(EdgeInsets.symmetric(horizontal: 16))
                .make()
                .box
                .color(redColor)
                .make()
          ],
        ),
      ),
    ));
  }
}
