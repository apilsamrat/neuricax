import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget? leading, title, subtitle, trailing;
  final double? leadingWidth;
  final double? trailingWidth;

  final EdgeInsetsGeometry? contentPadding;
  final bool? enabled;
  final GestureTapCallback? onTap, subtitleOnTap;
  final GestureLongPressCallback? onLongPress;

  const CustomListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.contentPadding,
    this.enabled,
    this.onTap,
    this.onLongPress,
    this.leadingWidth,
    this.trailingWidth,
    this.subtitleOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {},
      onTap: () {},
      child: Container(
        padding: contentPadding,
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
                mainAxisSize: MainAxisSize.max,
                spacing: 5,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: title ?? SizedBox.shrink(),
                  ),

                  InkWell(
                    onTap: subtitleOnTap,
                    child: Padding(
                      padding: EdgeInsets.all(3),
                      child: subtitle ?? SizedBox.shrink(),
                    ),
                  ),
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
