import 'package:flutter/material.dart';

class ShopBottomNavigator extends StatelessWidget {
  const ShopBottomNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width/2-40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.home, color: Colors.blueGrey[900],),
                  Icon(Icons.person_outline, color: Colors.blueGrey[900],),
                ],
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width/2-40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.search, color: Colors.blueGrey[900],),
                  Icon(Icons.shopping_basket, color: Colors.blueGrey[900],),
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
