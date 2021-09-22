import 'package:flutter/material.dart';

class CartCards extends StatelessWidget {
  CartCards(
      {required this.price,
      required this.label,
      required this.units,
      required this.image,
      required this.itemColor,
      required this.itemSize});
  late final String image, label, itemColor, itemSize;
  late final double price;
  late final int units;
  late final double totalItemPrice = price * units;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(20)),
        height: 120,
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                height: 110,
                // width: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                padding: EdgeInsets.only(left: 16.0, top: 8.0, right: 2
                    // bottom: 8.0,
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Text(itemColor),
                            Text(itemSize),
                          ],
                        )
                      ],
                    ),
                    Text("\$${totalItemPrice.toStringAsFixed(2)}")
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.check_box),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Icon(Icons.remove, size: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            units.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Icon(Icons.add, size: 20),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
