// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hello/models/catalog.dart';


import 'package:velocity_x/velocity_x.dart';

class HomeDetailspage extends StatelessWidget {
  final Item catalog;

  const HomeDetailspage({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
                    onPressed: (() {}),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Vx.indigo500),
                      shape: MaterialStateProperty.all(const StadiumBorder()),
                    ),
                    child: "Add to Cart".text.make())
                .wh(120, 50),
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.lg.color(context.accentColor).bold.make(),
                    catalog.desc.text.textStyle(context.captionStyle!).make(),
                    10.heightBox,
                    "Dolores amet invidunt gubergren lorem rebum duo dolore ipsum, lorem ipsum et aliquyam rebum justo stet invidunt dolores. Duo elitr et et vero aliquyam, no et kasd elitr et. "
                    .text
                    .textStyle(context.captionStyle!)
                    .make()
                    .p16()
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
