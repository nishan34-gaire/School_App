import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nishan/imageanimation/imageanimation.dart';

import 'status.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const img1(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'asset/f.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const Center(
              child: FadeTransitionExample(),
            ),
          ],
        ),
      ),
    );
  }
}

class img1 extends StatelessWidget {
  const img1({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const img2(),
            ));
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Image.asset(
          'asset/1.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class img2 extends StatelessWidget {
  const img2({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const img3(),
            ));
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          'asset/2.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class img3 extends StatelessWidget {
  const img3({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const post(),
            ));
      },
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          'asset/3.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
