import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Projects', style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black
          ),),
          SizedBox(height: 20),
          Wrap(
            runSpacing: 15.0,
            spacing: 15,
            children: [
              projectCard(),
              projectCard(),
              projectCard(),
              projectCard(),

            ],
          )


        ],
      ),
    );
  }

  Widget projectCard(){
    return Container(
      height: 55,
      padding: const EdgeInsets.only(left: 0, top: 8, bottom: 8, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.network('https://firebasestorage.googleapis.com/v0/b/idream-4e19c.appspot.com/o/Group%209204.svg?alt=media&token=da38ef50-9534-45f3-9bcd-75608e11342e'),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Maths', style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
              ),),
              Text('21 books', style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black
              ),),
            ],
          )
        ],
      ),
    );
  }
}
