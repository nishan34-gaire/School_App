import 'package:flutter/material.dart';

import 'Login_as_student.dart';

String grade = '';

class classinfo extends StatefulWidget {
  const classinfo({super.key});

  @override
  State<classinfo> createState() => _classinfoState();
}

class _classinfoState extends State<classinfo> {
  @override
  void initState() {
    super.initState();
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
              'Class Selection',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 400,
              width: MediaQuery.of(context).size.width / 1.5,
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      grade = "1";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => loginstu(level: 1),
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
                                'Class : 1',
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
                      grade = "2";

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => loginstu(level: 2),
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
                                'Class : 2',
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
                      grade = "3";

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => loginstu(level: 3),
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
                                'Class : 3',
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
                      grade = "4";

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => loginstu(level: 4),
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
                                'Class : 4',
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
                      grade = "5";

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => loginstu(level: 5),
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
                                'Class : 5',
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
                      grade = "6";

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => loginstu(level: 6),
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
                                'Class : 6',
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
                      grade = "7";

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => loginstu(level: 7),
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
                                'Class : 7',
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
                      grade = "8";

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => loginstu(level: 8),
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
                                'Class : 8',
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
                      grade = "9";

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => loginstu(level: 9),
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
                                'Class : 9',
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
                      grade = "10";

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => loginstu(level: 10),
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
                                'Class : 10',
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
            )
          ],
        ),
      ),
    );
  }
}
