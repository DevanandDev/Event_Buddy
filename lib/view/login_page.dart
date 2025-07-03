import 'package:event_buddy/constants/color_const.dart';
import 'package:event_buddy/constants/text_constants.dart';
import 'package:event_buddy/services/auth_service.dart';
import 'package:event_buddy/view/home_page.dart';
import 'package:event_buddy/view/register_page.dart';
import 'package:event_buddy/viewmodel/auth_provider.dart';
import 'package:event_buddy/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AuthProvider>(context, listen: false);
    final form = GlobalKey<FormState>();
    final auth = AuthService();

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
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: height * 0.04),
                    textForm(
                      acontroller: controller.emailController,
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
                      acontroller: controller.passController,
                      prefix: const Icon(Icons.lock_outline_sharp),
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
                    SizedBox(height: height * 0.05),
                    SizedBox(
                      width: double.infinity,
                      height: height * 0.065,
                      child: ElevatedButton(
                        onPressed: () {
                          if (form.currentState!.validate()) {
                            controller.loginProvider(context);
                            Navigator.push(
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
                          shadowColor: Colors.black,
                          elevation: 5,
                        ),
                        child: Text(
                          TextConstants.login,
                          style: TextStyle(
                            fontSize: width * 0.045,
                            color: ColorConsts.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(color: Colors.black, thickness: 0.1),
                        ),
                        SizedBox(width: width * 0.05),
                        text(text: 'Or Login With'),
                        SizedBox(width: width * 0.05),
                        Expanded(
                          child: Divider(color: Colors.black, thickness: 0.1),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.07),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: height * 0.05,
                          width: width * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color.fromARGB(255, 192, 191, 191),
                            ),
                          ),
                          child: Consumer<AuthProvider>(
                            builder: (context, value, child) {
                            return IconButton(
                              onPressed: () async {
                                value.loginProvider(context);
                              },
                              icon: FaIcon(FontAwesomeIcons.google, size: 20),
                            );
                            },
                            
                          ),
                        ),
                        SizedBox(width: width * 0.1),
                        Container(
                          height: height * 0.05,
                          width: width * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color.fromARGB(255, 192, 191, 191),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: FaIcon(FontAwesomeIcons.phone, size: 20),
                          ),
                        ),
                        SizedBox(width: width * 0.1),
                        Container(
                          height: height * 0.05,
                          width: width * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color.fromARGB(255, 192, 191, 191),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: FaIcon(FontAwesomeIcons.user, size: 20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.025),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(TextConstants.checkReg),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => const MyRegister(),
                              ),
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
