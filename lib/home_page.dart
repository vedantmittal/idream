import 'package:flutter/material.dart';
import 'package:idream/home/projects.dart';

import 'home/books.dart';
import 'home/subjects.dart';

int defaultClassIndex = 4;
int defaultLanguage = 1;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<String> classList = [
    "12th",
    "11th",
    "10th",
    "9th",
    "8th",
    "7th",
    "6th",
    "5th",
    "4th",
    "3rd",
    "2nd",
    "1st"
  ];

  List<String> languageList = ["English is my preferred Language", "अंग्रेजी मेरी पसंदीदा भाषा है"];

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
                  child: StatefulBuilder(builder: (context, setState) {
                    return Padding(
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
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Wrap(
                                  runSpacing: 20,
                                  spacing: 15,
                                  children: classList.map((e) {
                                    return GestureDetector(
                                      onTap: () {
                                        defaultClassIndex =
                                            classList.indexOf(e);
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: defaultClassIndex ==
                                                        classList.indexOf(e)
                                                    ? Colors.blue
                                                    : Colors.black26),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: defaultClassIndex ==
                                                    classList.indexOf(e)
                                                ? Colors.blue[50]
                                                : Colors.transparent),
                                        child: Center(
                                          child: Text(
                                            e,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black45,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[100],
                                minimumSize: const Size(100, 40)),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
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
                  children:  [
                    Text(
                      classList[defaultClassIndex],
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500),
                    ),
                    const Icon(
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
              onTap: () {
                final Dialog dialogWithImage = Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  insetPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 24),
                  child: StatefulBuilder(builder: (context, setState) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Column(
                            children: [
                              Text(
                                'Choose your preferred Language',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),


                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 20.0),
                                child: Column(
                                  children: languageList.map((e) {
                                    return GestureDetector(
                                      onTap: () {
                                        if(defaultLanguage == 0){
                                          defaultLanguage = 1;
                                        } else {
                                          defaultLanguage = 0;
                                        }
                                        setState(() {});
                                        Navigator.pop(context, defaultLanguage);
                                      },
                                      child: Container(
                                        height: 60,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: defaultLanguage ==
                                                    languageList.indexOf(e)
                                                    ? Colors.green
                                                    : Colors.black26),
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color: defaultLanguage ==
                                                languageList.indexOf(e)
                                                ? Colors.green[50]
                                                : Colors.transparent),
                                        child: Row(
                                          children: [
                                            Text(
                                              e,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black45,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            defaultLanguage ==
                                                languageList.indexOf(e) ? CircleAvatar(
                                              maxRadius: 10,
                                              backgroundColor: Colors.green[100],
                                              child: const Icon(Icons.check, color: Colors.green, size: 12,),
                                            ) : const SizedBox()
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          ),

                        ],
                      ),
                    );
                  }),
                );
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => dialogWithImage,
                ).then((value) =>  setState(() {
                        defaultLanguage = value;
                }));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[100]),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children:  [
                    Text(
                     defaultLanguage == 0 ? 'Eng' : "हिन्दी",
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500),
                    ),
                    const Icon(
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
      body: ListView(
        children: [ Subject(),  Books(),  Projects()],
      ),
      // : CircularProgressIndicator(),
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
