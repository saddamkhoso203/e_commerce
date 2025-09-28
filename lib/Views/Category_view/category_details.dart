import 'package:e_com/Views/Category_view/item_details.dart';

import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../widgets_comman/bg_widget.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      appBar: AppBar(
        title: title!.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    6,
                    (index) => "Baby Clothing"
                        .text
                        .size(12)
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .makeCentered()
                        .box
                        .white
                        .rounded
                        .size(120, 60)
                        .margin(
                          const EdgeInsets.symmetric(horizontal: 4),
                        )
                        .make()),
              ),
            ),
            //item Container
            20.heightBox,
            Expanded(
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 250,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          imgP5,
                          width: 200,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        "Laptop 04GB/64GB"
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                        10.heightBox,
                        "\$600"
                            .text
                            .color(redColor)
                            .fontFamily(bold)
                            .size(16)
                            .make()
                      ],
                    )
                        .box
                        .outerShadow
                        .white
                        .roundedSM
                        .padding(const EdgeInsets.all(12))
                        .margin(const EdgeInsets.symmetric(horizontal: 4))
                        .make()
                        .onTap(() {
                      Get.to(() => const ItemsDetails(title: "Dummy Title"));
                    });
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
