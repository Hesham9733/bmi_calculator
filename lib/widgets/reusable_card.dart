import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GenderCard extends StatelessWidget {
  String? gender;
  IconData? iconGender;
  Color? cardColor;
  Color? textColor;
  Color? iconColor;

  GenderCard(
      {Key? key, this.gender, this.cardColor,this.iconColor, this.textColor, this.iconGender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 190,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Icon(iconGender, size: 90, color: iconColor),
          Text(
            gender.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
