
import 'package:e_com/Views/HomeView/home.dart';
import 'package:e_com/Views/auth_views.dart/login_View.dart';
import 'package:e_com/Views/widgets_comman/applogo_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../consts/consts.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  changeView() {
    Future.delayed(const Duration(seconds: 3), () {
      // Get.to(() => const LoginView());
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() => const LoginView());
        } else {
          Get.to(() => const Home());
        }
      });
    });
  }

  @override
  void initState() {
    changeView();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                icSplashBg,
                width: 300,
              ),
            ),
            20.heightBox,
            applogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).white.size(22).make(),
            5.heightBox,
            appversion.text.white.make(),
            const Spacer(),
            credits.text.fontFamily(semibold).white.make(),
            30.heightBox
          ],
        ),
      ),
    );
  }
}
