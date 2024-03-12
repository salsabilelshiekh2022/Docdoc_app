import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_assets.dart';
import 'home_page.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  late PersistentTabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      Container(),
      Container(),
      Container(),
      Container(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            AppAssets.homeIcon,
            color:
                _controller.index == 0 ? AppColors.mainBlue : AppColors.gray24,
          ),
          iconSize: 24,
          activeColorSecondary: AppColors.mainBlue,
          inactiveColorSecondary: AppColors.gray24,
          onPressed: (index) {
            setState(() {
              _controller.index = 0;
            });
          }),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            AppAssets.messageIcon,
            color:
                _controller.index == 1 ? AppColors.mainBlue : AppColors.gray24,
          ),
          activeColorPrimary: AppColors.mainBlue,
          inactiveColorPrimary: AppColors.gray24,
          iconSize: 22,
          onPressed: (index) {
            setState(() {
              _controller.index = 1;
            });
          }),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            AppAssets.searchIcon,
          ),
          activeColorPrimary: AppColors.mainBlue,
          inactiveColorPrimary: AppColors.gray24,
          iconSize: 24,
          onPressed: (index) {
            setState(() {
              _controller.index = 2;
            });
          }),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppAssets.calendarIcon,
          color: _controller.index == 3 ? AppColors.mainBlue : AppColors.gray24,
        ),
        onPressed: (index) {
          setState(() {
            _controller.index = 3;
          });
        },
        activeColorPrimary: AppColors.mainBlue,
        inactiveColorPrimary: AppColors.gray24,
        iconSize: 24,
        textStyle: const TextStyle(fontSize: 10),
      ),
      PersistentBottomNavBarItem(
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              AppAssets.homeDoctor,
              width: 24,
              height: 24,
              fit: BoxFit.fitHeight,
            ),
          ),
          // title: S.of(context).profile,
          activeColorPrimary: AppColors.mainBlue,
          inactiveColorPrimary: AppColors.gray24,
          iconSize: 24,
          onPressed: (index) {
            setState(() {
              _controller.index = 4;
            });
          }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(12.0),
            colorBehindNavBar: Colors.white,
            boxShadow: [
              const BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  blurStyle: BlurStyle.solid),
            ]),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style15,

        // Choose the nav bar style with this property.
      ),
    );
  }
}
