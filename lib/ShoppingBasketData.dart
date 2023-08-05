import 'Product.dart';

class ShoppingBasketData {
  static ShoppingBasketData _instance;
  List<Product> _basketItems;

  ShoppingBasketData(){
    _basketItems = List<Product>();
  }

  List<Product> get basketItems => _basketItems;

  static ShoppingBasketData getInstance(){
    if(_instance==null){
      _instance = ShoppingBasketData();
    }
    return _instance;
  }

}