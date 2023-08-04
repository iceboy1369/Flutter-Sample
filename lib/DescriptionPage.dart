import 'package:flutter/material.dart';
import 'Product.dart';

class DescriptionPage extends StatelessWidget {
  final Product _product;
  const DescriptionPage(this._product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "اطلاعات محصول",
          style: TextStyle(
              color: Colors.black45,
              fontFamily: "IRANSans"
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black45,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Shoes",
                style: TextStyle(
                  fontFamily: "Varela",
                  color: Colors.red[700],
                  fontSize: 40
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            // child: Image.network(
            //     _product.imageUrl,
            //   height: 280,
            //   width: 280,
            //   fit: BoxFit.contain,
            // ),
            child: FadeInImage(
              image: NetworkImage(_product.imageUrl),
              placeholder: AssetImage("assets/images/${_product.imageUrl}"),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/${_product.imageUrl}',
                  fit: BoxFit.contain,
                  width: 280,
                  height: 200,
                );
              },
              fit: BoxFit.contain,
              width: 280,
              height: 200,
            ),
          ),
          Text(
            _product.price,
            style: TextStyle(
              color: Colors.red[700],
              fontFamily: "IRANSans",
              fontSize: 30
            ),
          ),
          Text(
            _product.productName,
            style: TextStyle(
                color: Colors.grey[700],
                fontFamily: "IRANSans",
                fontSize: 20
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Text(
              _product.description,
              style: TextStyle(
                  color: Colors.grey[500],
                  fontFamily: "IRANSans",
                  fontSize: 16
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red[600],
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  width: MediaQuery.of(context).size.width-50,
                  height: 70,
                  child: const Center(
                    child: Text(
                      "افزودن به سبد خرید",
                      style: TextStyle(
                          fontFamily: "IRANSans",
                          fontSize: 18,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
