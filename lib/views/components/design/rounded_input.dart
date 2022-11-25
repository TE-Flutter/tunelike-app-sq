import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedInputWidget extends StatefulWidget {
  const RoundedInputWidget(
      {Key? key,
      this.labelText,
      this.hintText,
      this.prefixIcon,
      this.maxLines = 1,
      this.keyboardType,
      this.controller,
      this.isPassword,
      this.inputFormatters,
      this.validateFunction,
      this.validateMode})
      : super(key: key);
  final String? labelText;
  final String? hintText;
  final bool? isPassword;
  final IconData? prefixIcon;
  final int maxLines;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? validateMode;
  final String? Function(String?)? validateFunction;

  @override
  // ignore: library_private_types_in_public_api
  _RoundedInputWidgetState createState() => _RoundedInputWidgetState();
}

class _RoundedInputWidgetState extends State<RoundedInputWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    return TextFormField(
      controller: widget.controller,
      autovalidateMode: widget.validateMode,
      inputFormatters: widget.inputFormatters,
      validator: widget.validateFunction,
      obscureText: widget.isPassword ?? false,
      obscuringCharacter: '★',
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          fontFamily: 'Lexend Deca',
          color: currentTheme.colorScheme.onPrimary,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontFamily: 'Lexend Deca',
          color: currentTheme.colorScheme.surface,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFDBE2E7),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFDBE2E7),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: currentTheme.colorScheme.error,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: currentTheme.colorScheme.error,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        errorStyle: TextStyle(
          color: currentTheme.colorScheme.error,
          fontSize: 11,
        ),
        filled: true,
        fillColor: currentTheme.colorScheme.onSecondary,
        contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
        prefixIcon: Container(
          width: 0,
          alignment: const Alignment(0.45, 0.0),
          child: Icon(
            widget.prefixIcon,
            color: currentTheme.colorScheme.onSurface,
          ),
        ),
      ),
      style: TextStyle(
        fontFamily: 'Arsenal',
        color: currentTheme.colorScheme.onSurface,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType,
    );
  }
}
