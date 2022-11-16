import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatefulWidget {
  const RoundedButtonWidget(
      {Key? key,
      this.minSize,
      required this.buttonText,
      required this.onPressed})
      : super(key: key);
  final Size? minSize;
  final String buttonText;
  final Function()? onPressed;
  @override
  // ignore: library_private_types_in_public_api
  _RoundedButtonWidgetState createState() => _RoundedButtonWidgetState();
}

class _RoundedButtonWidgetState extends State<RoundedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40))),
        backgroundColor: currentTheme.colorScheme.onSecondary,
        foregroundColor: currentTheme.colorScheme.onSurface,
        minimumSize: widget.minSize,
        elevation: 1,
        side: BorderSide(
          color: currentTheme.colorScheme.onSurface,
          width: 1,
        ),
      ),
      child: Text(widget.buttonText),
    );
  }
}
