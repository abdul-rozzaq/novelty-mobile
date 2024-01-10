import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double topPadding = MediaQuery.of(context).padding.top;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: topPadding + 15,
            bottom: topPadding / 2,
          ),
          decoration: const BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          width: size.width,
          child: const Center(
            child: Text(
              'Mavjud kitoblar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 15,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.2),
                          offset: const Offset(0, 3),
                          blurRadius: 8,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/tarixi-m-web-500x750.jpg',
                        width: 120,
                        fit: BoxFit.cover,
                        height: 170,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Lorem Ipsum is simply dummy text of the printing and typesetting', maxLines: 2, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 3),
                        const Text('James Krill', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        const SizedBox(height: 10),
                        const Text('25.000 so\'m', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                padding: const EdgeInsets.all(7),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Tahrir',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                padding: const EdgeInsets.all(7),
                                alignment: Alignment.center,
                                child: const Text(
                                  'O\'chirish',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
