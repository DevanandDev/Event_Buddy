import 'package:event_buddy/constants/color_const.dart';
import 'package:event_buddy/constants/text_constants.dart';
import 'package:event_buddy/view/home_page.dart';
import 'package:event_buddy/view/register_page.dart';
import 'package:event_buddy/viewmodel/auth_provider.dart';
import 'package:event_buddy/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AuthProvider>(context, listen: false);

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
              backgroundColor: ColorConsts.purple,
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
                      TextConstants.login,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      TextConstants.logTheme,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 40),
                    textForm(
                      acontroller: controller.emailController,
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
                      acontroller: controller.passController,
                      prefix: Icon(Icons.lock_outline_sharp),
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
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (form.currentState!.validate()) {
                            controller.loginProvider(context);
                            Navigator.push(
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
                          shadowColor: const Color.fromARGB(255, 0, 0, 0),
                          elevation: 5,
                        ),
                        child: Text(
                          TextConstants.login,
                          style: TextStyle(fontSize: 16, color: ColorConsts.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(TextConstants.checkReg),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (ctx) => MyRegister()),
                            );
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
