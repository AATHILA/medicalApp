import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medicalapp/auth/registration.dart';
import 'package:medicalapp/const/custom_button.dart';
import 'package:medicalapp/const/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/login_controller.dart';
import '../main.dart';
import '../screens/homescreen.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Scaffold(
          backgroundColor: Colors.grey[200],
          body: Column(
            children: [
              ClipPath(
                clipper: TopCurveClipper(),
                child: Container(
                  height:
                  MediaQuery.of(context).size.height * 0.4, // Slightly reduced
                  width: double.infinity,
                  color: Colors.white,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/health-cross-firstaid.svg",
                          color: Colors.lightBlue.shade800,
                          height: Get.width * 0.2,
                        ),
                        SizedBox(height: Get.width * 0.03),
                        CustomText(
                          title: "Your Doctor",
                          color: Colors.black,
                          fontSize:Get.width * 0.07,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height:Get.width * 0.03),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: "Email",
                              fontSize:Get.width * 0.045,
                              color: Colors.black,
                            ),
                            SizedBox(height: Get.width * 0.03),
                            TextField(
                              controller: controller.emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Write your Email',
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: Get.width * 0.045,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(Get.width * 0.03),
                                  borderSide: BorderSide(color: Colors.grey[300]!),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(Get.width * 0.03),
                                  borderSide: BorderSide(color: Colors.grey[300]!),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(Get.width * 0.03),
                                  borderSide: BorderSide(
                                    color: Colors.lightBlue.shade800,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.03,
                                    vertical:Get.width * 0.03
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: Get.width * 0.03),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: "Password",
                              fontSize: Get.width * 0.045,
                              color: Colors.black,
                            ),
                            SizedBox(height: Get.width * 0.03),
                            TextField(
                              controller: controller.passwordController,
                              obscureText:  controller.obscurePassword.value,
                              decoration: InputDecoration(
                                hintText: 'Write your Password',
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize:Get.width * 0.045,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(Get.width * 0.03),
                                  borderSide: BorderSide(color: Colors.grey[300]!),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(Get.width * 0.03),
                                  borderSide: BorderSide(color: Colors.grey[300]!),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(Get.width * 0.03),
                                  borderSide: BorderSide(
                                    color: Colors.lightBlue.shade800,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.obscurePassword.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey[600],
                                  ),
                                  onPressed: controller.togglePasswordVisibility,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal:Get.width * 0.03,
                                  vertical: Get.width * 0.03,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: Get.width * 0.0001),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: CustomText(
                              title: "Forgot your password?",
                              color: Colors.lightBlue.shade800,
                              fontSize: Get.width * 0.035,
                            ),
                          ),
                        ),

                        SizedBox(height: Get.width * 0.03),

                        Obx(() => CustomButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : () async => await controller.login(),
                          text: controller.isLoading.value
                              ? "Signing in..."
                              : "Sign In",
                          backgroundColor: Colors.lightBlue.shade800,
                        )),

                        SizedBox(height: Get.width * 0.04),

                        Center(
                            child: CustomText(title: "Or Continue with",fontWeight: FontWeight.bold,fontSize: Get.width*0.038,)
                        ),

                        SizedBox(height:Get.width * 0.04),

                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/svg/facebook.svg',
                                  width: Get.width * 0.03,
                                  height: Get.width * 0.045,
                                ),
                                label: CustomText(
                                  title: "Facebook",
                                  color: Colors.lightBlue.shade800,
                                  fontSize:Get.width * 0.037,
                                ),
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    vertical: Get.width * 0.04,
                                  ),
                                  side: BorderSide(color: Colors.grey[300]!),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                     Get.width * 0.03,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: Get.width * 0.03),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/svg/google.svg',
                                  width: Get.width * 0.03,
                                  height: Get.width * 0.045,
                                ),
                                label: CustomText(
                                  title: "Google",
                                  color: Colors.lightBlue.shade800,
                                  fontSize: Get.width * 0.037,
                                ),
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    vertical: Get.width * 0.04,
                                  ),
                                  side: BorderSide(color: Colors.grey[300]!),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      Get.width * 0.03,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Get.width * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(title: "You don't have account?",fontWeight: FontWeight.bold,fontSize: Get.width*0.038),
                            TextButton(
                              onPressed: () {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Registration()),
                                );

                              },
                              child: CustomText(
                                title: "Sign Up",
                                fontSize: Get.width * 0.04,
                                color: Colors.lightBlue.shade800,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Get.width * 0.03),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

  }
}


class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 80);

    path.quadraticBezierTo(
      size.width / 2,
      size.height + 20,
      size.width,
      size.height - 80,
    );

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
