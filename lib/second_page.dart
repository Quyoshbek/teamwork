import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:intl/intl.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final CalendarWeekController _controller = CalendarWeekController();

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Color(0xffF2F5FF),
    appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text('CalendarWeek'),
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ],
    ),
    body: Column(children: [
      Container(
        height: 200,
        child: CalendarWeek(
          dateStyle: TextStyle(color: Colors.black),
          todayDateStyle: TextStyle(color: Color(0xff673CF6)),
          dayOfWeekStyle: TextStyle(color: Colors.black),
          weekendsStyle: TextStyle(color: Colors.black),
          dayShapeBorder: BoxShape.circle,
          controller: _controller,
          height: 100,
          showMonth: true,
          minDate: DateTime.now().add(
            Duration(days: -365),
          ),
          maxDate: DateTime.now().add(
            Duration(days: 365),
          ),
          onDatePressed: (DateTime datetime) {
            // Do something
            setState(() {});
          },
          onDateLongPressed: (DateTime datetime) {
            // Do something
          },
          onWeekChanged: () {
            // Do something
          },
          monthViewBuilder: (DateTime time) => Container(
            padding: EdgeInsets.only(top: 20, bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text(
                    style: TextStyle(
                      fontSize: 36,
                      color: Color(0xff2E3A59),
                    ),
                    DateFormat.yMMM().format(
                      DateTime.now(),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      shape: StadiumBorder(),
                      backgroundColor: Color(0xff3A49F9)),
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      Text("Add Task"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      Expanded(
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, left: 20, bottom: 30),
              child: Text("Tasks", style: TextStyle(fontSize: 32),),
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
      )
    ]),
  );
}
