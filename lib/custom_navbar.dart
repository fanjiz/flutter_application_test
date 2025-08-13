import 'package:flutter/material.dart';

class MyNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const MyNavbar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0, // hilangkan bayangan
      backgroundColor: Colors.transparent, // benar-benar transparan
      currentIndex: selectedIndex,
      onTap: onTap,
      selectedItemColor: const Color.fromARGB(255, 64, 141, 192),
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}
