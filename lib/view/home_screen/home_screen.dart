import 'package:ShoeZapp/consts/consts.dart';
import 'package:ShoeZapp/consts/list.dart';
import 'package:ShoeZapp/widget_common/home_button.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 55,
              color: lightGrey,
              child: TextFormField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: whiteColor,
                    hintText: searchanything,
                    hintStyle: TextStyle(color: textfieldGrey)),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: sliderlist.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Image.asset(
                              sliderlist[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(EdgeInsets.symmetric(horizontal: 8))
                                .make(),
                          );
                        }),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          2,
                          (index) => homebutton(
                              height: context.screenHeight * 0.15,
                              width: context.screenWidth / 2.5,
                              icon: index == 0 ? icTodaysDeal : icFlashDeal,
                              title: index == 0 ? todayDeal : flashsale)),
                    ),
                    10.heightBox,
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: secondsliderlist.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Image.asset(
                              secondsliderlist[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(EdgeInsets.symmetric(horizontal: 8))
                                .make(),
                          );
                        }),
                    10.heightBox,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            3,
                            (index) => homebutton(
                                  height: context.screenHeight * 0.15,
                                  width: context.screenWidth / 3.5,
                                  icon: index == 0
                                      ? icTopCategories
                                      : index == 1
                                          ? icBrands
                                          : icTopSeller,
                                  title: index == 0
                                      ? topcategories
                                      : index == 1
                                          ? Brand
                                          : topsellers,
                                ))),
                    20.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featuredcategories.text
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semibold)
                          .make(),
                    ),
                    20.heightBox,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
