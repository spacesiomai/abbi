import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/widgets/horizontal_place_item.dart';
import 'package:flutter_travel_concept/screens/main_screen.dart';
import 'package:flutter_travel_concept/screens/profile_screen.dart';
import 'package:flutter_travel_concept/screens/search_screen.dart';
import 'package:flutter_travel_concept/widgets/icon_badge.dart';
import 'package:flutter_travel_concept/util/places.dart';
import 'package:getwidget/getwidget.dart';


class DiscussionScreen extends StatefulWidget {
  @override
  _DiscussionScreenState createState() => _DiscussionScreenState();
}

class _DiscussionScreenState extends State<DiscussionScreen> {
  PageController _pageController;
  int _page = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton.extended(

        label: Text("New Comment"),

        onPressed: () {
          //action here
        },

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

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

          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "TRAFFIC MANAGEMENT",
              style: TextStyle(

                fontSize: 25.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(height:10.0),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),

            alignment: Alignment.centerLeft,
            child: Text(
              "PINNED BY AUTHOR",
              style: TextStyle(

                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              maxLines: 1,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height:10.0),

          GFListTile(
              avatar:GFAvatar(),
              titleText:'Title',
              subtitleText:'Not to mention, the stoplights they recently installed are not even helping the traffic issue...',
              icon: Icon(Icons.reply_rounded)
          ),
          SizedBox(height:10.0),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),

            alignment: Alignment.centerLeft,
            child: Text(
              "DISCUSSION",
              style: TextStyle(

                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              maxLines: 1,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height:10.0),
          GFListTile(
              avatar:GFAvatar(),
              titleText:'Title',
              subtitleText:'Not to mention, the stoplights they recently installed are not even helping the traffic issue...',
              icon: Icon(Icons.reply_rounded)
          ),
          GFListTile(
              avatar:GFAvatar(),
              titleText:'Title',
              subtitleText:'Not to mention, the stoplights they recently installed are not even helping the traffic issue...',
              icon: Icon(Icons.reply_rounded)
          ),
          GFListTile(
              avatar:GFAvatar(),
              titleText:'Title',
              subtitleText:'Not to mention, the stoplights they recently installed are not even helping the traffic issue...',
              icon: Icon(Icons.reply_rounded)
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
          title: Center(child: Text('Discussion Screen', style: TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w500),)),
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

