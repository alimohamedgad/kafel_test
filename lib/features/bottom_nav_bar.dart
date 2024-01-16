// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kafel_project/core/app_color/app_color.dart';
import 'package:kafel_project/core/app_image/app_image.dart';
import 'package:kafel_project/features/countries/presentetion/view/screen/countries_screen.dart';
import 'package:kafel_project/features/services/presentetion/view/screens/services_screen.dart';
import 'package:kafel_project/features/who_am_i/view/screen/who_iam_screen.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int currentIndex = 0;

  onPageChange(int index) {
    currentIndex = index;
    setState(() {});
  }

  List<Widget> screen = [
    const WhoIamScreen(),
    const CountriesScreen(),
    const ServicesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          onPageChange(index);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.mainColor,
        unselectedItemColor: Colors.black.withOpacity(0.5),
        useLegacyColorScheme: false,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImage.userCircle,
              color: currentIndex == 0 ? Colors.green : Colors.grey,
            ),
            label: 'Who Am I',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImage.earth,
              color: currentIndex == 1 ? Colors.green : Colors.grey,
            ),
            label: "Countries",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImage.cart,
              color: currentIndex == 2 ? Colors.green : Colors.grey,
            ),
            label: "Services",
          ),
        ],
        currentIndex: currentIndex,
      ),
      body: screen[currentIndex],
    );
  }
}
