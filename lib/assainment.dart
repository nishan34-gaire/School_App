import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nishan/main.dart';
import 'package:nishan/status.dart';

String dropdownvalue = '1';
var items = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
];
final databaseRef =
    FirebaseDatabase.instance.ref(" Homework").child('Class :3');
final Ref = FirebaseDatabase.instance.ref('Homework').child('Class :3');
final Subject = TextEditingController();
final hwdetail = TextEditingController();
final currentUser = FirebaseAuth.instance;

String sub = '';
String detail = '';

class homework extends StatefulWidget {
  const homework({super.key});

  @override
  State<homework> createState() => _homeworkState();
}

class _homeworkState extends State<homework> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: const Text(
          'Homework',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      body: Column(
        children: [
          Visibility(
            visible: posti == "Students" ? false : true,
            child: ElevatedButton(
                child: const Text('Give assaignment'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const homeworkcreate(),
                      ));
                }),
          ),
          SizedBox(
            height: 450,
            child: FirebaseAnimatedList(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                query: Ref,
                itemBuilder: (context, snapshot, animation, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 305,
                      child: Card(
                        elevation: 3,
                        child: ListTile(
                          leading: const Image(
                              image: AssetImage('asset/homework.png')),
                          title: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              snapshot.child("Subject").value.toString(),
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              snapshot.child('Hw detail').value.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class homeworkcreate extends StatefulWidget {
  const homeworkcreate({super.key});

  @override
  State<homeworkcreate> createState() => _homeworkcreateState();
}

class _homeworkcreateState extends State<homeworkcreate> {
  messagenotice() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Assignment sent'),
            content: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('Sure you want to assain task')],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const homeworkcreate(),
                      ));
                },
                child: const Text(
                  'CANCEL',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  showNotification;
                  setState(() {
                    databaseRef
                        .child("Class :${dropdownvalue.toString()}")
                        .child(" ${Subject.text.toString()}")
                        .set({
                      'Subject': Subject.text.toString(),
                      'Hw detail': hwdetail.text.toString(),
                    });
                  });
                },
                child: const Text(
                  'ACCEPT',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          );
        });
  }

  int index = 0;
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
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
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
        Subject.text.toString(),
        hwdetail.text.toString(),
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                channelDescription: channel.description,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }

  final formkey = GlobalKey<FormState>();

  String? value;
  String? info;
  var listn = [''];
  addto(String item) {
    setState(() {
      listn.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Homework',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'class',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 10,
              ),
              DropdownButton(
                dropdownColor: Colors.white,
                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: SizedBox(
                      width: 80,
                      child: Center(
                        child: Text(
                          items,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: Subject,
              decoration: const InputDecoration(
                icon: Icon(Icons.edit),
                hintText: 'Subject',
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
              controller: hwdetail,
              decoration: const InputDecoration(
                icon: Icon(Icons.edit),
                hintText: 'Add homework detail',
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
                      backgroundColor: const Color.fromARGB(255, 175, 76, 172),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    messagenotice();
                  },
                  child: const Text('Submit'))),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
