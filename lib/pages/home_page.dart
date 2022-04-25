import 'package:flutter/material.dart';

import 'package:hello/widgets./drawer.dart';

class Homepage extends StatelessWidget {
  final int days = 30;
  final String name = "codepur";

  const Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    
    return Scaffold(
      appBar: AppBar(
        title:Center(child: const Text("Catalog App"))),     
          body: Center(
            child: Container(
              child: Text('Welcome to $days days of flutter by $name'),
            ),
          ),
        drawer: const MyDrawer(),
    );
  }
}

