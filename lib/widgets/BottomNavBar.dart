import 'package:doctor_appointment_app/Pages/HomePage.dart';
import 'package:doctor_appointment_app/Pages/LocationPage.dart';
import 'package:doctor_appointment_app/Pages/MyBookings.dart';
import 'package:doctor_appointment_app/Pages/ProfilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;
  const BottomNavBar({super.key, this.initialIndex = 0});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final NavigationController controller = Get.put(NavigationController());

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      controller.selectedIndex.value = widget.initialIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 70,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(
              icon: controller.selectedIndex.value == 0 ? Icon(Iconsax.home_15) : Icon(Iconsax.home),
              label: '',
            ),
            NavigationDestination(
              icon: controller.selectedIndex.value == 1 ? Icon(Iconsax.location5) : Icon(Iconsax.location),
              label: '',
            ),
            NavigationDestination(
              icon: controller.selectedIndex.value == 2 ? Icon(Iconsax.calendar5) : Icon(Iconsax.calendar_1),
              label: '',
            ),
            NavigationDestination(
              icon: controller.selectedIndex.value == 3 ? Icon(Icons.person) : Icon(Iconsax.user),
              label: '',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [const HomePage(), const LocationPage(), const MyBookings(), const ProfilePage()];
}
