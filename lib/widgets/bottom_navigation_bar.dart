import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TravelBottomNavigationBar extends StatefulWidget {
  const TravelBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<TravelBottomNavigationBar> createState() =>
      _TravelBottomNavigationBarState();
}

class _TravelBottomNavigationBarState extends State<TravelBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTap(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: BottomNavigationBar(
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: _onItemTap, 
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? SvgPicture.asset("assets/svg/icon_home_colored.svg")
                  : SvgPicture.asset("assets/svg/icon_home.svg"),label: "Home"),
          BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? SvgPicture.asset("assets/svg/icon_heart_colored.svg")
                  : SvgPicture.asset("assets/svg/icon_heart.svg"),label: "Favorite"),
          BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? SvgPicture.asset("assets/svg/icon_plus_colored.svg")
                  : SvgPicture.asset("assets/svg/icon_plus.svg"),label: "Add"),
          BottomNavigationBarItem(
              icon: _selectedIndex == 3
                  ? SvgPicture.asset("assets/svg/icon_notification_colored.svg")
                  : SvgPicture.asset("assets/svg/icon_notification.svg"),label: "notification"),
          BottomNavigationBarItem(
              icon: _selectedIndex == 4
                  ? SvgPicture.asset("assets/svg/icon_user_colored.svg")
                  : SvgPicture.asset("assets/svg/icon_user.svg"),label: "Account"),
        ],
      ),
    );
  }
}
