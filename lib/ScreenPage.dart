import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:platform_date_picker/platform_date_picker.dart';
import 'package:teamwork/task.dart';

import 'database.dart';

class ScreenPage extends StatefulWidget {
  Task? currentTask;
  ScreenPage({this.currentTask,Key? key}) : super(key: key);

  @override
  State<ScreenPage> createState() => _ScreenPageState();

}

class _ScreenPageState extends State<ScreenPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  TimeOfDay time1 = TimeOfDay.now();
  TimeOfDay time2 = TimeOfDay.now();
  late TimeOfDay picket;
  late TimeOfDay picket2;
  void initState() {
    super.initState();
    time1 = TimeOfDay.now();
    time2 = TimeOfDay.now();

    if (widget.currentTask != null) {
      _nameController.text = widget.currentTask?.title ?? "...";
      _dateController.text = widget.currentTask?.startTime ?? "...";
    }
  }

  //select time
  Future<void> selectTime(BuildContext context) async {
    picket = (await showTimePicker(context: context, initialTime: time1))!;
    if (picket != null) {
      setState(() {
        time1 = picket;
      });
    }
  }

  Future<void> selectTime2(BuildContext context) async {
    picket2 = (await showTimePicker(context: context, initialTime: time2))!;
    if (picket2 != null) {
      setState(() {
        time2 = picket2;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300.0),
        child: AppBar(
          centerTitle: true,
          leading: BackButton(),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
          title: Text('Create a Task'),
          flexibleSpace: Padding(
            padding: EdgeInsets.only(top: 130, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 40),
                  child: TextField(
                    controller: _nameController,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    cursorColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, right: 40),
                  child: Text(
                    'Date',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 40),
                  child: TextField(
                    controller: _dateController,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.deepPurple,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Start time", style: TextStyle(color: Colors.grey),),
                      MaterialButton(
                        elevation: 0,
                        height: 70,
                        minWidth: 100,
                        color: Colors.white,
                        child: Text(formatTime(time2),style: TextStyle(fontSize: 32),),
                        onPressed: () async {
                          TimeOfDay? temp = await showPlatformTimePicker(
                            context: context,
                            initialTime: time2,
                          );
                          if (temp != null) setState(() => time2 = temp);
                        },
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("End time", style: TextStyle(color: Colors.grey),),
                      MaterialButton(
                        elevation: 0,
                        height: 70,
                        minWidth: 100,
                        color: Colors.white,
                        child: Text(formatTime(time1),style: TextStyle(fontSize: 32),),
                        onPressed: () async {
                          TimeOfDay? temp = await showPlatformTimePicker(
                            context: context,
                            initialTime: time1,
                          );
                          if (temp != null) setState(() => time1 = temp);
                        },
                      ),
                    ],
                  ),
                ]
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                'Description',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 7),
              child: Text(
                  'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 25),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Text(
                'Category',
                style: TextStyle(color: Colors.black45),
              ),
            ), // Category
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('1');
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, top: 5),
                      child: Container(
                        width: 120,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepPurpleAccent,
                        ),
                        child: const Center(
                            child: Text(
                              'Design',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('2');
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Container(
                        width: 120,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepPurpleAccent,
                        ),
                        child: const Center(
                            child: Text(
                              'Meeting',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('3');
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Container(
                        width: 120,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepPurpleAccent,
                        ),
                        child: const Center(
                            child: Text(
                              'Coding',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ), // 1
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('4');
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, top: 5),
                      child: Container(
                        width: 120,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepPurpleAccent,
                        ),
                        child: const Center(
                            child: Text(
                              'BDE',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('5');
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Container(
                        width: 120,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepPurpleAccent,
                        ),
                        child: const Center(
                            child: Text(
                              'Testing',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('6');
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Container(
                        width: 120,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepPurpleAccent,
                        ),
                        child: const Center(
                            child: Text(
                              'Quick call',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ), // 2
            Padding(
              padding: EdgeInsets.only(left: 10, top: 15, right: 10),
              child: GestureDetector(
                onTap: () {
                  widget.currentTask == null ? createTask() : updateTask();
                },
                child: Container(
                  width: 400,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurpleAccent,
                  ),
                  child: const Center(
                      child: Text(
                        'Create Task',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void createTask() async {
    Task newTask = Task(
        _nameController.text, "description1", DateTime.now(), "18:58", "00:00");

    var task = DatabaseHelper.intance.insert(newTask);
    Navigator.pop(context);
    print("chiqdi: $task");
  }

  void updateTask() async {
    Task currentTask = Task.withId(widget.currentTask?.id, _nameController.text, "description1",
        DateTime.now(), _dateController.text, "00:00");

    var res = await DatabaseHelper.intance.update(currentTask);

    Navigator.pop(context);
  }
}
String formatTime(TimeOfDay time) {
  DateTime current = new DateTime.now();
  current = DateTime(
      current.year, current.month, current.day, time.hour, time.minute);
  DateFormat format = DateFormat.jm();
  return format.format(current);
}


