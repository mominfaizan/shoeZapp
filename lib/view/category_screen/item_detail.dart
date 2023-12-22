import 'package:ShoeZapp/consts/colors.dart';
import 'package:ShoeZapp/consts/consts.dart';
import 'package:ShoeZapp/consts/list.dart';
import 'package:ShoeZapp/widget_common/our_button.dart';
import 'package:flutter/material.dart';

class ItemDetail extends StatefulWidget {
  ItemDetail({super.key, required this.title});
  final String? title;

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  bool favicon = true;
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: widget.title!.text.fontFamily(bold).color(darkFontGrey).make(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
              )),
          IconButton(
              onPressed: () {
                setState(() {
                  if (favicon) {
                    favicon = false;
                  } else {
                    favicon = true;
                  }
                });
              },
              icon: Icon(
                favicon
                    ? Icons.favorite_border_outlined
                    : Icons.favorite_rounded,
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      aspectRatio: 16 / 9,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          nikeImage,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        );
                      }),
                  10.heightBox,
                  widget.title!.text
                      .size(16)
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .make(),
                  10.heightBox,
                  VxRating(
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    stepInt: true,
                  ),
                  10.heightBox,
                  "\$600".text.color(redColor).fontFamily(bold).size(18).make(),
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Seller".text.white.fontFamily(semibold).make(),
                          5.heightBox,
                          "In house Brands"
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .size(16)
                              .make()
                        ],
                      )),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.message_rounded,
                          color: darkFontGrey,
                        ),
                      )
                    ],
                  )
                      .box
                      .height(60)
                      .padding(EdgeInsets.symmetric(horizontal: 16))
                      .color(textfieldGrey)
                      .make(),
                  20.heightBox,
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Color:".text.color(darkFontGrey).make(),
                          ),
                          Row(
                            children: List.generate(
                              3,
                              (index) => VxBox()
                                  .size(40, 40)
                                  .roundedFull
                                  .color(Vx.randomPrimaryColor)
                                  .margin(EdgeInsets.symmetric(horizontal: 4))
                                  .make(),
                            ),
                          )
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Quantity:".text.color(darkFontGrey).make(),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (counter != 1) {
                                      counter--;
                                    }
                                  });
                                },
                                icon: Icon(Icons.remove),
                              ),
                              counter.text
                                  .size(16)
                                  .color(darkFontGrey)
                                  .fontFamily(bold)
                                  .make(),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    counter++;
                                  });
                                },
                                icon: Icon(Icons.add),
                              ),
                              10.widthBox,
                              "(0 available)".text.color(darkFontGrey).make()
                            ],
                          )
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Total:".text.color(darkFontGrey).make(),
                          ),
                          {counter * 600}
                              .toString()
                              .text
                              .fontFamily(bold)
                              .color(redColor)
                              .size(16)
                              .make()
                        ],
                      ).box.padding(EdgeInsets.all(8)).make()
                    ],
                  ).box.white.shadowSm.make(),
                  10.heightBox,
                  "Description"
                      .text
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .make(),
                  10.heightBox,
                  "This is Dummy item and description..."
                      .text
                      .color(darkFontGrey)
                      .make(),
                ],
              ),
            ),
          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourbutton(
                color: redColor,
                onpress: () {
                  cartitemlist.add(widget.title.toString());
                },
                textcolor: whiteColor,
                title: "Add To Cart"),
          ),
        ],
      ),
    );
  }
}
