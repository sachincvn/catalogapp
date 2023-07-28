import 'package:flutter/material.dart';
import 'package:futter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetail extends StatelessWidget {
  final Item catalog;
  const ProductDetail({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ButtonBar(
        buttonPadding: const EdgeInsets.all(20),
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${catalog.price.toString()}".text.xl2.make(),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(211, 0, 0, 0)),
                shape: MaterialStateProperty.all(const StadiumBorder())),
            child: const Text("Buy"),
          ).w24(context).h4(context)
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Center(
                child: Image.network(
              catalog.image,
              height: 400,
            )),
          ),
          Column(
            children: [
              catalog.name.text.xl4.bold.make(),
              catalog.desc.text.lg.make(),
              "The XYZ Smartphone is simply amazing! The sleek design and vibrant display make it a joy to use. The camera quality is outstanding, capturing clear and detailed photos. Its powerful performance and long-lasting battery ensure seamless multitasking. The fingerprint sensor adds an extra layer of security. The only downside is that it lacks expandable storage. Overall, the XYZ Smartphone offers a fantastic user experience and is worth every penny."
                  .replaceAll("XYZ", catalog.name)
                  .text
                  .xl
                  .caption(context)
                  .make()
                  .py(10)
            ],
          )
        ],
      )).p16(),
    );
  }
}
