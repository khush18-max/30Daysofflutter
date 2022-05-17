import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:hello/models/catalog.dart';

import 'package:hello/widgets/home_widgets/catalog_list.dart';
import 'package:hello/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/catalog_header.dart';




class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int days = 30;
  final String name = "codepur";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final itemJson = await rootBundle.loadString("assets/files/item.json");
    final decodedData = jsonDecode(itemJson);
    final productsData = decodedData["items"];
    Catalogmodel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CatalogHeader(),
                if (Catalogmodel.items.isNotEmpty)
                  const Cataloglist().py16().expand()
                else
                   const CircularProgressIndicator().centered().expand(),
                  
              ],
            ),
          ),
        ));
  }
}








