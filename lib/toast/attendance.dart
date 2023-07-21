import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nishan/main.dart';

import '../appbar/menu.dart';

String grade = "";
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
String name = '';
String state = '';
String day = DateTime.now().toString();

int attendences = 1;
List present = [];

class attandence extends StatefulWidget {
  const attandence({super.key});

  @override
  State<attandence> createState() => _attandenceState();
}

class _attandenceState extends State<attandence> {
  @override
  void initState() {
    super.initState();
  }

  List<int?> selectedItems = List.generate(50, (index) => 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
          onPressed: () {
            setState(() {});
          },
          child: const Text('Submit')),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  HomePage(),
                  ));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.purple[700],
            )),
        title: const Text(
          'Attendance',
          style: TextStyle(
              color: Color.fromARGB(255, 1, 75, 145),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
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
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            child: StreamBuilder<QuerySnapshot>(
                stream:FirebaseFirestore.instance
                .collection("Students")
                .doc("Class:$dropdownvalue")
                .collection("detail")
                .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    var register = snapshot.data!.docs;
                    int m = snapshot.data!.docs.length;

                    if (register != null) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: m,
                        itemBuilder: (BuildContext context, int index) {
                          if (snapshot.data!.docs[index]['class'].toString() ==
                              dropdownvalue) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        child: Image.asset(
                                            'asset/immigration.png'),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8, left: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextFormField(
                                              enabled: false,
                                              initialValue: snapshot.data!
                                                  .docs[index]['First name']
                                                  .toString(),
                                              onSaved: (newValue) {
                                                name = snapshot.data!
                                                    .docs[index]['First name']
                                                    .toString();
                                              },
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: snapshot.data!
                                                    .docs[index]['First name']
                                                    .toString(),
                                                hintStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            const Text(
                                              maxLines: 1,
                                              'Roll no : 10',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 66, 61, 61),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              maxLines: 1,
                                              'Class no : ${snapshot.data!.docs[index]['class'].toString()}',
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 66, 61, 61),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Visibility(
                                              visible: false,
                                              child: Text(
                                                maxLines: 1,
                                                grade =
                                                    '  ${snapshot.data!.docs[index]['class'].toString()}',
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 66, 61, 61),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(),
                                                  child: Row(
                                                    children: [
                                                      const Text('present'),
                                                      Radio(
                                                        value: 0,
                                                        groupValue:
                                                            selectedItems[
                                                                index],
                                                        onChanged: (value) {
                                                          setState(() {
                                                            selectedItems[
                                                                index] = value;

                                                            state = "Present";
                                                            attendences = 1;
                                                          });
                                                        },
                                                      ),
                                                      const SizedBox(
                                                        width: 3,
                                                      ),
                                                      const Text('Absent'),
                                                      Radio(
                                                        value: 1,
                                                        groupValue:
                                                            selectedItems[
                                                                index],
                                                        onChanged: (value) {
                                                          setState(() {
                                                            selectedItems[
                                                                index] = value;

                                                            state = "Absent";
                                                            attendences = 0;
                                                          });
                                                        },
                                                      ),

                                                      // Padding(
                                                      //     padding:
                                                      //         const EdgeInsets.all(3),
                                                      //     child: GestureDetector(
                                                      //       onTap: () {
                                                      //         setState(() {
                                                      //           attendence = 1;
                                                      //         });
                                                      //       },
                                                      //       child: CircleAvatar(
                                                      //         radius: 25,
                                                      //         backgroundColor:
                                                      //             attendence == 1
                                                      //                 ? Colors.green
                                                      //                 : Colors.red,
                                                      //         child: Padding(
                                                      //           padding:
                                                      //               const EdgeInsets
                                                      //                   .all(8.0),
                                                      //           child: CircleAvatar(
                                                      //               child: Image.asset(
                                                      //                   'asset/p.png')),
                                                      //         ),
                                                      //       ),
                                                      //     )),
                                                      // const SizedBox(
                                                      //   width: 25,
                                                      // ),
                                                      // Padding(
                                                      //     padding:
                                                      //         const EdgeInsets.all(3),
                                                      //     child: GestureDetector(
                                                      //       onTap: () {
                                                      //         setState(() {
                                                      //           attendence = 0;
                                                      //         });
                                                      //       },
                                                      //       child: CircleAvatar(
                                                      //         radius: 25,
                                                      //         backgroundColor:
                                                      //             attendence == 0
                                                      //                 ? Colors.green
                                                      //                 : Colors.red,
                                                      //         child: Padding(
                                                      //           padding:
                                                      //               const EdgeInsets
                                                      //                   .all(8.0),
                                                      //           child: CircleAvatar(
                                                      //               child: Image.asset(
                                                      //                   'asset/absent.png')),
                                                      //         ),
                                                      //       ),
                                                      //     )),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Text(
                                              selectedItems[index] == 0
                                                  ? state = "Present"
                                                  : state = "Absent",
                                              style: TextStyle(
                                                  color:
                                                      selectedItems[index] == 0
                                                          ? Colors.black
                                                          : Colors.red,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                          return null;
                        },
                      );
                    } else {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.green,
                        strokeWidth: 2,
                      ));
                    }
                  } else {
                    return const Center(child: Text('No data found'));
                  }
                }),
          ),
        ],
      ),
    );
  }
}
