import 'package:flutter/material.dart';
import 'package:futter_catalog/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: Image.network(
          item.image,
          fit: BoxFit.cover,
        ),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}"),
      ),
    );
  }
}
