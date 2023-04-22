import "package:flutter/material.dart";

import "../data/item.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
