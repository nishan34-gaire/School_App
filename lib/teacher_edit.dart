import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'appbar/menu.dart';

final currentUser = FirebaseAuth.instance;
late var firebasestore;

class teacheredit extends StatelessWidget {
  QueryDocumentSnapshot raw;
  teacheredit({super.key, required this.raw});

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
                    builder: (context) => const page4(),
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
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: const CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('asset/stu.png'),
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
                          raw['First name'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          raw['class'],
                          style: const TextStyle(fontWeight: FontWeight.w300),
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
                                color: Colors.deepPurple[700]!, width: 2)),
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
                          raw['email'].toString(),
                          style: const TextStyle(fontWeight: FontWeight.w300),
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
                          raw['class'].toString(),
                          style: const TextStyle(fontWeight: FontWeight.w300),
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
                          raw['Date of birth'].toString(),
                          style: const TextStyle(fontWeight: FontWeight.w300),
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
                          raw['Father name'],
                          style: const TextStyle(fontWeight: FontWeight.w300),
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
                          raw['mother name'],
                          style: const TextStyle(fontWeight: FontWeight.w300),
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
                          raw['phone'],
                          style: const TextStyle(fontWeight: FontWeight.w300),
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
                          raw['gender'],
                          style: const TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    )),
              ),
            ],
          );
        },
      ),
    );
  }
}
