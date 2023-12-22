import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {}

class CartItem {
  final String title;
  final String price;
  int quantity;

  CartItem({required this.title, required this.price, this.quantity = 1});
}
