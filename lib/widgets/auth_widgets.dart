import 'package:event_buddy/constants/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textForm({
  required TextEditingController acontroller,
  required Widget prefix,
  required String hText,
  int maxlines = 1,
  String? Function(String?)? validate,
  Function(String)? onChanged,
  VoidCallback? ontap,
  bool obscure = false,
}) {
  return TextFormField(
    controller: acontroller,
    obscureText: obscure,
    maxLines: maxlines,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color.fromARGB(111, 163, 157, 157)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color.fromARGB(179, 1, 0, 0)),
      ),
      hintText: hText,
      hintStyle: GoogleFonts.poppins(),
      prefixIcon: prefix,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
    ),
    validator: validate,
    onChanged: onChanged,
    onTap: ontap,
  );
}


Widget eButton({
  required String text,
  required VoidCallback presse,
  double width = double.infinity,
  double height = 55,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      minimumSize: Size(width, height),
      backgroundColor: ColorConsts.deepPurple,
    ),
    onPressed: presse,
    child: Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    ),
  );
}

Widget text({required String text, colors, fontweights, double fontSize = 14}) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontSize: fontSize,
      color: colors,
      fontWeight: FontWeight.bold,
    ),
  );
}
