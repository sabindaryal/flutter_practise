import 'package:flutter/material.dart';
import 'package:practise/get/productHome.dart';

class productPage extends StatefulWidget {
  String name;
  String price;
  String des;

  productPage(
      {Key? key, required this.des, required this.name, required this.price})
      : super(key: key);

  @override
  State<productPage> createState() => _productPageState();
}

class _productPageState extends State<productPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product')),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ListView(
              children: [
                // Container(
                //   height: 200,
                //   decoration: BoxDecoration(
                //       image:
                //           DecorationImage(image: NetworkImage(widget.image))),
                // ),

                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text("Price: " + " " + widget.price,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    )),
                Text(
                  "Description:" + " " + widget.des,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )),

            Padding(
              padding: const EdgeInsets.all(40),
              child: Align(
                alignment: Alignment.center,
                child:
                    ElevatedButton(onPressed: null, child: Text('Add to cart')),
              ),
            )
            // Container(
            //   height: 200,
            //   decoration: BoxDecoration(
            //       image: DecorationImage(image: NetworkImage(widget.image))),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Text(
            //   widget.name,
            //   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            // ),
            // Text("Price: " + " " + widget.price,
            //     style: const TextStyle(
            //       color: Colors.blue,
            //       fontSize: 15,
            //       fontWeight: FontWeight.w600,
            //     )),
            // Text(
            //   "Description:" + " " + widget.des,
            //   style: const TextStyle(
            //     color: Color.fromARGB(255, 0, 0, 0),
            //     fontSize: 14,
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),
          ],
        ),
      )),
    );
  }
}
