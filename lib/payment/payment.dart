import 'package:flutter/material.dart';
import 'package:nishan/payment/pay_khalti.dart';

class payment extends StatefulWidget {
  const payment({super.key});

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const KhaltiPaymentApp(),
                  ));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple, // Background color
            ),
            child: const Text(
              'Pay through khalti',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Background color
            ),
            child: const Text(
              'Pay through Esewa',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
