import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/util/concerns.dart';

import 'package:flutter_travel_concept/widgets/horizontal_place_item.dart';
import 'package:flutter_travel_concept/widgets/icon_badge.dart';
import 'package:flutter_travel_concept/widgets/search_bar.dart';
import 'package:flutter_travel_concept/widgets/vertical_place_item.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD84339),
        actions: <Widget>[

          IconButton(
            icon: IconBadge(
              icon: Icons.menu,
            ),
            onPressed: () {
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[

/*          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Sabihin kay Abbi!",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          */

          Padding(
            padding: EdgeInsets.all(20.0),
            child: SearchBar(),
          ),
          //buildHorizontalList(context),
          buildVerticalList(),
        ],
      ),
    );
  }

/*
  buildHorizontalList(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: 260.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: concerns == null ? 0.0 : concerns.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = concerns.reversed.toList()[index];
          return HorizontalPlaceItem(place: place);
        },
      ),
    );
  }
*/

  buildVerticalList() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ListView.builder(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: concerns == null ? 0 : concerns.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = concerns[index];
          return VerticalPlaceItem(place: place);
        },
      ),
    );
  }
}
