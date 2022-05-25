// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello/core/store.dart';
import 'package:hello/models/cart.dart';
import 'dart:convert';
import 'package:hello/models/catalog.dart';
import 'package:hello/utils.dart/routes.dart';
import 'package:hello/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catalog_header.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int days = 30;
  final String name = "codepur";
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    //final itemJson = await rootBundle.loadString("assets/files/item.json");
    final response = await http.get(Uri.parse(url));
    final itemJson = response.body;
    final decodedData = jsonDecode(itemJson);
    final productsData = decodedData["items"];
    Catalogmodel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: const {AddMutation, RemoveMutation},
          builder: ((context, store, status) => FloatingActionButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, Myroutes.cartRoute),
                  backgroundColor: context.theme.buttonColor,
                  child: const Icon(CupertinoIcons.cart, color: Colors.white))
              .badge(
                  color: Vx.red500,
                  size: 22,
                  count: _cart.items.length,
                  textStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold))),
        ),
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
