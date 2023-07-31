import 'dart:convert';
import 'package:flutter/material.dart';
import 'ShopBottomNavigator.dart';
import 'Product.dart';
import 'DescriptionPage.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MainMaterial());
}

class MainMaterial extends StatelessWidget {
  const MainMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Store(),
    );
  }
}


class Store extends StatefulWidget {
  const Store({super.key});
  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  final List<Product> _items = [];

  @override
  void initState() {
    super.initState();
    fetchItems();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
              "فروشگاه آنلاین",
            style: TextStyle(
              color: Colors.black45,
              fontFamily: "IRANSans"
            ),
          ),
          centerTitle: true,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.black45,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            IconButton(onPressed: () => {}, icon: const Icon(Icons.map, color: Colors.black45,))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
            children: List.generate(_items.length, (int position){
              return generateItem(_items[position], context);
            }),
          ),
        ),
        bottomNavigationBar: const ShopBottomNavigator(),
        floatingActionButton: FloatingActionButton(backgroundColor: Colors.red[900], onPressed: () => {}, key: GlobalKey(), child: const Icon(Icons.add)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
  }

  void fetchItems() async{
    var dio = Dio(
      BaseOptions(
        contentType: 'application/json',
        responseType: ResponseType.plain,
      )
    );
    var response = await dio.get('http://www.welearnacademy.ir/flutter/products_list.json');

    setState(() {
      var productJson = json.decode(response.data);
      for(var i in productJson){
        var productItem =  Product(i['product_name'], i['id'], i['price'], i['image_url'], i['off'], i['description']);
        _items.add(productItem);
      }
    });
  }
}

Card generateItem(Product product, context){
  return Card(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
    elevation: 4,
    child: InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=> DescriptionPage(product)
        ));
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 130,
              height: 130,
              child: Image.network(product.imageUrl),
            ),
            Text(
                product.price,
              style: TextStyle(
                fontFamily: "IRANSans",
                fontSize: 16.0,
                color: Colors.red[700]
              ),
            ),
            Text(
              product.productName,
              style: const TextStyle(
                  fontFamily: "IRANSans",
                  fontSize: 14.0,
                  color: Color(0xff575e67)
              ),
            )
          ],
        ),
      ),
    ),
  );
}
