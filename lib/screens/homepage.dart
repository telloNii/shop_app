import 'package:design/models/products.dart';
import 'package:design/screens/view_item_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:design/widgets/homescreen_cards.dart';

class HomePage extends StatefulWidget {
  static final String id = "Home page route";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  int _currentRowIndex = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  late Future<List<Products>> futureData;
  List cardList = [];
  @override
  void initState() {
    super.initState();

    futureData = fetchProductsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Products>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Products>? data = snapshot.data;
            return ListView(
              padding: EdgeInsets.all(0),
              children: [
                FutureBuilder<List<Products>>(
                  future: futureData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Products>? data = snapshot.data!;
                      cardList = [
                        Item1(
                          image: data[_currentIndex % 20].image,
                          price: data[_currentIndex % 20].price,
                          title: data[_currentIndex % 20].title,
                        ),
                        Item2(
                          image: data[_currentIndex % 20].image,
                          price: data[_currentIndex % 20].price,
                          title: data[_currentIndex % 20].title,
                        ),
                        Item3(
                          image: data[_currentIndex % 20].image,
                          price: data[_currentIndex % 20].price,
                          title: data[_currentIndex % 20].title,
                        )
                      ];
                      return CarouselSlider(
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * 0.58,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index + 19;
                              _currentRowIndex = index;
                            });
                          },
                        ),
                        items: cardList.map((card) {
                          return Builder(builder: (BuildContext context) {
                            return Container(
                              child: card,
                            );
                          });
                        }).toList(),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    // By default show a loading spinner.
                    return CircularProgressIndicator();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(cardList, (index, url) {
                    return Container(
                      width: _currentRowIndex == index ? 10.0 : 7.0,
                      height: _currentRowIndex == index ? 10.0 : 7.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentRowIndex == index
                            ? Colors.blueAccent
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trending",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                      Text(
                        "Show all",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.28,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ItemViewScreen(
                                      image: data[index].image,
                                      price: data[index].price,
                                      label: data[index].title,
                                      category: data[index].category,
                                      description: data[index].description,
                                      id: data[index].id,
                                    ),
                                  ),
                                );
                              },
                              child: TrendingItemCard(
                                image: data[index].image,
                                price: data[index].price,
                                title: data[index].title,
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                      Text(
                        "Show all",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                ),
                Categories(
                  icon: FontAwesomeIcons.female,
                  label: "women's clothing",
                ),
                Categories(
                  icon: FontAwesomeIcons.male,
                  label: "men's clothing",
                ),
                Categories(
                  icon: FontAwesomeIcons.gem,
                  label: "jewelery",
                ),
                Categories(
                  icon: Icons.electrical_services,
                  label: "electronics",
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default show a loading spinner.
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
