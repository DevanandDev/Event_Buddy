import 'package:event_buddy/constants/color_const.dart';
import 'package:event_buddy/constants/text_constants.dart';
import 'package:event_buddy/view/home_page.dart';
import 'package:event_buddy/viewmodel/auth_provider.dart';
import 'package:event_buddy/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyRegister extends StatelessWidget {
  const MyRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final regController = Provider.of<AuthProvider>(context, listen: false);
    final form = GlobalKey<FormState>();
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F6FF),
      body: Stack(
        children: [
          Positioned(
            top: -height * 0.05,
            right: -width * 0.1,
            child: CircleAvatar(
              radius: width * 0.13,
              backgroundColor: ColorConsts.purple,
            ),
          ),
          Positioned(
            top: height * 0.025,
            right: width * 0.22,
            child: CircleAvatar(
              radius: width * 0.04,
              backgroundColor: ColorConsts.lightPurple,
            ),
          ),
          Positioned(
            bottom: -height * 0.05,
            left: -width * 0.1,
            child: CircleAvatar(
              radius: width * 0.13,
              backgroundColor: ColorConsts.purple,
            ),
          ),
          Positioned(
            bottom: height * 0.025,
            left: width * 0.22,
            child: CircleAvatar(
              radius: width * 0.04,
              backgroundColor: ColorConsts.lightPurple,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: Form(
                key: form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.02),
                    Text(
                      TextConstants.register,
                      style: TextStyle(
                        fontSize: width * 0.055,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: height * 0.005),
                    Text(
                      TextConstants.regTheme,
                      style: TextStyle(
                        fontSize: width * 0.035,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: height * 0.04),
                    textForm(
                      acontroller: regController.regNameController,
                      prefix: const Icon(Icons.person),
                      hText: TextConstants.username,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return TextConstants.userCondition;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.015),
                    textForm(
                      acontroller: regController.regEmailController,
                      prefix: const Icon(Icons.email),
                      hText: TextConstants.email,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return TextConstants.emailTheme;
                        }
                        if (!value.contains('@')) {
                          return TextConstants.emailError;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.015),
                    textForm(
                      acontroller: regController.regPassController,
                      prefix: const Icon(Icons.lock_outline),
                      hText: TextConstants.password,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return TextConstants.passwordTheme;
                        }
                        if (value.length < 6) {
                          return TextConstants.passwordCondition;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.015),
                    textForm(
                      acontroller: regController.regPhoneController,
                      prefix: const Icon(Icons.phone_android),
                      hText: TextConstants.mobile,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return TextConstants.mobileCheck;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.045),
                    SizedBox(
                      width: double.infinity,
                      height: height * 0.065,
                      child: ElevatedButton(
                        onPressed: () {
                          if (form.currentState!.validate()) {
                            regController.registerProvider();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => const MyHomePage(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConsts.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          shadowColor: ColorConsts.lightPurple,
                          elevation: 5,
                        ),
                        child: Text(
                          TextConstants.register,
                          style: TextStyle(
                            fontSize: width * 0.045,
                            color: ColorConsts.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          TextConstants.alreadyAC,
                          style: TextStyle(fontSize: width * 0.035),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            TextConstants.register,
                            style: TextStyle(
                              color: ColorConsts.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.037,
                            ),
                          ),
                        ),
                      ],
                    ),
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
