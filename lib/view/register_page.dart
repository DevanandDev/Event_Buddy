import 'package:event_buddy/constants/color_const.dart';
import 'package:event_buddy/constants/text_constants.dart';
import 'package:event_buddy/view/home_page.dart';
import 'package:event_buddy/viewmodel/auth_provider.dart';
import 'package:event_buddy/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyRegister extends StatelessWidget {
  const MyRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final regController = Provider.of<AuthProvider>(context, listen: false);
    final form = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F6FF),
      body: Stack(
        children: [
          Positioned(
            top: -80,
            left: 190,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: ColorConsts.purple,
            ),
          ),
          Positioned(
            top: -40,
            right: -110,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: ColorConsts.lightPurple,
            ),
          ),
          Positioned(
            bottom: -40,
            left: -30,
            child: CircleAvatar(
              radius: 50,
              backgroundColor:ColorConsts.purple,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 80,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: ColorConsts.lightPurple,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      TextConstants.register,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      TextConstants.regTheme,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    SizedBox(height: 40),
                    textForm(
                      acontroller: regController.regNameController,
                      prefix: Icon(Icons.person),
                      hText: TextConstants.username,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return TextConstants.userCondition;
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    textForm(
                      acontroller: regController.regEmailController,
                      prefix: Icon(Icons.email),
                      hText: TextConstants.email,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return TextConstants.emailTheme;
                        }
                        if (!value.contains('@')) {
                          return TextConstants.emailError;
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    textForm(
                      acontroller: regController.regPassController,
                      prefix: Icon(Icons.lock_outline),
                      hText: TextConstants.password,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return TextConstants.passwordTheme;
                        }
                        if (value.length < 6) {
                          return TextConstants.passwordCondition;
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    textForm(
                      acontroller: regController.regPhoneController,
                      prefix: Icon(Icons.phone_android),
                      hText: TextConstants.mobile,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return TextConstants.mobileCheck;
                        }
                      },
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (form.currentState!.validate()) {
                            regController.registerProvider();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (ctx) => MyHomePage()),
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
                        child: const Text(
                          TextConstants.register,
                          style: TextStyle(fontSize: 16, color: ColorConsts.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(TextConstants.alreadyAC),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            TextConstants.register,
                            style: TextStyle(
                              color: ColorConsts.deepPurple,
                              fontWeight: FontWeight.bold,
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
