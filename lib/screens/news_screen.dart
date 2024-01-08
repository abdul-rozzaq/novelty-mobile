import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData().copyWith(color: Colors.black),
        title: const Text(
          'Yangiliklar',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          height: 200,
          decoration: BoxDecoration(color: Colors.blueGrey[100], borderRadius: BorderRadius.circular(10)),
        ),
        itemCount: 20,
      ),
    );
  }
}
