import 'package:flutter/material.dart';
import 'package:hello/models/catalog.dart';

import 'package:hello/widgets./drawer.dart';

import '../widgets/item_widget.dart';

class Homepage extends StatelessWidget {
  final int days = 30;
  final String name = "codepur";

  const Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(50, (index) => Catalogmodel.items[0]);

    return Scaffold(
      appBar: AppBar(title: const Text("Catalog App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
