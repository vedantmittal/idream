import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../home_page.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref('projects');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            defaultLanguage == 0 ? 'Projects' : 'परियोजनाओं',
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          const SizedBox(height: 20),
          StreamBuilder(
              stream: dbRef.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Wrap(
                  runSpacing: 15.0,
                  spacing: 15,
                  children: snapshot.data!.snapshot.children.map((e) {
                    Map data = e.value as Map;
                    return Container(
                      height: 52,
                      padding: const EdgeInsets.only(
                          left: 0, top: 8, bottom: 8, right: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.network(data['image']),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                defaultLanguage == 0
                                    ? data['name_eng']
                                    : data['name_hin'],
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }).toList(),
                );
              }),
        ],
      ),
    );
  }
}
