import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

final ref = FirebaseDatabase.instance.ref('Notice');

class page3 extends StatefulWidget {
  const page3({super.key});

  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  late String value;

  var listn = [''];
  addto(String item) {
    setState(() {
      listn.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
          ),
          height: MediaQuery.of(context).size.height / 1.25,
          child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (context, snapshot, animation, index) {
                return Column(
                  children: [
                    Card(
                      child: ListTile(
                        leading: Image.asset('asset/notice.png'),
                        title: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            snapshot.child('title').value.toString(),
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            snapshot.child('detail').value.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
