import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  final String iconImage;
  const SquareButton({super.key, required this.iconImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:65,
      width: 65,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.asset(iconImage),
    );
  }
}
