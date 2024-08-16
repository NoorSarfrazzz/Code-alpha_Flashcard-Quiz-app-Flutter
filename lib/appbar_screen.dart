import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF142A70),
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5), // Add left space
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF142A70),
            borderRadius: BorderRadius.circular(26),
          ),
          child: Image.asset('assets/images/appbar-icon.png',),
        ),
      ),
      title: Text(
          'Flashcard Quiz',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w500,
            color: Colors.white,
        ),
      ),
    );
  }
}
