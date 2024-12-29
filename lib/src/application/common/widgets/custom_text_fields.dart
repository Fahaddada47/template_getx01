import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../assets_helper/assets_path.dart';
import '../../styling/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Icon? suffixIcon;
  final bool? backGround;
  final VoidCallback? onSuffixIconPressed;
  final bool readOnly;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;

  const CustomTextField({
    Key? key,
    this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.backGround,
    this.onSuffixIconPressed,
    this.readOnly = false,
    this.maxLines,
    this.inputFormatters,
    this.initialValue,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;

    _controller = widget.controller ?? TextEditingController(text: widget.initialValue ?? '');
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(

        controller: _controller,
        decoration: InputDecoration(


          filled: true,
          fillColor: widget.backGround == true ? Color(0xffeeeeef) : white,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          labelStyle: const TextStyle(
            color: Color(0xff828290),
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color:antiFlashWhite),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color: antiFlashWhite),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color: antiFlashWhite),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color: Colors.redAccent),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color: Colors.redAccent),
          ),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          suffixIcon: widget.obscureText
              ? IconButton(
              icon:  SvgPicture.asset(
                _obscureText
                    ? AssetsPath.eyeOffIconSvg
                    : AssetsPath.eyeOpenIconSvg,
              ),
            onPressed: _toggleObscureText,
          )
              : null,
        ),
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        obscureText: _obscureText,
        maxLines: widget.maxLines ?? 1,
        readOnly: widget.readOnly,
        inputFormatters: widget.inputFormatters,
      ),
    );
  }
}
