import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenPage extends StatelessWidget {
  const ScreenPage({Key? key}) : super(key: key);

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
            SizedBox(
              height: 100,
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
                  print('bosildi');
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
}
