import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.obscureText,
    this.fillColor = const Color(0xFFFFFFFF),
    this.radius = 10,
    this.suffixIcon,
    this.labelText,
  });

  final TextEditingController controller;
  final bool obscureText;
  final String? labelText;
  final Widget? suffixIcon;
  final Color fillColor;
  final double radius;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: widget.controller,
      cursorColor: const Color(0xFF9747FF),
      obscureText: widget.obscureText,
      obscuringCharacter: '●',
      style: const TextStyle(
        color: Color(0xFF000000),
        fontSize: 14,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.fillColor,
        suffixIcon: widget.suffixIcon,
        suffixIconColor: const Color(0xFFB3B2B2),
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFF9747FF),
            width: 1,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Cannot be empty';
        }

        if (widget.labelText == 'Email') {
          if (!value.contains('@')) {
            return 'Invalid email';
          }
        }
        if (widget.labelText == 'Username') {
          if (value.length < 6) {
            return 'Username must be at least 6 characters';
          }
        }

        if (widget.labelText == 'Password') {
          if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
        }

        return null;
      },
    );
  }
}
