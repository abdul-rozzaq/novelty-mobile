import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:novelty/screens/auth/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var phoneFormatter = MaskTextInputFormatter(mask: '## ### ## ##', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.lazy);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/icon.png',
                width: size.width * .5,
                height: size.width * .5,
              ),
              const SizedBox(height: 20),
              const Text(
                'Novelty Market',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'Biz bilan yanada qulay',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 50),
              Ink(
                width: size.width * .88,
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 10,
                  top: 10,
                ),
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.black),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                      color: Colors.black.withOpacity(.2),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: controller,
                      inputFormatters: [phoneFormatter],
                      decoration: const InputDecoration(labelText: 'Telefon raqam', prefix: Text('+998 '), contentPadding: EdgeInsets.only(bottom: 10)),
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpScreen())),
                      child: Ink(
                        width: double.maxFinite,
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
                            'Yuborish',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
