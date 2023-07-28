import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futter_catalog/pages/product_detail.dart';
// ignore: depend_on_referenced_packages
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    var jsonData = await rootBundle.loadString("assets/files/catalog.json");
    var itemData = jsonDecode(jsonData);
    var catalogProducts = itemData["products"];
    CatalogModel.products = List.from(catalogProducts)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              CatalogModel.products.isNotEmpty
                  ? const CatalogList().expand()
                  : const Center(child: CircularProgressIndicator()).expand()
            ],
          )),
    ));
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.make(),
        " Trending products".text.xl2.make(),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetail(
                          catalog: CatalogModel.products[index],
                        ))),
            child: CatalogItem(catalog: CatalogModel.products[index]));
      },
      itemCount: CatalogModel.products.length,
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: Image.network(
            catalog.image,
          ).box.p8.make().w40(context),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.bold.lg.make(),
            catalog.desc.text.make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalog.price}".text.lg.make(),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(211, 0, 0, 0)),
                      shape: MaterialStateProperty.all(const StadiumBorder())),
                  child: const Text("Buy"),
                )
              ],
            )
          ],
        ))
      ],
    )).transparent.roundedLg.square(200).py16.make();
  }
}
