import 'package:announcements_app/utils/utils.dart';
import 'package:announcements_app/views/components/components.dart';
import 'package:flutter/material.dart';

class PasswordFormTextField extends StatefulWidget {
  final void Function(String?)? onSaved;
  final String labelText;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;

  const PasswordFormTextField({Key? key, required this.onSaved, required this.labelText, this.textInputAction, this.validator}) : super(key: key);
  @override
  _PasswordFormTextFieldState createState() => _PasswordFormTextFieldState();
}

class _PasswordFormTextFieldState extends State<PasswordFormTextField> {
  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTextFormField(
      obscureText: isHide ? true : false,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye, color: isHide ? Colors.grey : AppColors.primary,), onPressed: () {
          setState(() {
            isHide = !isHide;
          });
        },),
      ),
      validator: widget.validator,
      onSaved: widget.onSaved,
    );
  }
}
