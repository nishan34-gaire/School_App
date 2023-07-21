import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nishan/appbar/edit_page.dart';
String ley = '';
var name = '';
String classs = '';
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

class studentdatas extends StatefulWidget {
  const studentdatas({super.key});

  @override
  State<studentdatas> createState() => _studentdatasState();
}

class _studentdatasState extends State<studentdatas> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        centerTitle: true,
        title: const Text('Student Datas'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
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
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Students")
                .doc("Class:$dropdownvalue")
                .collection("detail")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = snapshot.data!.docs[index];
                      name = data['First name'];
                      print(name);
                      if (data['class'] == dropdownvalue) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    // print(ley);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Edit(
                                            clas: data['class'],
                                            data: ley,
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
                                    leading: Image.asset(
                                      (data['gender'] == 'Male'
                                          ? 'asset/stu.png'
                                          : 'asset/woman.png'),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Text(
                                        ' Name : ${name = data['First name']} ${data['last name']}',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        '  Class : ${data['class']}',
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
                            Visibility(
                                visible: false,
                                child: Text(ley = ' ${data['uid']}')),
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
        ],
      ),
    );
  }
}
