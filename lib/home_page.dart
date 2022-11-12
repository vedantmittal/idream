import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:idream/home/projects.dart';
import 'package:idream/models/model.dart';

import 'home/books.dart';
import 'home/subjects.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseModel? firebaseModel;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref('Idream');

  int _selectedIndex = 0;

  Map<String, dynamic> dataValue = {};
  int defaultClassIndex = 4;
  int defaultLanguage = 0;

  @override
  void initState() {
    retrieveData();
    super.initState();
  }

  // Future<void> retrieveStudentData() async {
  //   dbRef.get().whenComplete(() {
  //
  //   });
  //   dbRef.child("Students").onChildAdded.listen((data) {
  //     StudentData studentData = StudentData.fromJson(data.snapshot.value as Map);
  //     Student student = Student(key: data.snapshot.key, studentData: studentData);
  //     studentList.add(student);
  //     setState(() {});
  //   });
  // }

  Future<void> retrieveData() async {
    DataSnapshot data = await dbRef.get();
    dataValue = Map<String, dynamic>.from(data.value as Map);
    setState(() {

    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.drag_handle_rounded,
          color: Colors.black,
        ),
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                final Dialog dialogWithImage = Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  insetPadding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 24),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          children: [
                            Text(
                              'Select Class',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                            ),
                            Wrap(
                              runSpacing: 15,
                              spacing: 15,
                              children: [],
                            )
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 40)),
                          child: Text(
                            'Cancel',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => dialogWithImage,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[100]),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Class 9',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.expand_more_sharp,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[100]),
                padding: const EdgeInsets.all(3),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Eng',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.expand_more_sharp,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.notifications_none_rounded,
              color: Colors.black,
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: dataValue.isNotEmpty
          ? ListView(
              children: [const Subject(), const Books(), const Projects()],
            )
          : CircularProgressIndicator(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: 'Home',
            activeIcon: Icon(
              Icons.book,
              color: Colors.blue,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outline_outlined),
            label: 'My Reports',
            activeIcon: Icon(
              Icons.pie_chart,
              color: Colors.blue,
            ),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        selectedFontSize: 12,
        iconSize: 23,
        onTap: _onItemTapped,
        elevation: 5,
        backgroundColor: Colors.white,
      ),
    );
  }
}
