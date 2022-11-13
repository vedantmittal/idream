import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../home_page.dart';

class Subject extends StatefulWidget {
  const Subject({Key? key}) : super(key: key);

  @override
  State<Subject> createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref('subjects');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            defaultLanguage == 0 ? 'Subjects' : 'विषयों',
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
                  runSpacing: 20,
                  spacing: 15,
                  children: snapshot.data!.snapshot.children.map((e) {
                    Map data = e.value as Map;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.network(data['image']),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          defaultLanguage == 0
                              ? data['name_eng']
                              : data['name_hin'],
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )
                      ],
                    );
                  }).toList(),
                );
              }),
        ],
      ),
    );
  }
}
