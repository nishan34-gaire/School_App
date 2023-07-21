import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nishan/appbar/menu.dart';
import 'package:nishan/login.dart';
import 'package:nishan/status.dart';

String rul = "";

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  void initState() {
    super.initState();
    rul = "";
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
//signout function

  logout() {
    return const AlertDialog(
      title: Text(
        'are you sure you want log out',
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            setState(() {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const page4(),
                  ));
            });
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Text('Setting',
            style: TextStyle(
                color: Color.fromARGB(255, 70, 63, 151),
                fontSize: 20,
                fontWeight: FontWeight.w700)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: ListTile(
                      leading: Image.asset('asset/sad.png'),
                      title: const Text(
                        'Are You sure to Logout',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'It will harm your mobile',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    actions: <Widget>[
                       TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const post()),
                            (route) => false,
                          );
                        },
                        child: Container(
                          color: Colors.red[400],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: const Text(
                            "yes",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                       const SizedBox(
                        width: 30,
                      ),
                     
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Container(
                          color: Colors.yellow[400],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: const Text(
                            "No",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                     
                      const SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                );
              },
              child: const Card(
                margin: EdgeInsets.all(5),
                elevation: 5,
                child: ListTile(
                  leading: Image(image: AssetImage('asset/switch.png')),
                  title: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'LOG OUT',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'Back to login screen',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
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
