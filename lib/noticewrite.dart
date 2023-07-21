// Crude counter to make messages unique
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nishan/main.dart';

final databaseRef = FirebaseDatabase.instance.ref("Notice");
final Title = TextEditingController();
final body = TextEditingController();

class notice extends StatefulWidget {
  const notice({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _noticeState createState() => _noticeState();
}

class _noticeState extends State<notice> {
  messagenotice() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Notice sent'),
            content: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('Sure you want to sent notice')],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const notice(),
                      ));
                },
                child: const Text(
                  'CANCEL',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: showNotification,
                child: const Text(
                  'ACCEPT',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                color: Colors.blue,
                playSound: true,
                icon: 'asset/',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return const AlertDialog(
                title: Text('Notice sent'),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('Sure you want to sent notice')],
                  ),
                ),
              );
            });
      }
    });
  }

  void showNotification() {
    flutterLocalNotificationsPlugin.show(
        0,
        Title.text.toString(),
        body.text.toString(),
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                channelDescription: channel.description,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Notice',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: Title,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.edit),
                    hintText: 'Title',
                    hintStyle: TextStyle(color: Colors.red),
                  ),
                  validator: (value) {
                    if (value != null && value.length < 3) {
                      return 'field is empty';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  maxLength: 200,
                  controller: body,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.edit),
                    hintText: 'ADD DETAIL',
                    hintStyle: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 175, 76, 172),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          textStyle: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        messagenotice();
                        setState(() {
                          databaseRef.child(Title.text.toString()).set({
                            'title': Title.text.toString(),
                            'detail': body.text.toString(),
                          });
                        });
                      },
                      child: const Text('Submit'))),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
