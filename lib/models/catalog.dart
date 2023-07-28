class CatalogModel {
  static List<Item> products = [];
}

class Item {
  int id;
  String name;
  String desc;
  double price;
  String color;
  String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image);

  // Factory constructor to create a product from a JSON map
  factory Item.fromMap(Map<String, dynamic> json) {
    return Item(
      json['id'],
      json['name'],
      json['desc'],
      json['price'].toDouble(),
      json['color'],
      json['image'],
    );
  }

  // Method to convert the product to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }
}
