import 'package:flutter/material.dart';
import 'package:movies_app/commons/constants/constants.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: Constants.primaryColor,
      unselectedItemColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.replay_outlined),
          label: 'Recent',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
      ],
    );
  }
}
