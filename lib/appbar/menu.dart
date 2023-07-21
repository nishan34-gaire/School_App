import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nishan/appbar/student_datas.dart';
import 'package:nishan/appbar/user.dart';
import 'package:nishan/assainment.dart';
import 'package:nishan/create_account.dart';
import 'package:nishan/noticewrite.dart';
import 'package:nishan/onlineclass.dart';
import 'package:nishan/payment/payment.dart';
import 'package:nishan/toast/attendance.dart';
import 'package:nishan/toast/student.dart';
import 'package:nishan/toast/teacher.dart';

import '../Create_student_account.dart';
import '../toast/teachers.dart';

final currentUser = FirebaseAuth.instance;
String kal = '';

class page4 extends StatefulWidget {
  const page4({super.key});

  @override
  State<page4> createState() => _page4State();
}

class _page4State extends State<page4> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String kal = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.25,
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child:
                    ListView(scrollDirection: Axis.vertical, children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Background color
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const payment(),
                          ));
                    },
                    child: Card(
                      child: ListTile(
                        leading: Image.asset('asset/wallet.png'),
                        title: const Row(
                          children: [
                            Text(
                              'Account',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        subtitle: const Text('Monthly Bills and Recipt'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Background color
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const onlineclass(),
                          ));
                    },
                    child: Card(
                      child: ListTile(
                        leading: Image.asset('asset/online.png'),
                        title: const Row(
                          children: [
                            Text(
                              'Online Class',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        subtitle: const Text('Join online Class'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    visible: value == 'Admin' ? true : false,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Background color
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const account(),
                              ));
                        },
                        child: Card(
                          child: ListTile(
                            leading: Image.asset('asset/add.png'),
                            title: const Row(
                              children: [
                                Text(
                                  'Teacher Account Create',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            subtitle: const Text('Create Teacher Account'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: value == 'Admin' ? true : false,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Background color
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const accountstudent(),
                              ));
                        },
                        child: Card(
                          child: ListTile(
                            leading: Image.asset('asset/add.png'),
                            title: const Row(
                              children: [
                                Text(
                                  'Student Account Create',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            subtitle: const Text('Create Student Account'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: value == 'Admin' ? true : false,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const notice(),
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.white,
                          child: ListTile(
                            leading: Image.asset('asset/notice.png'),
                            title: const Row(
                              children: [
                                Text(
                                  'Notice',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            subtitle: const Text('Create Notice'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Background color
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const homework(),
                          ));
                    },
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Image.asset('asset/homework.png'),
                        title: const Row(
                          children: [
                            Text(
                              'Assignment',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        subtitle: const Text('View and Submit Assignment'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Background color
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const attandence(),
                          ));
                    },
                    child: Card(
                      child: ListTile(
                        leading: Image.asset('asset/attendance.png'),
                        title: const Row(
                          children: [
                            Text(
                              'Attendance',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        subtitle: const Text('Your total attendance'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Background color
                    ),
                    onPressed: () {},
                    child: Card(
                      child: ListTile(
                        leading: Image.asset('asset/routine.png'),
                        title: const Row(
                          children: [
                            Text(
                              'Routine',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        subtitle: const Text('Exam and Class Routine'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color
                      ),
                      onPressed: () {},
                      child: Card(
                        child: ListTile(
                          leading: Image.asset('asset/report.png'),
                          title: const Row(
                            children: [
                              Text(
                                'Report Card',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          subtitle: const Text('View Exam Result'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    visible: value == 'Teacher' ? true : false,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Background color
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Teacher(),
                              ));
                        },
                        child: Card(
                          child: ListTile(
                            leading: Image.asset('asset/stu.png'),
                            title: const Row(
                              children: [
                                Text(
                                  'Teacher info',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            subtitle: const Text('See About Yourself'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: value == 'Students' ? true : false,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Background color
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Student(),
                              ));
                        },
                        child: Card(
                          child: ListTile(
                            leading: Image.asset('asset/stu.png'),
                            title: const Row(
                              children: [
                                Text(
                                  'Student info',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            subtitle: const Text('See About Yourself'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: value == 'Admin' ? true : false,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Background color
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const teacher(),
                              ));
                        },
                        child: Card(
                          child: ListTile(
                            leading: Image.asset('asset/teacher.png'),
                            title: const Text(
                              'Teacher Data',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text(
                                'See Information About Your Teachers'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: value == 'Admin' ? true : false,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Background color
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const studentdatas(),
                              ));
                        },
                        child: Card(
                          child: ListTile(
                            leading: Image.asset('asset/stu.png'),
                            title: const Text(
                              'Student Data',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text(
                                'See Information About Your Student'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
