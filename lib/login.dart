import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nishan/forget_password.dart';
import 'package:nishan/main.dart';
import 'package:nishan/toast/toast.dart';
import 'package:nishan/wrong.dart';

List<String> pos = [];
List<String> key = [];
Map<int, dynamic> keyMap = {};
late Stream<QuerySnapshot<Object?>>? snapshot;
late var stat;
late var firebasestore;
String userreq = '';
var status = [
  'Admin',
  'Students',
  'Teacher',
];
final login = GlobalKey<FormState>();
bool passwordVisible = false;

TextEditingController emails = TextEditingController();
TextEditingController passwords = TextEditingController();
final auth = FirebaseAuth.instance;
void logins(context, String postName) {
  auth
      .signInWithEmailAndPassword(
          email: emails.text.toString(), password: passwords.text.toString())
      .then((value) {
    userreq = value.user!.uid.toString();
    print("dddddddddddddddddddddd $userreq");
    firebasestore = FirebaseFirestore.instance
        .collection(postName)
        .where("uid", isEqualTo: userreq)
        .snapshots();
    if (firebasestore != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const wrong(),
          ));
    }

    // if (userreq == keyMap) {

    // } else {

    // }

    utils().toastsuccessmessage();
    emails = TextEditingController();
    passwords = TextEditingController();
  }).onError((error, stackTrace) {
    utils().toastmessage(error.toString());
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const wrong(),
        ));
  });
}

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key, required this.post});
  String post = '';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("hello${widget.post}");
    // print(key.toString());
    // print(keyMap.toString());

    String hh = widget.post;
    stat = FirebaseFirestore.instance.collection(widget.post).snapshots();

    String pos = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 104, 104),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: const Text(
          'Log In',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Visibility(
              visible: false,
              child: StreamBuilder(
                stream: stat,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          var data = snapshot.data!.docs[index];
                          key.add(data['uid']);

                          pos.add(data['post']);

                          keyMap[index] = data['uid'];

                          print(keyMap);

                          return Column(
                            children: [
                              Text(
                                key[index],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                pos[index],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                      image: AssetImage('asset/f.jpg'), fit: BoxFit.cover)),
              child: Center(
                  child: Image.asset(
                'asset/logo1.png',
                fit: BoxFit.cover,
              )),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
              ),
              child: Form(
                key: login,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Login As : ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.post,
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'enter email';
                            }
                            return null;
                          },
                          controller: emails,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Email',
                            icon: Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(Icons.alternate_email_outlined),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          validator: (vale) {
                            if (vale!.length < 6) {}
                            return null;
                          },
                          controller: passwords,
                          obscureText: !passwordVisible,
                          keyboardType: TextInputType.visiblePassword,
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
                            hintText: ' Enter Password',
                            border: InputBorder.none,
                            icon: const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(Icons.password_outlined),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple[400],
                            elevation: 6.0,
                            shadowColor: Colors.yellow[200],
                          ),
                          onPressed: () {
                            setState(() {
                              if (login.currentState!.validate()) {
                                logins(context, widget.post);
                              }
                              emails == "";
                              passwords == "";
                            });
                          },
                          child: const Text('LogIn')),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const forget(),
                              ));
                        },
                        child: const Text(
                          'Forget Password ? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
