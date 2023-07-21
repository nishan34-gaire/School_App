import 'package:flutter/material.dart';
import 'package:nishan/assainment.dart';

class Homeworkdetail extends StatelessWidget {
  const Homeworkdetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.yellow,
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('asset/task.png'),
                ),
                Center(
                    child: Text(
                  sub,
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  detail,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )),
              ],
            ),
          );
        },
      ),
    );
  }
}
