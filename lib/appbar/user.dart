import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:nishan/appbar/calendar.dart';
import 'package:nishan/status.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../Login_as_student.dart';
import '../wrong.dart';

String value = "";
final currentUser = FirebaseAuth.instance;
var firebasestore;

final Ref = FirebaseDatabase.instance.ref('Homework').child('Class :3');

final ref = FirebaseDatabase.instance.ref('Notice');

class page1 extends StatefulWidget {
  const page1({super.key});
  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  back() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const wrong(),
        ));
  }
  // @override
  // void back() {
  //   @override
  //   void initState() {
  //     super.initState();
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const wrong(),
  //         ));
  //   }
  // }

  @override
  void initState() {
    super.initState();
    value = posti;
    print("nishan $value");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Visibility(
            visible: value == "Students" ? false : true,
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection(value)
                    .where("uid", isEqualTo: currentUser.currentUser!.uid)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    var std = snapshot.data;
                    print(std);
                    if (std != null) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello , ${snapshot.data!.docs[index]['First name'].toString()} ${snapshot.data!.docs[index]['last name'].toString().toString()}  ',
                                  style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                                Visibility(
                                    visible: true,
                                    child: Text(
                                        '${snapshot.data!.docs[index]['post'].toString()} ')),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.green,
                        strokeWidth: 2,
                      ));
                    }
                  }
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.green,
                    strokeWidth: 2,
                  ));
                }),
          ),
          Visibility(
              visible: value == "Students" ? true : false,
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Students")
                      .doc("Class:$clas")
                      .collection("detail")
                      .where("uid", isEqualTo: userreqi.replaceAll(' ', ''))
                      // .get();
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      var std = snapshot.data;
                      print(std);
                      print(std);
                      print("classssssssssssssssssssssssssssssssssssss$clas");

                      if (std != null) {
                        print("classssssssssssssssssssssssssssssssssssss$clas");

                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hello , ${snapshot.data!.docs[index]['First name'].toString()} ${snapshot.data!.docs[index]['last name'].toString()}  ',
                                    style: const TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Visibility(
                                      visible: true, child: Text('Student')),
                                ],
                              ),
                            );
                          },
                        );
                      }
                      // } else {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => const wrong()),
                      //   );
                      //   const Text('data');
                      // }
                      // } else {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => const wrong(),
                      //       ));
                      // }
                      // } else {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => const wrong()),
                      //   );
                      //   const Text('data');
                      // }
                      // } else {
                      //   Future.delayed(Duration.zero, () {
                      //     Navigator.pushAndRemoveUntil(
                      //       context,
                      //       MaterialPageRoute(builder: (context) => exit(0)),
                      //       (route) => false,
                      //     );
                      //   });
                      // }
                    }
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.green,
                      strokeWidth: 2,
                    ));
                  })),
          const SizedBox(
            height: 3,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '"Education cover darkness of life"',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
          const Divider(
            color: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  const Text(
                    'OVERALL ATTENDANCE',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: CircularPercentIndicator(
                              backgroundColor: Colors.red,
                              progressColor: Colors.blue,
                              percent: 0.8,
                              center: const Text(
                                '80%',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              radius: 50,
                              lineWidth: 10,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Row(
                                  children: [
                                    Container(
                                      color: Colors.blue,
                                      height: 10,
                                      width: 30,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Text(
                                        'Present',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    color: Colors.red,
                                    height: 10,
                                    width: 30,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text(
                                      'Absent',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Todays Homework',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  height: 150,
                  child: Center(
                    child: FirebaseAnimatedList(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
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
                                      snapshot
                                          .child('Subject')
                                          .value
                                          .toString(),
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
                                      snapshot
                                          .child('Hw detail')
                                          .value
                                          .toString(),
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
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Divider(
              height: 2,
              thickness: 3,
              color: Colors.blue,
            ),
          ),
          const Center(
            child: Text(
              'New Updates',
              style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(border: Border.all(width: 1)),
              height: 200,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FirebaseAnimatedList(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    query: ref,
                    itemBuilder: (context, snapshot, animation, index) {
                      return SizedBox(
                        child: Card(
                          elevation: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                day.toString(),
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 12),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Image.asset(
                                        'asset/notice.png',
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            snapshot
                                                .child('title')
                                                .value
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            width: 200,
                                            child: Text(
                                              snapshot
                                                  .child('detail')
                                                  .value
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
