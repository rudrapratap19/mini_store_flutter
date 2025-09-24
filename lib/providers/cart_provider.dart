import 'package:flutter/foundation.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final Map<int, Product> _items = {}; // key: product id

  Map<int, Product> get items => Map.unmodifiable(_items);

  int get count => _items.length;

  double get total {
    return _items.values.fold(0.0, (sum, p) => sum + p.price);
  }

  void add(Product p) {
    _items[p.id] = p;
    notifyListeners();
  }

  void remove(int id) {
    _items.remove(id);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
