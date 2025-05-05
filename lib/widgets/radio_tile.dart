import 'package:flutter/material.dart';
import 'package:neuricax/core/constants/color_constants.dart';

class CustomRadioTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function onTap;

  const CustomRadioTile({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        onTap: () => onTap(),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(width: !isSelected ? 1 : 0, color: Colors.grey)),
        tileColor: Colors.transparent,
        selectedTileColor: primaryColor.withValues(alpha:0.4),
        selected: isSelected,
      ),
    );
  }
}
