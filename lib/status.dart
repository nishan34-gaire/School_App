import 'package:flutter/material.dart';
import 'package:nishan/login.dart';

import 'check.dart';

String posti = '';

class post extends StatefulWidget {
  const post({super.key});

  @override
  State<post> createState() => _postState();
}

class _postState extends State<post> {
  @override
  void initState() {
    super.initState();
    print(posti);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asset/position.jpg'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Login as',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                posti = "Admin";
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(post: posti),
                    ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.asset('asset/admin.png'),
                    title: const Row(
                      children: [
                        Text(
                          'Admin',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                posti = "Teacher";
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(post: posti),
                    ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.asset('asset/teacher.png'),
                    title: const Row(
                      children: [
                        Text(
                          'Teacher',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                posti = "Students";
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const classinfo(),
                    ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.asset('asset/stu.png'),
                    title: const Row(
                      children: [
                        Text(
                          'Student',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
