import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:teamwork/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SecondPage(),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider.builder(
            itemCount: 3,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
              width: 200,
              height: 250,
              color: Color(0xff7036E6),
              child: Text(itemIndex.toString()),
            ),
            options: CarouselOptions(
              height: 200,
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
          Container(
            padding: EdgeInsets.only(top: 30, left: 20, bottom: 30),
            child: Text("Progress", style: TextStyle(fontSize: 32),),
          ),
          Expanded(child: ListView.builder(
              itemCount: 8,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: 30, right: 30, top: 10, bottom: 10),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding:EdgeInsets.all(20),
                              margin: EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                color: Color(0xff7837F5),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(Icons.event_note_outlined, color: Colors.white,),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Design Changes", style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),),
                                Text("2 days ago", style: TextStyle(color: Colors.grey, fontSize: 14),)
                              ],
                            ),
                          ],
                        ),
                      ),
                      PopupMenuButton(
                        onSelected: (value) {
                          // your logic
                        },
                        itemBuilder: (BuildContext bc) {
                          return const [
                            PopupMenuItem(
                              child: Text("Add"),
                              value: '/add',
                            ),
                            PopupMenuItem(
                              child: Text("Remove"),
                              value: '/remove',
                            ),
                            PopupMenuItem(
                              child: Text("Update"),
                              value: '/update',
                            )
                          ];
                        },
                      )
                    ],
                  ),
                );
              }),),
        ],
      ),
    );
  }
}
