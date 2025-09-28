import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/Views/auth_views.dart/login_View.dart';
import 'package:e_com/controller/auth_controllar.dart';
import 'package:e_com/controller/profile_controller.dart';

import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../consts/list.dart';
import '../../services/firestore_services.dart';
import '../widgets_comman/bg_widget.dart';
import 'Componant/details_cart.dart';
import 'edit_profile_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return bgWidget(
      Scaffold(
        body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else {
              var data = snapshot.data!.docs[0];
              return SafeArea(
                child: Column(
                  children: [
                    //edit profile button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          )).onTap(() {
                        controller.nameController.text = data['name'];
                        controller.passController.text = data['password'];

                        Get.to(() => EditProfileView(
                              data: data,
                            ));
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          data['imageUrl'] == ''
                              ? Image.asset(
                                  imgProfile2,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make()
                              : Image.network(
                                  imgProfile2,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make(),
                          5.widthBox,
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "${data['name']}"
                                  .text
                                  .fontFamily(semibold)
                                  .white
                                  .make(),
                              "${data['email']}".text.white.make()
                            ],
                          )),
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: whiteColor)),
                              onPressed: () async {
                                await Get.put(AuthControllar())
                                    .signoutMethod(context);
                                Get.offAll(() => const LoginView());
                              },
                              child: "logout"
                                  .text
                                  .fontFamily(semibold)
                                  .white
                                  .make())
                        ],
                      ),
                    ),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        detailCard(
                            count: data['cart_count'],
                            width: context.screenWidth / 3.4,
                            title: "in your cart"),
                        detailCard(
                            count: data['wishlist_count'],
                            width: context.screenWidth / 3.4,
                            title: "in your wishlist"),
                        detailCard(
                            count: data['order_count'],
                            width: context.screenWidth / 3.4,
                            title: " your orders"),
                      ],
                    ),

                    //buttons section
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: profileButtonList.length,
                      itemBuilder: (BuildContext context, index) {
                        return ListTile(
                          leading: Image.asset(
                            profileButtonIcons[index],
                            width: 22,
                          ),
                          title: profileButtonList[index]
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: lightGrey,
                        );
                      },
                    )
                        .box
                        .white
                        .rounded
                        .margin(const EdgeInsets.all(12))
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .shadowSm
                        .make()
                        .box
                        .color(redColor)
                        .make()
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
