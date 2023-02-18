import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield(
      {super.key,
      required this.hint,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.errorText,
      required this.controller});

  final String hint;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final TextEditingController controller;
  final String? errorText;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 75,
      child: TextFormField(
        controller: widget.controller,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return widget.errorText;
          } else if (value.isNotEmpty) return null;
        },
        style: TextStyle(color: Constants.primaryColor),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Constants.primaryColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Constants.primaryColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Constants.btnPrimColor),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Constants.errorColor),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            hintText: widget.hint,
            hintStyle: TextStyle(color: Constants.primaryColor),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon),
        cursorColor: Constants.btnPrimColor,
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.label,
    required this.prefixIcon,
    required this.controller,
  });

  final String label;
  final Widget prefixIcon;
  final TextEditingController controller;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 75,
      child: TextFormField(
        controller: widget.controller,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Password field cannot be empty';
          } else if (!value.contains(RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))) {
            return 'Enter a valid password';
          }
        },
        style: TextStyle(color: Constants.primaryColor),
        obscureText: _isHidden,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Constants.primaryColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Constants.primaryColor),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Constants.btnPrimColor),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Constants.errorColor),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            hintText: widget.label,
            hintStyle: TextStyle(color: Constants.primaryColor),
            prefixIcon: widget.prefixIcon,
            suffixIcon: InkWell(
              onTap: _togglePasswordView,
              child: Icon(
                _isHidden ? Icons.visibility_off : Icons.visibility,
                color: Constants.primaryColor,
              ),
            )),
        cursorColor: Constants.btnPrimColor,
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}

class SearchField extends StatefulWidget {
  const SearchField(
      {super.key,
      required this.hint,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.errorText,
      required this.controller});

  final String hint;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final TextEditingController controller;
  final String? errorText;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 3,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 35,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          controller: widget.controller,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return widget.errorText;
            } else if (value.isNotEmpty) return null;
          },
          style: TextStyle(color: Constants.primaryColor),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Constants.btnPrimColor,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Constants.btnPrimColor,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Constants.btnPrimColor),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Constants.errorColor),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              hintText: widget.hint,
              hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon),
          cursorColor: Constants.secondaryColor,
        ),
      ),
    );
  }
}
