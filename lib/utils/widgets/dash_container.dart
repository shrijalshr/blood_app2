import 'package:flutter/material.dart';

class DashContainer extends StatelessWidget {
  const DashContainer(
      {Key? key,
      this.child,
      this.color = Colors.white,
      this.width,
      this.height,
      this.padding,
      this.border,
      this.borderRadius,
      this.margin})
      : super(key: key);

  final Widget? child;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxBorder? border;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color!,
        borderRadius: BorderRadius.circular(borderRadius ?? 5),
        border: border,
      ),
      width: width,
      child: child,
    );
  }
}
