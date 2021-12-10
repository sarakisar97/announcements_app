import 'package:announcements_app/views/components/components.dart';
import 'package:flutter/material.dart';

class SubmitButton extends DefaultElevatedButton{
  SubmitButton({
    Key? key,
    required Widget? child,
    required void Function()? onPressed})
      :super(
      key: key,
      child: child,
      onPressed: onPressed,
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50))
      )
  );
}