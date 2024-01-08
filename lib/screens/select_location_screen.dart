import 'package:flutter/material.dart';

class SelectLocationScreen extends StatelessWidget {
  const SelectLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData().copyWith(color: Colors.black),
        title: const Text(
          'Sizning joylashuvingiz',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) => Text('asdasdasdasd $index'),
          itemCount: 100,
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'Saqlash',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
