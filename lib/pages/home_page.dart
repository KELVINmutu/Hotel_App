import 'package:bwa_cozy/models/city.dart';
import 'package:bwa_cozy/models/space.dart';
import 'package:bwa_cozy/models/tips.dart';
import 'package:bwa_cozy/notification_handler.dart';
import 'package:bwa_cozy/pages/splash_page.dart';
import 'package:bwa_cozy/providers/space_provider.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/city_card.dart';
import 'package:bwa_cozy/widgets/space_card.dart';
import 'package:bwa_cozy/widgets/tips_card.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bwa_cozy/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../auth.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  final String nama;
  const HomePage({Key key, this.nama}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    var initializationSettingAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSetting =
        InitializationSettings(android: initializationSettingAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSetting);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // debugPrint("true");
      // debugPrint("Kamu menerima pesan! ${message.notification?.title}");
      // debugPrint("${message.notification?.body}");
      // RemoteNotification notification = message.notification;
      // AndroidNotification android = message.notification?.android;
      // print(notification);
      // print(android);
      // if (notification != null && android != null) {
      //   // ignore: missing_return
      //   showDialog(
      //       builder: (_) {
      //         return AlertDialog(
      //           title: Text(notification.title),
      //           content: SingleChildScrollView(
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [Text(notification.body)],
      //             ),
      //           ),
      //         );
      //       },
      //       context: null);
      // }
      //  await Firebase.initializeApp();
      debugPrint("Kamu menerima pesan! ${message.notification?.title}");
      debugPrint("${message.notification?.body}");
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              icon: android?.smallIcon,
              // color: Colors.red,
              playSound: true,
              // priority: Priority.max,
              // importance: Importance.max,
            ),
          ),
        );
      }
      // showSimpleNotification(
      //   Text(notification.title),
      //   subtitle: Text(notification.body),
      //   background: Colors.blue,
      //   duration: Duration(seconds: 3),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    final List _name = [
      'Jakarta',
      'Bandung',
      'Surabaya',
      'Palembang',
      'Aceh',
      'Bogor'
    ];
    final List _imageUrl = [
      'assets/city1.png',
      'assets/city2.png',
      'assets/city3.png',
      'assets/city4.png',
      'assets/city5.png',
      'assets/city6.png'
    ];
    final List _id = [1, 2, 3, 4, 5, 6];
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            // NOTE : TITLE/HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: edge,
                  ),
                  child: Text(
                    'Explore Now',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: GestureDetector(
                    onTap: () async {
                      AuthenticationService service =
                          AuthenticationService(FirebaseAuth.instance);
                      bool res = await service.logout();
                      if (res) {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.remove("isUser");
                        await prefs.remove("user_id");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      }
                      //   SharedPreferences prefs =
                      //       await SharedPreferences.getInstance();
                      //   prefs.remove('isUser');
                      //   Navigator.pushReplacement(
                      //       context, MaterialPageRoute(builder: (c) => MyApp()));
                    },
                    //() => {
                    // Navigator.push(context,MaterialPageRoute(builder: (context) => SplashPage()))
                    //},
                    child: Text(
                      "LogOut",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Selamat Datang,${widget.nama}',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE : POPULAR CITIES
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _id.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 24, left: 14),
                    child: CityCard(
                      City(
                        id: _id[index],
                        name: _name[index],
                        imageUrl: _imageUrl[index],
                        isPopular:
                            _id[index] == 2 || _id[index] == 5 ? true : false,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE : RECOMMENDED SPACE
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Recommended Space ',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: FutureBuilder(
                future: spaceProvider.getRecommendedSpaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data;

                    int index = 0;

                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 30,
                          ),
                          child: SpaceCard(item),
                        );
                      }).toList(),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE : TIPS & GUIDANCE
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Tips & Guidance ',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: Column(
                children: [
                  TipsCard(
                    Tips(
                      id: 1,
                      title: 'City Guidelines',
                      imageUrl: 'assets/tips1.png',
                      updatedArt: '20 Apr',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    Tips(
                      id: 2,
                      title: 'Jakarta Fairship',
                      imageUrl: 'assets/tips2.png',
                      updatedArt: '11 Dec',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: edge,
            ),
          ],
        ),
      ),
    );
  }
}
