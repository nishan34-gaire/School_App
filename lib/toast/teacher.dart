import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nishan/main.dart';

final firebasestore = FirebaseFirestore.instance
    .collection("Teacher")
    .where("uid", isEqualTo: currentUser.currentUser!.uid)
    .snapshots();
final currentUser = FirebaseAuth.instance;

class Teacher extends StatefulWidget {
  const Teacher({super.key});

  @override
  State<Teacher> createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.purple[700],
            )),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple[700],
      ),
      body: details(),
    );
  }

  StreamBuilder<QuerySnapshot<Object?>> details() {
    return StreamBuilder<QuerySnapshot>(
        stream: firebasestore,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            var std = snapshot.data;
            print(std);
            if (std != null) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: CircleAvatar(
                                radius: 70,
                                backgroundImage: AssetImage(
                                    snapshot.data!.docs[index]['gender'] ==
                                            'Male'
                                        ? 'asset/stu.png'
                                        : 'asset/woman.png'),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.docs[index]['First name']
                                      .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  snapshot.data!.docs[index]['class']
                                      .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'rollno-20',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Address-ktm',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 300,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.deepPurple[700]!,
                                        width: 2)),
                              ),
                              child: const Center(
                                  child: Text(
                                'Student Detail',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ))),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Card(
                        elevation: 2,
                        child: SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Email :',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  width: 70,
                                ),
                                Text(
                                  snapshot.data!.docs[index]['email']
                                      .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Card(
                        elevation: 2,
                        child: SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Class :',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  width: 70,
                                ),
                                Text(
                                  snapshot.data!.docs[index]['class']
                                      .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Card(
                        elevation: 2,
                        child: SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Section :',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                Text(
                                  'A',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Card(
                        elevation: 2,
                        child: SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Team :',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                Text(
                                  'Null',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Card(
                        elevation: 2,
                        child: SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'captaince :',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                Text(
                                  'Class-Monitor',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Card(
                        elevation: 2,
                        child: SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Age :',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                Text(
                                  '18',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Card(
                        elevation: 2,
                        child: SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'DOB IN BS :',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                Text(
                                  '2062-09-15',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Card(
                        elevation: 2,
                        child: SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'DOB IN AD :',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  width: 70,
                                ),
                                Text(
                                  snapshot.data!.docs[index]['Date of birth']
                                      .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Card(
                        elevation: 2,
                        child: SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Father name :',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  width: 70,
                                ),
                                Text(
                                  snapshot.data!.docs[index]['Father name']
                                      .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Card(
                        elevation: 2,
                        child: SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Mother Name :',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  width: 70,
                                ),
                                Text(
                                  snapshot.data!.docs[index]['mother name']
                                      .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Card(
                        elevation: 2,
                        child: SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Phone No :',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  width: 70,
                                ),
                                Text(
                                  snapshot.data!.docs[index]['phone']
                                      .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Card(
                        elevation: 2,
                        child: SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Gender :',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  width: 70,
                                ),
                                Text(
                                  snapshot.data!.docs[index]['gender']
                                      .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            )),
                      ),
                    ],
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
        });
  }
}
