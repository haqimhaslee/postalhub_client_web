import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:postalhub_tracker/pages/home/home.dart';
import 'package:postalhub_tracker/pages/inbox/inbox.dart';
import 'package:postalhub_tracker/pages/more/more_page.dart';
import 'package:url_launcher/url_launcher.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) => _showDialogMessage());
  }

  void _showDialogMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(Icons.info),
          title: const Text('Information'),
          content: const Text(
            'To access the latest features, please download our mobile app from the Play Store. The web version will continue to receive critical updates and fixes only.',
          ),
          actions: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _launchURL();
                  },
                  child: const Text('Download for Android'),
                ),
                const SizedBox(height: 10),
                FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _launchURL();
                  },
                  child: const Text('Download for iOS'),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Dismiss'),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  Future<void> _launchURL() async {
    const url =
        'https://play.google.com/store/apps/details?id=com.postalhub.tracker';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
                    icon: Icon(Icons.inbox_outlined),
                    selectedIcon: Icon(Icons.inbox_rounded),
                    label: 'Inbox',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.more_horiz_outlined),
                    selectedIcon: Icon(Icons.more_horiz_rounded),
                    label: 'More',
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
                        icon: Icon(Icons.inbox_outlined),
                        selectedIcon: Icon(Icons.inbox_rounded),
                        label: Text('Inbox'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.more_horiz_outlined),
                        selectedIcon: Icon(Icons.more_horiz_outlined),
                        label: Text('More'),
                      ),
                    ],
                  ),
                  const VerticalDivider(
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
                        label: Text('Inbox'),
                        icon: Icon(Icons.inbox_outlined),
                        selectedIcon: Icon(Icons.inbox_rounded),
                      ),
                      NavigationDrawerDestination(
                        icon: Icon(Icons.more_horiz_outlined),
                        selectedIcon: Icon(Icons.more_horiz_outlined),
                        label: Text('More'),
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
                  const VerticalDivider(
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
