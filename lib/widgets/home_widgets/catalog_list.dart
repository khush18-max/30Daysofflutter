import 'package:flutter/material.dart';
import  'package:hello/models/catalog.dart';
import 'package:hello/pages/home_detailpage.dart';
import 'package:hello/pages/home_page.dart';
import 'package:hello/widgets/home_widgets/catalog_image.dart';
import 'package:hello/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';



class Cataloglist extends StatelessWidget {
  const Cataloglist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Catalogmodel.items.length,
      itemBuilder: (context, index) {
        final catalog = Catalogmodel.items[index];
        return InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeDetailspage(catalog: catalog)) ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}
class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag:Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle!).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                      onPressed: (() {}),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape: MaterialStateProperty.all(const StadiumBorder()),
                      ),
                      child: "Buy".text.make()),
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}