import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicalapp/const/custom_button.dart';
import 'package:medicalapp/const/custom_text.dart';

import '../main.dart';
import 'login.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  String _selectedCountryCode = '+62';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          ClipPath(
            clipper: TopCurveClipper(),
            child: Container(
              height: height * 0.4,
              width: double.infinity,
              color: Colors.white,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/health-cross-firstaid.svg",
                      color: Colors.lightBlue.shade300,
                      height: width * 0.2,
                    ),
                    SizedBox(height: width * 0.03),
                    CustomText(
                      title: "Your Doctor",
                      color: Colors.black,
                      fontSize: width * 0.07,
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
                    SizedBox(height: width * 0.03),

                    // Email Field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: "Email",
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          color: Colors.black,
                        ),
                        SizedBox(height: width * 0.03),
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Write your Email',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: width * 0.045,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              borderSide: BorderSide(
                                color: Colors.lightBlue.shade300,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: width * 0.03,
                              vertical: width * 0.03,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: width * 0.03),

                    // Phone Number Field with Country Code
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Country Code Section
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                title: "Code",
                                fontSize: width * 0.045,
                                color: Colors.black,
                              ),
                              SizedBox(height: width * 0.03),
                              SizedBox(
                                height:
                                    width *
                                    0.134, // Standard TextField height, or calculate based on your width
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.grey[300]!,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      width * 0.03,
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: _selectedCountryCode,
                                      isExpanded: true,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.grey[600],
                                      ),
                                      items: [
                                        DropdownMenuItem(
                                          value: '+62',
                                          child: Row(
                                            children: [
                                              Container(
                                                width: width * 0.05,
                                                height: width * 0.05,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        width * 0.03,
                                                      ),
                                                ),
                                                child: SvgPicture.asset(
                                                  "assets/svg/flags/indonesia.svg",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              SizedBox(width: width * 0.03),
                                              SizedBox(width: width * 0.02),
                                              Text('+62'),
                                            ],
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: '+1',
                                          child: Row(
                                            children: [
                                              Container(
                                                width: width * 0.05,
                                                height: width * 0.05,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        width * 0.03,
                                                      ),
                                                ),
                                                child: SvgPicture.asset(
                                                  "assets/svg/flags/us.svg",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              SizedBox(width: width * 0.03),
                                              Text('+1'),
                                            ],
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: '+91',
                                          child: Row(
                                            children: [
                                              Container(
                                                width: width * 0.05,
                                                height: width * 0.05,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        width * 0.03,
                                                      ),
                                                ),
                                                child: SvgPicture.asset(
                                                  "assets/svg/flags/india.svg",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              SizedBox(width: width * 0.03),
                                              Text('+91'),
                                            ],
                                          ),
                                        ),
                                      ],
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _selectedCountryCode = newValue!;
                                        });
                                      },
                                      padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.03,
                                        vertical: width * 0.03,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: width * 0.03),

                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                title: "Mobile phone",
                                fontSize: width * 0.045,
                                color: Colors.black,
                              ),
                              SizedBox(height: width * 0.03),
                              TextField(
                                controller: _phoneController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: '812 XXXX XXXX',
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: width * 0.045,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      width * 0.03,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.grey[300]!,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      width * 0.03,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.grey[300]!,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      width * 0.03,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.lightBlue.shade300,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: width * 0.03,
                                    vertical: width * 0.03,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: width * 0.03),

                    // Password Field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: "Password",
                          fontSize: width * 0.045,
                          color: Colors.black,
                        ),
                        SizedBox(height: width * 0.03),
                        TextField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: 'Write your Password',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: width * 0.045,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              borderSide: BorderSide(
                                color: Colors.lightBlue.shade300,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey[600],
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: width * 0.03,
                              vertical: width * 0.03,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: width * 0.05),

                    CustomButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Saved Successfully"),
                            backgroundColor: Colors.lightBlue.shade300,
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      text: "Sign Up",
                      backgroundColor: Colors.lightBlue.shade300,
                    ),

                    SizedBox(height: width * 0.03),

                    Center(
                      child: CustomText(
                        title: "Or Continue with",
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.038,
                      ),
                    ),

                    SizedBox(height: width * 0.03),

                    // Social Login Buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/svg/facebook.svg',
                              width: width * 0.03,
                              height: width * 0.045,
                            ),
                            label: CustomText(
                              title: "Facebook",
                              color: Colors.lightBlue.shade300,
                              fontSize: width * 0.037,
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                vertical: width * 0.04,
                              ),
                              side: BorderSide(color: Colors.grey[300]!),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  width * 0.03,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.03),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/svg/google.svg',
                              width: width * 0.03,
                              height: width * 0.045,
                            ),
                            label: CustomText(
                              title: "Google",
                              color: Colors.lightBlue.shade300,
                              fontSize: width * 0.037,
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                vertical: width * 0.04,
                              ),
                              side: BorderSide(color: Colors.grey[300]!),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  width * 0.03,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: width * 0.02),

                    // Sign In Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          title: "You have account already?",
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.038,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: CustomText(
                            title: "Sign In",
                            fontSize: width * 0.04,
                            color: Colors.lightBlue.shade300,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: width * 0.03),
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
