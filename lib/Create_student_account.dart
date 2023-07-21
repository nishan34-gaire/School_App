import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nishan/appbar/menu.dart';
import 'package:nishan/main.dart';
import 'package:nishan/toast/toast2.dart';

late var collect;
late var get;
final instance = FirebaseFirestore.instance;
String ps = '';
int pid = 1;
int present = 1;
bool loading = false;
int n = 1;
FirebaseAuth gauth = FirebaseAuth.instance;
TextEditingController email = TextEditingController();
TextEditingController firstname = TextEditingController();
TextEditingController lastname = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController fathername = TextEditingController();
TextEditingController mothername = TextEditingController();

TextEditingController password = TextEditingController();
final nishan = GlobalKey<FormState>();
bool passwordVisible = false;

DateTime current = DateTime.now();

String gender = 'Male';
var genders = [
  'Male',
  'Female',
];
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

class accountstudent extends StatefulWidget {
  const accountstudent({super.key, this.restorationId});
  final String? restorationId;
  @override
  State<accountstudent> createState() => _accountstudentState();
}

class _accountstudentState extends State<accountstudent> with RestorationMixin {
  void subcontainer() {
    String list = firstname.text.toString();
    instance
        .collection("Students")
        .doc("Class:${dropdownvalue.toString()}")
        .collection("detail")
        .add({
      'uid': ps.toString(),
      'Date of birth':
          '${current.day.toString()}/${current.month.toString()}/${current.year.toString()}',
      'class': dropdownvalue.toString(),
      'gender': gender.toString(),
      'First name': firstname.text.toString(),
      'last name': lastname.text.toString(),
      'Father name': fathername.text.toString(),
      'mother name': mothername.text.toString(),
      'phone': phone.text.toString(),
      'email': email.text.toString(),
      'password': password.text.toString(),
      'post': "Student",
    }).then((value) {
      print("sucessssssssssssss  ${ps.toString()}");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    collect = FirebaseFirestore.instance
        .collection("Students")
        .doc("Class:$dropdownvalue")
        .collection("student")
        .doc("firstname.text.toString()")
        .snapshots();
  }

  PlatformFile? pickedfile;
  Future uploadfiles() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return null;
    }
    setState(() {
      pickedfile = result.files.first;
    });
  }

  conformdata() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              'Data Entry Confirmation',
              style: TextStyle(
                  color: Colors.blue[700], fontWeight: FontWeight.w600),
            ),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Are You Sure Want To Add The Data !',
                    style: TextStyle(
                        color: Colors.red[700], fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const page4(),
                      ));
                },
                child: const Text(
                  'CANCEL',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    nishan.currentState?.reset();
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  HomePage(),
                        ));

                    subcontainer();
                  });

                  send().success();
                  email = TextEditingController();
                  firstname = TextEditingController();
                  lastname = TextEditingController();
                  phone = TextEditingController();
                  fathername = TextEditingController();
                  mothername = TextEditingController();

                  password = TextEditingController();
                },
                child: const Text(
                  'ACCEPT',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          );
        });
  }

  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(1994),
          lastDate: DateTime(2027),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        title: const Text(
          'Create New student data',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      body: ListView(
        children: [
          Form(
            key: nishan,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 340,
                  decoration: const BoxDecoration(),
                  child: TextFormField(
                    controller: firstname,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.green,
                      ),
                      label: Text('First name'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 340,
                  decoration: const BoxDecoration(),
                  child: TextFormField(
                    controller: lastname,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.green,
                      ),
                      label: Text('Last name'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 340,
                  decoration: const BoxDecoration(),
                  child: TextFormField(
                    validator: (value) {
                      return null;
                    },
                    controller: fathername,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.green,
                      ),
                      label: Text('Father name'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 340,
                  decoration: const BoxDecoration(),
                  child: TextFormField(
                    controller: mothername,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.green,
                      ),
                      label: Text('Mother name'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 340,
                  decoration: const BoxDecoration(),
                  child: TextFormField(
                    validator: (number) {
                      if (number!.length < 9) {
                        if (number.length > 11) {
                          return null;
                        }
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    controller: phone,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.phone_android,
                        color: Colors.green,
                      ),
                      label: Text('phone number'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 340,
                  decoration: const BoxDecoration(),
                  child: Row(
                    children: [
                      const Text('Class'),
                      const SizedBox(
                        width: 20,
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
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
                      const SizedBox(
                        width: 20,
                      ),
                      const Text('DOB'),
                      const SizedBox(
                        width: 10,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            current = _selectedDate.value;
                          });
                          _restorableDatePickerRouteFuture.present();
                        },
                        child: Text(
                            '${current.day.toString()}/${current.month.toString()}/${current.year.toString()}'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('select image'),
                        Row(
                          children: [
                            const Text('gender'),
                            const SizedBox(
                              width: 10,
                            ),
                            DropdownButton(
                              dropdownColor: Colors.white,
                              // Initial Value
                              value: gender,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: genders.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: SizedBox(
                                    width: 80,
                                    child: Center(
                                      child: Text(
                                        items,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? se) {
                                setState(() {
                                  gender = se!;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'enter email';
                            }
                            return null;
                          },
                          controller: email,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            icon: Icon(Icons.alternate_email),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (vale) {
                          if (vale!.length < 6) {}
                          return null;
                        },
                        controller: password,
                        obscureText: !passwordVisible,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                          hintText: 'password',
                          icon: const Icon(Icons.password),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              gauth
                                  .createUserWithEmailAndPassword(
                                      email: email.text.toString(),
                                      password: password.text.toString())
                                  .then((value) {
                                ps = value.user!.uid.toString();

                                if (conformdata().isEmpty) {
                                  const CircularProgressIndicator();
                                }
                                conformdata();
                              }).onError((error, stackTrace) {
                                send().toastcomment(error.toString());
                              });
                            });
                          },
                          child: const Text('create')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
