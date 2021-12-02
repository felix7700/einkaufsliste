import 'package:flutter/foundation.dart';

class Item {
  final String? id;
  final String? title;
  final num? price;
  final DateTime? date;

  Item({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.date,
  });
}
