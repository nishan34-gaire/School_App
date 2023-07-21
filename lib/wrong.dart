import 'package:flutter/material.dart';
import 'package:nishan/status.dart';

class wrong extends StatefulWidget {
  const wrong({super.key});

  @override
  State<wrong> createState() => _wrongState();
}

class _wrongState extends State<wrong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'asset/error.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
                child: Text(
              'No Related Data Available',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'opps....You are in the wrong Path',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const post()),
                    (route) => false,
                  );
                },
                child: const Text('Back to login'))
          ],
        ),
      ),
    );
  }
}
