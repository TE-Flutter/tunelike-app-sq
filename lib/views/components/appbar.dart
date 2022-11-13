import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  const MyAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 26.0,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.deepOrange,
              width: 3.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: title,
      ),
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);
}
