import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        initialRoute: '/',
        onGenerateRoute: generateRoute,
      ),
    );

Route generateRoute(RouteSettings routeSettings) {
  final args = routeSettings.arguments;

  switch (routeSettings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (context) => HomeScreen(),
      );

    case '/details':
      if (args is Item) {
        return MaterialPageRoute(
          builder: (context) => DetailScreen(
            item: args,
          ),
        );
      }
      return MaterialPageRoute(
        builder: (context) => HomeScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => HomeScreen(),
      );
  }
}

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

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Красивые места'),
        ),
        body: ListView.builder(
            itemCount: placeList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: ExactAssetImage(placeList[index].image),
                ),
                title: Text(placeList[index].name),
                subtitle: Text(placeList[index].details),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/details',
                    arguments: placeList[index],
                  );
                },
              );
            }));
  }
}

class DetailScreen extends StatelessWidget {
  final Item item;

  const DetailScreen({required this.item}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(item.image),
            const SizedBox(
              height: 10,
            ),
            Text(
              item.details,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
