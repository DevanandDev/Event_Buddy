import 'package:event_buddy/services/auth_service.dart';
import 'package:event_buddy/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController regNameController = TextEditingController();
  TextEditingController regEmailController = TextEditingController();
  TextEditingController regPassController = TextEditingController();
  TextEditingController regPhoneController = TextEditingController();
  AuthService service = AuthService();

  Future<void> loginProvider(BuildContext context) async {
    try {
      await service.loginUser(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<void> registerProvider() async {
    try {
      service.registerUser(
        name: regNameController.text.trim(),
        email: regEmailController.text.trim(),
        mobile: regPhoneController.text.trim(),
        password: regPassController.text.trim(),
      );
    } catch (e) {
      throw Exception('already taken :${e}'); 
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    regEmailController.dispose();
    regPassController.dispose();
    regPhoneController.dispose();
    regNameController.dispose();
    super.dispose();
  }
}
