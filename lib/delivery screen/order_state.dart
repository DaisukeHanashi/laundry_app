import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class OrderState extends ChangeNotifier {
  late String _currentTab;

  List<Order> newOrders = [];
  List<Order> pickUps = [];

  OrderState() {
    _currentTab = 'New Orders';
    newOrders = [
      Order('Order 1', 'Shop 1', 'Pending', 'Cash on Delivery'),
      Order('Order 2', 'Shop 2', 'Pending', 'Online Payment'),
      // ... add more orders
    ];
  }

  String get currentTab => _currentTab;

  void moveOrder(String orderId, String fromTab, String toTab) {
  Order? orderToRemove;
  switch (fromTab) {
    case 'New Orders':
      orderToRemove = newOrders.firstWhereOrNull((o) => o.orderId == orderId);
      if (orderToRemove != null) {
        newOrders.remove(orderToRemove);
      }
      break;
    case 'Pick-ups':
      orderToRemove = pickUps.firstWhereOrNull((o) => o.orderId == orderId);
      if (orderToRemove != null) {
        pickUps.remove(orderToRemove);
      }
      break;
    // Add cases for other tabs if needed
  }

  if (orderToRemove != null) {
    switch (toTab) {
      case 'New Orders':
        newOrders.add(orderToRemove);
        break;
      case 'Pick-ups':
        pickUps.add(orderToRemove);
        break;
    }

    notifyListeners();
  }
}

  void setTab(String tab) {
    _currentTab = tab;
    notifyListeners();
  }
}

class Order {
  final String orderId;
  final String shopName;
  final String status;
  final String paymentType;

  Order(this.orderId, this.shopName, this.status, this.paymentType);
}
