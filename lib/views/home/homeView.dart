import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mooc/controllers/authController.dart';
import 'package:mooc/controllers/homeController.dart';
import 'package:mooc/controllers/signInController.dart';
import 'package:mooc/tools/customWidget.dart';
import 'package:mooc/tools/hexColor.dart';

class HomeView extends StatelessWidget {
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            Obx(() => buildText(homeController.getEmail(), Colors.white, 18)),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(
      () => new BottomNavigationBar(
        elevation: 48,
        type: BottomNavigationBarType.fixed,
        currentIndex: homeController.cIndex.value,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.red[100],
        onTap: (value) => homeController.changeScreen(value),
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.star_border, size: 32),
//              icon: SvgPicture.asset('assets/icons/home.svg'),
              label: 'Featured'),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.search, size: 32), label: 'Search'),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.play_circle_fill_outlined, size: 32),
              label: 'My learning'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                size: 32,
              ),
              label: 'Wishlist'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_pin,
                size: 32,
              ),
              label: 'Account'),
        ],
      ),
    );
  }
}
