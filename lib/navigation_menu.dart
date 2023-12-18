import 'package:dicoding_restaurant_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'common/widgets/upcoming_screen/upcoming_screen.dart';
import 'features/authentication/screens/home/home_screen.dart';
import 'utils/constants/colors.dart';
import 'utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigatorController());
    final darkMode = DHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? DColors.black : Colors.white,
          indicatorColor: darkMode
              ? DColors.white.withOpacity(0.1)
              : DColors.black.withOpacity(0.1),
          destinations: [
            NavigationDestination(
              icon: Icon(
                Iconsax.home,
                color: controller.selectedIndex.value == 0
                    ? DColors.primary
                    : DColors.black,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                Iconsax.shop,
                color: controller.selectedIndex.value == 1
                    ? DColors.primary
                    : DColors.black,
              ),
              label: 'Store',
            ),
            NavigationDestination(
              icon: Icon(
                Iconsax.user,
                color: controller.selectedIndex.value == 2
                    ? DColors.primary
                    : DColors.black,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(
        () => controller.screen[controller.selectedIndex.value],
      ),
    );
  }
}

class NavigatorController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screen = [
    const HomeScreen(),
    const UpcomingScreen(
      image: DImages.upComingImage,
      title: 'Upcoming..',
      subTitle: '',
    ),
    const UpcomingScreen(
      image: DImages.upComingImage,
      title: 'Upcoming..',
      subTitle: '',
    ),
  ];
}
