import 'dart:io';



import 'package:e_com/Views/widgets_comman/bg_widget.dart';
import 'package:e_com/Views/widgets_comman/custom_textfield.dart';
import 'package:e_com/Views/widgets_comman/our_button.dart';
import 'package:e_com/consts/consts.dart';
import 'package:e_com/controller/profile_controller.dart';
import 'package:get/get.dart';

class EditProfileView extends StatelessWidget {
  final dynamic data;
  const EditProfileView({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                ? Image.asset(
                    imgProfile2,
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make()
                : data['imageUrl'] != '' && controller.profileImgPath.isEmpty
                    ? Image.network(
                        imgProfile2,
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : Image.file(
                        File(controller.profileImgPath.value),
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            ourButton(
                color: redColor,
                textColor: whiteColor,
                onPress: () {
                  controller.changeImage(context);
                },
                title: "Change"),
            const Divider(),
            20.heightBox,
            customTextField(
              controller: controller.nameController,
              hint: nameHint,
              title: name,
              isPass: false,
            ),
            customTextField(
              controller: controller.passController,
              hint: passwordHint,
              title: password,
              isPass: true,
            ),
            20.heightBox,
            controller.isloading.value
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  )
                : SizedBox(
                    width: context.screenWidth - 60,
                    child: ourButton(
                        color: redColor,
                        textColor: whiteColor,
                        onPress: () async {
                          controller.isloading(true);
                          await controller.uploadProfileImage();
                          await controller.updateProfile(
                            imgUrl: controller.profileImageLink,
                            name: controller.nameController.text,
                            password: controller.passController.text,
                          );
                          VxToast.show(context, msg: "updated");
                        },
                        title: "Save"),
                  ),
          ],
        )
            .box
            .white
            .shadowSm
            .padding(const EdgeInsets.all(16))
            .margin(const EdgeInsets.only(top: 50, right: 12, left: 12))
            .rounded
            .make(),
      ),
    ));
  }
}
