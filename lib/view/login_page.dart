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
              backgroundColor: Colors.deepPurple.shade300,
            ),
          ),
          Positioned(
            top: -40,
            right: -110,
            child: CircleAvatar(
              radius: 130,
              backgroundColor: Colors.deepPurple.shade200,
            ),
          ),
          Positioned(
            bottom: -40,
            left: -30,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepPurple.shade300,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 80,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.deepPurple.shade200,
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
                      "Login",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Please sign in to continue",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 40),
                    textForm(
                      acontroller: controller.emailController,
                      prefix: Icon(Icons.email),
                      hText: "Email",
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'email is not correct';
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    textForm(
                      acontroller: controller.passController,
                      prefix: Icon(Icons.lock_outline_sharp),
                      hText: "Password",
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your password';
                        }
                        if (value.length < 6) {
                          return 'enter atleast 6 characters';
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
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          shadowColor: const Color.fromARGB(255, 0, 0, 0),
                          elevation: 5,
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don’t have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (ctx) => MyRegister()),
                            );
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.deepPurple,
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
