import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/features/profile/presentation/screen/profile_screen.dart';
import 'package:untitled/features/message/presentation/screen/chat_screen.dart';
import 'package:untitled/component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../features/notifications/presentation/screen/notifications_screen.dart';
import '../../../features/setting/presentation/screen/setting_screen.dart';
import '../controller/dashboard_controller.dart';

class DashboardScreen extends GetView<DashboardController> {

  const DashboardScreen({super.key});

  final List<Widget> screens = const [

    ChatListScreen(),
    NotificationScreen(),
    ProfileScreen(),
    SettingScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: screens,
        ),
      ),
      bottomNavigationBar: Obx(
        () => CommonBottomNavBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) => controller.changeIndex(index),
        ),
      ),
    );
  }
}




