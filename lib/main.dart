import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nishan/appbar/calendar.dart';
import 'package:nishan/appbar/menu.dart';
import 'package:nishan/appbar/noticelist.dart';
import 'package:nishan/appbar/user.dart';
import 'package:nishan/splash.dart';

import 'setting.dart';

AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.high,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

// /// Create an Android Notification Channel.
// ///
// /// We use this channel in the `AndroidManifest.xml` file to override the
// /// default FCM channel to enable heads up notifications.
// await flutterLocalNotificationsPlugin
//     .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>()
//     ?.createNotificationChannel(channel);

// /// Update the iOS foreground notification presentation options to allow
// /// heads up notifications.
// await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//   alert: true,
//   badge: true,
//   sound: true,
// );
const isFlutterLocalNotificationsInitialized = true;
Key refreshKey = UniqueKey();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyAgQdvx6bbeaHy-czeayqj5Q928BOOxz-k',
        appId: '1:100785927875:android:aefa45ca2061e2afcb5476',
        messagingSenderId: '100785927875',
        projectId: 'school-16d56',
        databaseURL: "https://school-16d56-default-rtdb.firebaseio.com/",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(MaterialApp(
    key: refreshKey,
    home: const splash(),
    debugShowCheckedModeBanner: false,
  ));
}

class ak extends StatelessWidget {
  const ak({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int pageIndex = 0;

    return  MaterialApp(
      title: 'Bottom NavBar Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key,});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = 'Home';

  int pageIndex = 0;

  final pages = [
    const page1(),
    const page2(),
    const page3(),
    const page4(),
  ];
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: const Color.fromARGB(255, 244, 248, 245),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child:
              CircleAvatar(radius: 40, child: Image.asset('asset/logo1.png')),
        ),
        title: Text(
          name,
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  pageIndex = 1;
                  name = 'Calender';
                });
              },
              child: Image.asset(
                'asset/calendar.png',
                height: 25,
                width: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  pageIndex = 2;
                  name = 'Notification';
                });
              },
              child: Image.asset(
                'asset/bell.png',
                height: 25,
                width: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              child: Image.asset(
                'asset/notebook.png',
                height: 25,
                width: 25,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const setting()));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                child: Image.asset(
                  'asset/settings.png',
                  height: 25,
                  width: 25,
                ),
              ),
            ),
          )
        ],
      ),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex = 0;
                        name = 'Home';
                      });
                    },
                    child: pageIndex == 0
                        ? Container(
                            decoration: BoxDecoration(
                                color: Colors.red.shade300,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Home',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        : const Image(
                            image: AssetImage('asset/house.png'),
                            height: 30,
                            width: 30,
                          )),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex = 1;
                        name = 'Calender';
                      });
                    },
                    child: pageIndex == 1
                        ? Container(
                            decoration: BoxDecoration(
                                color: Colors.green.shade300,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Calender',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        : const Image(
                            image: AssetImage('asset/calendar.png'),
                            height: 30,
                            width: 30,
                          )),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex = 2;
                        name = 'Notification';
                      });
                    },
                    child: pageIndex == 2
                        ? Container(
                            decoration: BoxDecoration(
                                color: Colors.blue.shade300,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Notification',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        : const Image(
                            image: AssetImage('asset/bell.png'),
                            height: 30,
                            width: 30,
                          )),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex = 3;
                        name = 'Menu';
                      });
                    },
                    child: pageIndex == 3
                        ? Container(
                            decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Menu',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        : const Image(
                            image: AssetImage('asset/profile.png'),
                            height: 30,
                            width: 30,
                          )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
