import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Subject extends StatelessWidget {
  const Subject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Subjects', style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black
          ),),
SizedBox(height: 20),
          Wrap(
            runSpacing: 20.0,
            spacing: 15.0,
            children: [
              subjectCard(),
              subjectCard(),
              subjectCard(),
              subjectCard(),
              subjectCard(),
              subjectCard(),
              subjectCard(),
              subjectCard(),
              subjectCard(),
            ],
          )


        ],
      ),
    );
  }

  Widget subjectCard(){
    return Column(
      children: [
        SvgPicture.network('https://firebasestorage.googleapis.com/v0/b/idream-4e19c.appspot.com/o/Group%209204.svg?alt=media&token=da38ef50-9534-45f3-9bcd-75608e11342e'),
       const SizedBox(height: 5,),
        const Text('Maths', style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: Colors.black
        ),)
      ],
    );
  }
}
