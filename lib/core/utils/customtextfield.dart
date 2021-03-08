import 'package:flutter/material.dart';

Widget customTextFields({
  BuildContext context,
  String name,
  IconData iconData,
  Color color,
  String initialValue,
  Function validator,
  Function onSaved,
  TextInputType keyboardType,
  TextEditingController controller,
  bool obscureText,
  Function iconTap,
}) {
  return TextFormField(
    obscureText: obscureText,
    controller: controller,
    keyboardType: keyboardType,
    validator: validator,
    onChanged: onSaved,
    //cursorColor: Theme.of(context).cursorColor,
    initialValue: initialValue, style: TextStyle(color: Colors.blue),
    //maxLength: 20,
    decoration: InputDecoration(
      //icon: Icon(Icons.favorite),
      labelText: name,
      labelStyle: TextStyle(
        fontSize: 15,
        color: Colors.blue,
      ),
      helperText: 'Helper text',
      suffixIcon: GestureDetector(
        onTap: iconTap,
        child: Icon(
          iconData,
          size: 20,
          color: Colors.blue,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: color),
      ),
    ),
  );
}
