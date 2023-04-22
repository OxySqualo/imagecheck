class Item {
  final String name;
  final String image;
  final String details;
  Item({required this.name, required this.image, required this.details});
}

List<Item> placeList = [
  Item(name: 'Место #1', image: 'assets/images/place1.jpg', details: "Столбы"),
  Item(name: 'Место #2', image: 'assets/images/place2.jpg', details: "Байкал"),
  Item(name: 'Место #3', image: 'assets/images/place3.jpg', details: "Ангара")
];
