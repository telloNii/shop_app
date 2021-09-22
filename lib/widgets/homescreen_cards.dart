import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Categories extends StatelessWidget {
  Categories({required this.icon, required this.label});
  late final IconData icon;
  late final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        child: ListTile(
          leading: FaIcon(icon),
          title: Text(label),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}

class Item1 extends StatelessWidget {
  Item1({required this.image, required this.price, required this.title});
  late final String title, image;
  late final dynamic price;
  @override
  Widget build(BuildContext context) {
    return SwippableCards(
      image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      label: title,
      price: "\$$price",
      textColor: Colors.black,
      textColor1: Colors.grey.shade900,
    );
  }
}

class Item2 extends StatelessWidget {
  Item2({required this.image, required this.price, required this.title});
  late final String title, image;
  late final dynamic price;
  @override
  Widget build(BuildContext context) {
    return SwippableCards(
      image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      label: title,
      price: "\$$price",
      textColor: Colors.grey.shade300,
      textColor1: Colors.grey.shade500,
    );
  }
}

class Item3 extends StatelessWidget {
  Item3({required this.image, required this.price, required this.title});
  late final String title, image;
  late final dynamic price;
  @override
  Widget build(BuildContext context) {
    return SwippableCards(
      image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
      label: title,
      price: "\$$price",
      textColor: Colors.black,
      textColor1: Colors.grey.shade900,
    );
  }
}

class SwippableCards extends StatelessWidget {
  late final DecorationImage image;
  late final String label;
  late final String price;
  late final Color textColor;
  late final Color textColor1;

  SwippableCards(
      {required this.image,
      required this.label,
      required this.price,
      required this.textColor,
      required this.textColor1});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (60 / 100) * MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(width: 0.5, color: Colors.grey),
          borderRadius: BorderRadius.circular(30),
          image: image),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
              child: SizedBox(
                height: 40.0,
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Color(0x66B3E5FC),
                    focusColor: Colors.grey,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: "What are you looking for?",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recommendations",
                  style: TextStyle(color: textColor1, fontSize: 20.0),
                ),
                Text(
                  label,
                  style: TextStyle(color: textColor, fontSize: 30.0),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  price,
                  style: TextStyle(color: textColor, fontSize: 20.0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TrendingItemCard extends StatelessWidget {
  TrendingItemCard(
      {required this.price, required this.title, required this.image});
  late final String title, image;
  late final dynamic price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.longestSide * (0.18),
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          border: Border.all(width: 0.5, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: MediaQuery.of(context).size.longestSide * (0.21),
          width: MediaQuery.of(context).size.longestSide * (0.18),
          decoration: BoxDecoration(
            color: Colors.red,
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
        ),
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "\$$price",
                      style: TextStyle(fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
