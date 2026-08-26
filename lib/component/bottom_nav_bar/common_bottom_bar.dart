import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constants/app_colors.dart';

final List<String> _titles = [
  'Tasbih',
  'Learn',
  'Du’a',
  'Habit',
];

final List<Widget> _unselectedIcons = [
  const Icon(Icons.settings_outlined, color: AppColors.black),
  const Icon(Icons.notifications_outlined, color: AppColors.black),
  const Icon(Icons.chat, color: AppColors.black),
  const Icon(Icons.person_2_outlined, color: AppColors.black),
];

final List<Widget> _selectedIcons = [
  const Icon(Icons.settings_outlined, color: AppColors.primaryColor),
  const Icon(Icons.notifications, color: AppColors.primaryColor),
  const Icon(Icons.chat, color: AppColors.primaryColor),
  const Icon(Icons.person, color: AppColors.primaryColor),
];

class CommonBottomNavBar extends StatelessWidget {
  const CommonBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.blueLight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_unselectedIcons.length, (index) {
            final isSelected = index == currentIndex;
            return InkWell(
              onTap: () => onTap(index),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    isSelected ? _selectedIcons[index] : _unselectedIcons[index],
                    SizedBox(height: 4.h),
                    Text(
                      _titles[index],
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? AppColors.primaryColor : AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}