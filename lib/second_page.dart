import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:intl/intl.dart';
import 'package:teamwork/ScreenPage.dart';
import 'package:teamwork/task.dart';
import 'package:teamwork/task_item.dart';
import 'package:provider/provider.dart';

import 'database.dart';
import 'hi.dart';

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
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ScreenPage()),
                        );
                      },
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30, left: 20, bottom: 30),
                  child: Text(
                    "Tasks",
                    style: TextStyle(fontSize: 32),
                  ),
                ),
                Expanded(
                    child:Container(
                      width: MediaQuery.of(context).size.width*0.8,
                      child: Consumer<MainProvider>(builder: (context, value, child) {
                       return FutureBuilder(
                        future: DatabaseHelper.intance.getTasks(),
                        builder: ((context, AsyncSnapshot<List<Task>> snapshot) {
                          return ListView.builder(
                            padding: EdgeInsets.only(bottom: 10, right: 10),
                            itemBuilder: (context, index) {
                              return TaskItem(snapshot.data![index]);
                            },
                            itemCount: snapshot.data?.length ?? 0,
                          );
                        }));
                }),
                    ))
              ],
            ),
          )
        ]),
      );
  void taskItemList(context) {
    MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);
    mainProvider.updateTaskList();
  }
}
