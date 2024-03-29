import 'package:bwa_cozy/notification_handler.dart';
import 'package:bwa_cozy/pages/chat_page.dart';
import 'package:bwa_cozy/pages/create_page.dart';
import 'package:bwa_cozy/pages/home_page.dart';
import 'package:bwa_cozy/pages/wishlist_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/dummy_data.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  int currentIndex = 0;
  var getname = "";
  getName() async {
    final prefs = await SharedPreferences.getInstance();
    // if (prefs.getInt("user_id") != null) {
    //   var id = prefs.getInt("user_id");
    //   var data = DummyData.data;
    //   for (var item in data) {
    //     if (item.containsValue(id)) {
    //       setState(() {
    //         getname = item['nama'];
    //         print(getname);
    //       });
    //     }
    //   }
    // }
    if (prefs.getString("displayName") != null) {
      var displayName = prefs.getString("displayName");
      setState(() {
        getname = displayName.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // FirebaseMessaging.onMessage.listen(RemoteMessage message ());
    getName();
  }

  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xffF6F7F8),
          currentIndex: currentIndex,
          onTap: (value) {
            print(value);
            setState(() {
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/icon_home.png',
                    width: 30,
                    color: currentIndex == 0 ? Colors.purple : Colors.grey,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/icon_mail.png',
                    width: 30,
                    color: currentIndex == 1 ? Colors.purple : Colors.grey,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/icon_card.png',
                    width: 30,
                    color: currentIndex == 2 ? Colors.purple : Colors.grey,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/icon_love.png',
                    width: 30,
                    color: currentIndex == 3 ? Colors.purple : Colors.grey,
                  ),
                ),
                label: ''),
          ],
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage(
            nama: getname,
          );
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return CreatePage();
          break;
        case 3:
          return WishlistPage();
          break;
        default:
      }
    }

    ;

    return Scaffold(
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
