import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:postalhub_tracker/pages/home/home.dart';
import 'package:postalhub_tracker/pages/inbox/inbox.dart';
import 'package:postalhub_tracker/pages/more/more_page.dart';
import 'package:postalhub_tracker/pages/parcel_library/parcel_library.dart';
import 'package:postalhub_tracker/pages/reward_system/reward.dart';

class NavigatorServices extends StatefulWidget {
  const NavigatorServices({super.key});

  @override
  State<NavigatorServices> createState() => _NavigatorServicesState();
}

class _NavigatorServicesState extends State<NavigatorServices>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var _selectedIndex = 0;
  final List<Widget> _windgetOption = <Widget>[
    const HomePage(),
    const ParcelLibraryPage(),
    const Reward(),
    const Inbox(),
    const MorePage(),
  ];
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        bottomNavigationBar: MediaQuery.of(context).size.width <= 590
            ? NavigationBar(
                onDestinationSelected: (i) =>
                    setState(() => _selectedIndex = i),
                selectedIndex: _selectedIndex,
                destinations: const <Widget>[
                  NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home_rounded),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.inventory_2_outlined),
                    selectedIcon: Icon(Icons.inventory_2_rounded),
                    label: 'My Parcel',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.redeem_rounded),
                    selectedIcon: Icon(Icons.redeem_rounded),
                    label: 'Rewards',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.inbox_outlined),
                    selectedIcon: Icon(Icons.inbox_rounded),
                    label: 'Inbox',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person_outlined),
                    selectedIcon: Icon(Icons.person_rounded),
                    label: 'Profile',
                  ),
                ],
              )
            : null,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (MediaQuery.of(context).size.width > 590 &&
                MediaQuery.of(context).size.width <= 1279)
              Row(
                children: [
                  NavigationRail(
                    selectedIndex: _selectedIndex,
                    groupAlignment: 0,
                    onDestinationSelected: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    labelType: NavigationRailLabelType.all,
                    destinations: const <NavigationRailDestination>[
                      NavigationRailDestination(
                        icon: Icon(Icons.home_outlined),
                        selectedIcon: Icon(Icons.home_rounded),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.inventory_2_outlined),
                        selectedIcon: Icon(Icons.inventory_2_rounded),
                        label: Text('My Parcel'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.redeem_rounded),
                        selectedIcon: Icon(Icons.redeem_rounded),
                        label: Text('Rewards'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.inbox_outlined),
                        selectedIcon: Icon(Icons.inbox_rounded),
                        label: Text('Inbox'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.person_outlined),
                        selectedIcon: Icon(Icons.person_rounded),
                        label: Text('Profile'),
                      ),
                    ],
                  ),
                  VerticalDivider(
                    width: 0.5,
                  )
                ],
              ),
            if (MediaQuery.of(context).size.width > 1279)
              Row(
                children: [
                  NavigationDrawer(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    onDestinationSelected: (i) =>
                        setState(() => _selectedIndex = i),
                    selectedIndex: _selectedIndex,
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(28, 16, 16, 0),
                      ),
                      NavigationDrawerDestination(
                        label: Text('Home'),
                        icon: Icon(Icons.home_outlined),
                        selectedIcon: Icon(Icons.home_rounded),
                      ),
                      NavigationDrawerDestination(
                        label: Text('My Parcel'),
                        icon: Icon(Icons.inventory_2_outlined),
                        selectedIcon: Icon(Icons.inventory_2_rounded),
                      ),
                      NavigationDrawerDestination(
                        label: Text('Rewards'),
                        icon: Icon(Icons.redeem_rounded),
                        selectedIcon: Icon(Icons.redeem_rounded),
                      ),
                      NavigationDrawerDestination(
                        label: Text('Inbox'),
                        icon: Icon(Icons.inbox_outlined),
                        selectedIcon: Icon(Icons.inbox_rounded),
                      ),
                      NavigationDrawerDestination(
                        icon: Icon(Icons.person_outlined),
                        selectedIcon: Icon(Icons.person_rounded),
                        label: Text('Profile'),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(28, 10, 28, 10),
                        child: Divider(),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(28, 0, 28, 0),
                          child: Text(
                            "Copyright Campus Postal Hub ©",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(28, 0, 28, 16),
                          child: Text(
                            "All rights reserved",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  VerticalDivider(
                    width: 0.5,
                  )
                ],
              ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    screenWidth < 590 ? 0 : 30,
                  ),
                ),
                child: PageTransitionSwitcher(
                  transitionBuilder: (child, animation, secondaryAnimation) =>
                      SharedAxisTransition(
                    transitionType: SharedAxisTransitionType.vertical,
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  ),
                  child: _windgetOption.elementAt(_selectedIndex),
                ),
              ),
            )
          ],
        ));
  }
}
