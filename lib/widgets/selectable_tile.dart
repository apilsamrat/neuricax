import '../core/constants/color_constants.dart';
import 'boxes.dart';
import 'package:flutter/material.dart';

class SelectableTile extends StatelessWidget {
  final IconData? icon;
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;
  final double width;
  const SelectableTile(
      {super.key,
      this.icon,
      required this.text,
      required this.isSelected,
      this.onTap,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: AnimatedContainer(
          width: width,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
          decoration: BoxDecoration(
            color: isSelected ? primaryColor : null,
            borderRadius: BorderRadius.circular(12),
            // border: Border.all(color: Colors.grey[300]!),
          ),
          duration: const Duration(milliseconds: 300),
          child: Row(
            children: [
              Visibility(
                visible: icon != null,
                child: Icon(
                  icon,
                  color: isSelected ? Colors.white : null,
                ),
              ),
              boxHor(10),
              Text(
                text,
                style: TextStyle(color: isSelected ? Colors.white : null),
              )
            ],
          )),
    );
  }
}
