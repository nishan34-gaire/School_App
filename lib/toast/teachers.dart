import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../teacher_edit.dart';

class teacher extends StatefulWidget {
  const teacher({super.key});

  @override
  State<teacher> createState() => _teacherState();
}

class _teacherState extends State<teacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        centerTitle: true,
        title: const Text('Teachers Datas'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Teacher").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var datas = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var ray = datas[index];
                  if (ray['post'] == 'Teacher') {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => teacheredit(
                                        raw: datas[index],
                                      ),
                                    ));
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black,
                                  )),
                              child: ListTile(
                                leading: Image.asset(ray['gender'] == 'Male'
                                    ? 'asset/stu.png'
                                    : 'asset/woman.png'),
                                title: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    'Name : ${ray['First name']} ${ray['last name']}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    ' Class Teacher : ${ray['class']}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Visibility(
                        visible: false, child: Text('data'));
                  }
                },
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
