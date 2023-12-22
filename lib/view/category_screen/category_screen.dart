import 'package:ShoeZapp/consts/consts.dart';
import 'package:ShoeZapp/consts/list.dart';
import 'package:ShoeZapp/view/category_screen/category_detail.dart';
import 'package:ShoeZapp/widget_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class categoryscreen extends StatefulWidget {
  const categoryscreen({super.key});

  @override
  State<categoryscreen> createState() => _categoryscreenState();
}

class _categoryscreenState extends State<categoryscreen> {
  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: redColor,
        // shadowColor: ,
        title: categories.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
            itemCount: 9,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 200),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(
                    categoryImage[index],
                    height: 130,
                    width: 200,
                    fit: BoxFit.fill,
                  ),
                  "${categoryitem[index]}"
                      .text
                      .color(darkFontGrey)
                      .align(TextAlign.center)
                      .make()
                ],
              )
                  .box
                  .white
                  .rounded
                  .clip(Clip.antiAlias)
                  .outerShadowSm
                  .make()
                  .onTap(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryDetail(
                      title: "${categoryitem[index]}",
                    ),
                  ),
                );
              });
            }),
      ),
    ));
  }
}
