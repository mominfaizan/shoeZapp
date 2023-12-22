import 'package:ShoeZapp/view/category_screen/item_detail.dart';
import 'package:ShoeZapp/widget_common/bg_widget.dart';
import 'package:ShoeZapp/consts/consts.dart';

class CategoryDetail extends StatelessWidget {
  final String? title;
  const CategoryDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: title!.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                      6,
                      (index) => "Shoes"
                          .text
                          .fontFamily(semibold)
                          .size(12)
                          .color(darkFontGrey)
                          .makeCentered()
                          .box
                          .white
                          .rounded
                          .size(120, 60)
                          .margin(EdgeInsets.symmetric(horizontal: 4))
                          .make())),
            ),
            20.heightBox,
            Expanded(
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 250,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            nikeImage,
                            height: 150,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          "Men Shoes"
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                          5.heightBox,
                          "\$600"
                              .text
                              .color(redColor)
                              .fontFamily(bold)
                              .size(16)
                              .make(),
                          10.heightBox,
                        ],
                      )
                          .box
                          .white
                          .margin(EdgeInsets.symmetric(horizontal: 4))
                          .roundedSM
                          .outerShadowSm
                          .padding(EdgeInsets.all(12))
                          .make()
                          .onTap(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ItemDetail(title: "Nike Shoes")),
                        );
                      });
                    }))
          ],
        ),
      ),
    ));
  }
}
