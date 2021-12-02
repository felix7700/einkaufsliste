import 'package:flutter/material.dart';

class AddNewItemInputCard extends StatelessWidget {
  final Function addItem;
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  AddNewItemInputCard(this.addItem, {Key? key}) : super(key: key);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredPrice = double.parse(priceController.text);

    if (enteredTitle.isEmpty || enteredPrice <= 0) {
      return;
    }

    addItem(enteredTitle, enteredPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Titel'),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Preis'),
              controller: priceController,
              keyboardType: TextInputType.number,
            ),
            TextButton(
              child: const Text(
                'Artikel hinzufügen',
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: () {
                submitData();
              },
            ),
          ],
        ),
      ),
    );
  }
}
