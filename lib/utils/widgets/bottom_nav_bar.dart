import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import '../constants/export.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    this.onChange,
  }) : super(key: key);

  final void Function(int)? onChange;

  @override
  Widget build(BuildContext context) {
    return FluidNavBar(
      icons: [
        FluidNavBarIcon(
          icon: Icons.home,
        ),
        FluidNavBarIcon(
          icon: Icons.bloodtype_rounded,
        ),
      ],
      animationFactor: .3,
      style: const FluidNavBarStyle(
          barBackgroundColor: AppColor.white,
          iconSelectedForegroundColor: AppColor.primary,
          iconUnselectedForegroundColor: AppColor.grey),
      defaultIndex: 0,
      onChange: onChange,
    );
  }
}
