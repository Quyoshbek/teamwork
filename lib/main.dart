import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.calendar_month, size: 30),
          Icon(Icons.notifications_none_outlined, size: 30),
          Icon(Icons.search, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      appBar: AppBar(),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: 3,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) => Container(
                  width: 200,
                  height: 250,
                  color: Color(0xff7036E6),
                  child: Text(itemIndex.toString()),
            ),
            options: CarouselOptions(
              height: 250,
              aspectRatio: 2.0,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
          ),
        ],
      ),
    );
  }
}
