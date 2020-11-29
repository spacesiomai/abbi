import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/screens/home.dart';
import 'package:flutter_travel_concept/util/places.dart';
import 'package:flutter_travel_concept/screens/main_screen.dart';
import 'package:flutter_travel_concept/screens/profile_screen.dart';
import 'package:flutter_travel_concept/screens/view.dart';
import 'package:flutter_travel_concept/widgets/icon_badge.dart';
import 'package:flutter_travel_concept/widgets/horizontal_place_item.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  PageController _pageController;
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: List.generate(4, (index) => View()),
      ),



 bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 7.0),
            barIcon(icon: Icons.home),
            barIcon2(icon: Icons.search),
            barIcon3(icon: Icons.person),
            SizedBox(width: 7.0),


          ],
        ),
      ),
    );
  }



  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }



  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }


  Widget barIcon(
      {IconData icon = Icons.home, int page = 0, bool badge = false, onPressed}) {
    return IconButton(
      icon: badge ? IconBadge(icon: icon, size: 24.0) : Icon(icon, size: 24.0),
      color:
          _page == page ? Theme.of(context).accentColor : Color(0xFFD84339),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainScreen()),
          );
        }
    )
    ;
  }
  Widget barIcon2(
      {IconData icon = Icons.home, int page = 1, bool badge = false, onPressed}) {
    return IconButton(
      icon: badge ? IconBadge(icon: icon, size: 24.0) : Icon(icon, size: 24.0),
      color:
      _page == page ? Theme.of(context).accentColor :  Color(0xFFD84339),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchScreen()),
          );
        }
    )
    ;
  }

  Widget barIcon3(
      {IconData icon = Icons.home, int page = 2, bool badge = false, onPressed}) {
    return IconButton(
      icon: badge ? IconBadge(icon: icon, size: 24.0) : Icon(icon, size: 24.0),
      color:
      _page == page ? Theme.of(context).accentColor :  Color(0xFFD84339),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
        }
    )
    ;
  }


}

