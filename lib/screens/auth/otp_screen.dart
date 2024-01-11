import 'dart:async';

import 'package:flutter/material.dart';
import 'package:novelty/screens/consumer/home_screen.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var timer;

  int time = 120;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          time--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var minutes = time ~/ 60;
    var seconds = time % 60;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '0$minutes : ${seconds < 10 ? '0' : ''}$seconds',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 40,
                // fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Biz sizga yuborgan tasdiqlash\nkodni kiriting',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: size.width * .8,
              child: Pinput(
                onCompleted: (value) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                pinAnimationType: PinAnimationType.slide,
                autofocus: true,
                animationCurve: Curves.easeInOut,
                length: 6,
                defaultPinTheme: PinTheme(
                  width: 40,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(.05),
                    border: Border.all(
                      width: 1,
                      color: Colors.blueAccent.withOpacity(.5),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 40,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 55, 60, 69).withOpacity(0),
                    border: Border.all(
                      width: 1,
                      color: Colors.blueAccent.withOpacity(1),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false),
              child: Ink(
                width: size.width * .8,
                height: 45,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                      color: Colors.black.withOpacity(.2),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Tekshirish',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {},
              child: Text(
                'Qaytadan yuborish',
                style: TextStyle(
                  fontSize: 12,
                  color: time != 0 ? Colors.grey : Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
