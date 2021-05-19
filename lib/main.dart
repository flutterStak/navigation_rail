import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigation_rail/details.dart';
import 'package:navigation_rail/details1.dart';

import 'details2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: Colors.grey[900]),
        home: Scaffold(
          body: HomeScreen(),
        ));
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  Widget content = Details(0);

  NavigationRailDestination textDestination(
    String text,) {
    return NavigationRailDestination(
        icon: SizedBox.shrink(),
        label: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: RotatedBox(
              quarterTurns: -1,
              child: Text(
                text,
                style: GoogleFonts.quicksand(),
              ),)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: <Widget>[
            NavigationRail(
              minWidth: 55.0,
              groupAlignment: 0.0,
              selectedIndex: _selectedIndex,
              backgroundColor: Colors.orange,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                  if (_selectedIndex == 0) {
                    content = Details(_selectedIndex);
                  }
                  if (_selectedIndex == 1) {
                    content = Details1(_selectedIndex);
                  }
                  if (_selectedIndex == 2) {
                    content = Details2(_selectedIndex);
                  }
                });
              },
              labelType: NavigationRailLabelType.all,
              leading: Column(
                children: <Widget>[
                  SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage("assets/images/man2.png")),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  RotatedBox(
                    quarterTurns: -1,
                    child: Icon(
                      Icons.dashboard,
                      color: Color(0xffFCCFA8),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RotatedBox(
                    quarterTurns: -1,
                    child: Icon(Icons.date_range),
                  )
                ],
              ),
              selectedLabelTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 1,
                decorationThickness: 2.0,
              ),
              unselectedLabelTextStyle: TextStyle(
                  fontSize: 13, letterSpacing: 0.8, color: Color(0xff2E2D43)),
              destinations: [
                textDestination(
                  "Home",
                ),
                textDestination(
                  "Favorite",
                ),
                textDestination(
                  "Library",
                ),
              ],
            ),
            content,
          ],
        ),
      ),
    );
  }
}
