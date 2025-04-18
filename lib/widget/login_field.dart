import 'package:flutter/material.dart';
import 'package:hive_crud/utils/Palette.dart';

class LoginField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final TextInputType? keyboardType;
  final bool isPassword;
  final FormFieldValidator validator;

  const LoginField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.icon,
    this.keyboardType,
    this.isPassword = false,
    required this.validator,
  }) : super(key: key);

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  late bool _isPassword;

  @override
  void initState() {
    super.initState();
    _isPassword = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: _isPassword,
        validator: widget.validator,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          suffixIcon:
              widget.keyboardType == TextInputType.visiblePassword
                  ? Padding(
                    padding: EdgeInsets.only(right: 12.0),
                    child: IconButton(
                      icon: Icon(
                        _isPassword ? Icons.visibility_off : Icons.visibility,
                        color: const Color.fromARGB(255, 170, 170, 170),
                      ),
                      onPressed: () {
                        setState(() {
                          _isPassword = !_isPassword;
                        });
                      },
                    ),
                  )
                  : null,
          contentPadding: const EdgeInsets.all(27),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Pallete.borderColor, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Pallete.whiteColor, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          errorStyle: TextStyle(color: Colors.redAccent, height: 3),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.redAccent, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
