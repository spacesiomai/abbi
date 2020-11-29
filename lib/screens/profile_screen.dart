import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/widgets/horizontal_place_item_small.dart';
import 'package:flutter_travel_concept/screens/main_screen.dart';
import 'package:flutter_travel_concept/screens/search_screen.dart';
import 'package:flutter_travel_concept/widgets/icon_badge.dart';
import 'package:flutter_travel_concept/util/places.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  PageController _pageController;
  int _page = 2;


  @override
  Widget build(BuildContext context) {

    return Scaffold(

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

      body: Column(

        children: <Widget>[
          Stack(

            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: <Widget>[
              Image(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 6,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1470104240373-bc1812eddc9f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb'),
              ),
              Positioned(
                bottom: -60.0,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/1.jpeg'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          ListTile(
            title: Center(child: Text('Heart Evangelista', style: TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w500),)),
            subtitle: Center(child: Text('Quezon City, Philippines',style: TextStyle(fontFamily: 'Poppins'))),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),

            alignment: Alignment.centerLeft,
            child: Text(
              "My Concerns",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              maxLines: 1,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 10.0, left: 20.0),
            height: 225.0,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              primary: false,
              itemCount: places == null ? 0.0 : places.length,
              itemBuilder: (BuildContext context, int index) {
                Map place = places.reversed.toList()[index];
                return HorizontalPlaceItem(place: place);
              },
            ),

          ),
          SizedBox(height: 10.0),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),

            alignment: Alignment.centerLeft,
            child: Text(
              "Recommended",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              maxLines: 1,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 10.0, left: 20.0),
            height: 225.0,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              primary: false,
              itemCount: places == null ? 0.0 : places.length,
              itemBuilder: (BuildContext context, int index) {
                Map place = places.reversed.toList()[index];
                return HorizontalPlaceItem(place: place);
              },
            ),

          ),
        ],

      ),

    );
  }


  Widget info() {
    return Column(
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: <Widget>[
            Image(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1470104240373-bc1812eddc9f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb'),
            ),
            Positioned(
              bottom: -60.0,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    'https://media-exp1.licdn.com/dms/image/C5103AQERluXghtGkhQ/profile-displayphoto-shrink_200_200/0?e=1586995200&v=beta&t=qkqcF4bKRi_HTWHTEUvZj3aNrgxy7Rsq61L8jvJGy6k'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 60,
        ),
        ListTile(
          title: Center(child: Text('Abdul Aziz Ahwan', style: TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w500),)),
          subtitle: Center(child: Text('Native Android & Flutter Developer',style: TextStyle(fontFamily: 'Poppins'))),
        ),
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.mail,
            color: Colors.white,
          ),
          label: Text(
            'Hire Me',
            style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
          ),
          color: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        ListTile(
          title: Text('About Me', style: TextStyle(fontFamily: 'Poppins')),
          subtitle: Text('Hi, I\'m Abdul Aziz Ahwan from Indonesia.\nI\'m an Android Developer for Company in Indonesia. Over 3 years of Experienced Software Development.\nI have serious passion for UI, and sometimes fullstack. Feel free to check my portfolio on abdulazizahwan.com', style: TextStyle(fontFamily: 'Poppins', letterSpacing: 1)),
        ),
      ],
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
        _page == page ? Theme.of(context).accentColor :  Color(0xFFD84339),
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
      {IconData icon = Icons.search, int page = 1, bool badge = false, onPressed}) {
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
      {IconData icon = Icons.person, int page = 2, bool badge = false, onPressed}) {
    return IconButton(
        icon: badge ? IconBadge(icon: icon, size: 24.0) : Icon(icon, size: 24.0),
        color:
        _page == page ? Theme.of(context).accentColor : Color(0xFFD84339),
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

