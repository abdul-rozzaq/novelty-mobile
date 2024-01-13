import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novelty/models/token_model.dart';
import 'package:novelty/models/user_model.dart';
import 'package:novelty/screens/consumer/home_screen.dart';
import 'package:novelty/services/local_storage.dart';
import 'package:novelty/services/requests.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.number});

  final String number;

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
                'Ro\'yhatdan o\'tish',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'Ma\'lumotlaringizni kiriting',
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
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: firstNameController,
                      decoration: const InputDecoration(
                        labelText: 'Ism',
                        contentPadding: EdgeInsets.only(bottom: 10),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: lastNameController,
                      decoration: const InputDecoration(
                        labelText: 'Familiya',
                        contentPadding: EdgeInsets.only(bottom: 10),
                      ),
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () => signup(),
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

  signup() async {
    Response response = await Requests.postData(
      '/auth/signup/',
      {
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
        'phone': widget.number,
      },
    );

    if (response.statusCode == 200) {
      User user = User.fromJson(response.body['user']);
      Token token = Token.fromJson(response.body['token']);

      Get.find<AuthService>().save(token);
      Get.find<UserService>().save(user);

      return Get.offAll(() => const HomeScreen());
    }
  }
}
