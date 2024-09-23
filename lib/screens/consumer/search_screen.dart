import 'package:flexible_grid_view/flexible_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, this.isbn = ''});

  final String isbn;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.isbn.isNotEmpty) {
      searchController.text = widget.isbn;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
                border: const Border(),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CupertinoTextField(
                      autofocus: true,
                      padding: const EdgeInsets.all(0),
                      controller: searchController,
                      style: const TextStyle(fontSize: 14),
                      placeholder: 'Kitob nomi',
                      placeholderStyle: const TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.placeholderText,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 5),
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: const Icon(Icons.close_rounded, color: Colors.black),
            ),
          ),
        ],
      ),
      body: Ink(
        color: Colors.grey[200],
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: FlexibleGridView(
                  padding: const EdgeInsets.all(8),
                  axisCount: GridLayoutEnum.twoElementsInRow,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: List.generate(
                    20,
                    (index) => InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://fps.cdnpk.net/images/home/subhome-ai.webp?w=649&h=649',
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Text('data'),
                            const Text('data'),
                            const Text('data'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
