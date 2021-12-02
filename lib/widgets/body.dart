import 'package:flutter/material.dart';
import 'package:fridge_manager/models/item.dart';
import 'package:fridge_manager/widgets/item_list.dart';
import 'add_new_item_input_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double totalPrice = 0.0;
  final List<Item> _itemList = [
    /*Item(
      id: 't1',
      title: 'Milk',
      amount: 1.99,
      date: DateTime.now(),
    ),*/
  ];

  void _addNewItem(String itemTitle, double itemPrice) {
    final newItem = Item(
      title: itemTitle,
      price: itemPrice,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(
      () {
        _itemList.add(newItem);
      },
    );
    totalPrice = 0;
    for (Item item in _itemList) {
      totalPrice = totalPrice + item.price!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              'Füge hier die Artikel hinzu,\ndie du einkaufen möchtest:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: Text(
              'Gesamtpreis = ${totalPrice.toStringAsFixed(2)} €',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AddNewItemInputCard(_addNewItem),
          ItemList(_itemList),
        ],
      ),
    );
  }
}
