import 'package:e_com/Views/Category_view/category_details.dart' show CategoryDetails;
import 'package:e_com/consts/consts.dart';
import 'package:e_com/consts/strings.dart' show categories;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/list.dart';
import '../widgets_comman/bg_widget.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        appBar: AppBar(
          title: categories.text.fontFamily(bold).white.make(),
        ),
        body: Container(
            padding: const EdgeInsets.all(12),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 200),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        categoryImgaes[index],
                        height: 120,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      10.heightBox,
                      categoriesList[index]
                          .text
                          .color(darkFontGrey)
                          .align(TextAlign.center)
                          .make()
                    ],
                  )
                      .box
                      .rounded
                      .white
                      .clip(Clip.antiAlias)
                      .outerShadow
                      .make()
                      .onTap(() {
                    Get.to(() => CategoryDetails(title: categoriesList[index]));
                  });
                })),
      ),
    );
  }
}
