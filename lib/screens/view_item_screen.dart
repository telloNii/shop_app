import 'package:design/models/cart.dart';
import 'package:design/screens/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemViewScreen extends StatefulWidget {
  ItemViewScreen(
      {required this.label,
      required this.image,
      required this.price,
      required this.category,
      required this.description,
      required this.id});
  late final String image, label, description, category;
  final String itemColor = "Black";
  final String itemSize = 'L';

  late final dynamic id, price;
  @override
  _ItemViewScreenState createState() => _ItemViewScreenState();
}

class _ItemViewScreenState extends State<ItemViewScreen> {
  int unit = 1;
  late int dropDownValue = 1;
  int maxItemNumber = 10;
  final List<int> listItems = List.generate(10, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.longestSide,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.longestSide * 0.5,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.image), fit: BoxFit.fill),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.shopping_cart_outlined,
                                size: 30,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Image.asset(
                  //
                  //   fit: BoxFit.fill,
                  //   height: MediaQuery.of(context).size.longestSide * 0.5,
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Text(
                                  widget.label,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "\$${widget.price * dropDownValue}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(widget.category)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(widget.description),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            Provider.of<CartItems>(context, listen: false)
                                .addToCart(
                                    dropDownValue,
                                    widget.price,
                                    widget.label,
                                    widget.image,
                                    widget.itemColor,
                                    widget.itemSize);
                          });
                          print(dropDownValue);
                          Navigator.pushNamed(context, CartScreen.id);
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(30),
                          type: MaterialType.button,
                          // height: 50,
                          color: Colors.grey.shade600,
                          child: Center(
                            child: Text(
                              "ADD TO CART",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade600,
                          borderRadius: BorderRadius.circular(30)),
                      child: DropdownButton(
                        items: listItems.map((int item) {
                          return DropdownMenuItem<int>(
                            child: Text(
                              ' $item',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            value: item,
                          );
                        }).toList(),
                        onChanged: (int? value) {
                          setState(() {
                            dropDownValue = value!;
                          });
                        },
                        value: dropDownValue,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
