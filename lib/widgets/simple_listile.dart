import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'description_text.dart';

class SimpleListTile extends StatelessWidget {
  final String title, subtitle;
  final Widget? trailing, leading;
  final EdgeInsetsGeometry? contentPadding;
  final GestureTapCallback? onTap;

  const SimpleListTile({
    super.key,
    this.leading,
    this.title = "",
    this.subtitle = "",
    this.trailing,
    this.contentPadding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {},
      onTap: () {},
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            //Leading
            leading ?? SizedBox.shrink(),
            //Title and Subtitle
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Account Settings",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  descriptionText(subtitle, size: 14),
                ],
              ),
            ),
            //Trailing
            trailing ?? SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
