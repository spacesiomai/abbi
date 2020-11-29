import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/util/concerns.dart';
import 'package:getwidget/getwidget.dart';

import 'package:flutter_travel_concept/widgets/horizontal_place_item_big.dart';
import 'package:flutter_travel_concept/widgets/icon_badge.dart';
import 'package:flutter_travel_concept/widgets/search_bar.dart';
import 'package:flutter_travel_concept/widgets/vertical_place_item.dart';

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: GFAppBar(
        backgroundColor: Color(0xFFD84339),
        searchBar: true,
        actions: <Widget>[
          GFIconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {},
            type: GFButtonType.transparent,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[

          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Top",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w900,
              ),
            ),
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
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: 260.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        primary: false,
        itemCount: concerns == null ? 0.0 : places.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = places.reversed.toList()[index];
          return VerticalPlaceItem(place: place);
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
          return HorizontalPlaceItemBig(place: place);
        },
      ),
    );
  }
}
