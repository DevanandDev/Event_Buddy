import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textForm({
  required acontroller,
  required prefix,
  required hText,
  String? Function(String?)? validate,
  maxlines,
  Function(String)? onChanged,
  Function()? ontap,
}) {
  return TextFormField(
    maxLines: maxlines,
    controller: acontroller,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: const Color.fromARGB(111, 163, 157, 157)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: const Color.fromARGB(179, 1, 0, 0)),
      ),
      hintText: hText,
      hintStyle: GoogleFonts.poppins(),
      prefixIcon: prefix,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
    ),
    validator: validate,
    onChanged:onChanged,
    onTap: ontap
  );
}

Widget eButton({required String text, required presse}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      minimumSize: Size(400, 55),
      backgroundColor: Colors.black,
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
