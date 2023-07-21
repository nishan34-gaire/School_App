import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nishan/login.dart';
import 'package:nishan/status.dart';
import 'package:nishan/toast/toast2.dart';

final auth = FirebaseAuth.instance;
TextEditingController emails = TextEditingController();
bool passwordVisible = false;
String rul = "";

class forget extends StatefulWidget {
  const forget({super.key});

  @override
  State<forget> createState() => _forgetState();
}

class _forgetState extends State<forget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rul = posti;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[600],
        title: const Text(
          ' Password Reset',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
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
                    hintText: 'Enter Email For Password Reset',
                    icon: Icon(Icons.alternate_email),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[400],
                    elevation: 3.0,
                    shadowColor: Colors.yellow[200],
                  ),
                  onPressed: () {
                    auth
                        .sendPasswordResetEmail(email: emails.text.toString())
                        .then((value) {
                      send().succesed();
                    }).onError((error, stackTrace) {
                      send().toastcomment(error.toString());
                    });
                  },
                  child: const Text('Reset')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(
                                post: rul,
                              ),
                            ));
                      },
                      child: const Text(
                        'Login ! ',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
