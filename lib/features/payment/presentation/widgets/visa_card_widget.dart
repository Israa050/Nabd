import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VisaCardWidget extends StatelessWidget {
  const VisaCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 176.70,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [Color(0xff0038FF), Color(0xff7919B4)],
          begin: AlignmentGeometry.topLeft,
          end: AlignmentGeometry.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: AlignmentGeometry.topCenter,
            child: Container(
              margin: EdgeInsets.fromLTRB(23, 22, 23, 20),
              width: double.infinity,
              height: 30,
              //color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/svgs/vector_two.svg'),

                  SvgPicture.asset('assets/svgs/vector_one.svg'),
                ],
              ),
            ),
          ),

          Align(
            alignment: AlignmentGeometry.center,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Row(
                children: [
                  Text(
                    '8629',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.0,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.0,
                      color: Color(0xffF8F8F8),
                    ),
                  ),

                  SizedBox(width: 11),

                  Text(
                    '9257',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.0,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.0,
                      color: Color(0xffF8F8F8),
                    ),
                  ),

                  SizedBox(width: 11),

                  Text(
                    '0928',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.0,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.0,
                      color: Color(0xffF8F8F8),
                    ),
                  ),

                  SizedBox(width: 11),

                  Text(
                    '3456',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.0,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.0,
                      color: Color(0xffF8F8F8),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            left: 10,
            top: 110,
            child: Padding(
              padding: const EdgeInsets.only(),
              child: SizedBox(
                height: 30,
                width: 60,
                child: Column(
                  children: [
                    Text(
                      'Valid till',
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                        height: 1.0,
                        letterSpacing: 0.0,
                        color: Color(0xffDDDDDD),
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      '09/24',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        height: 1.0,
                        letterSpacing: 0.0,
                        color: Color(0xffF8F8F8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Align(
            alignment: AlignmentGeometry.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 15,right: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Arafat Alam',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.0,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.0,
                      color: Color(0xffF8F8F8),
                    ),
                  ),
                  SvgPicture.asset('assets/svgs/visa_vector.svg'),
                ],
              ),
            ),
          ),

          Align(
            alignment: AlignmentGeometry.topRight,
            child: Image.asset('assets/images/one.png'),
          ),

          Align(
            alignment: AlignmentGeometry.bottomLeft,
            child: Image.asset('assets/images/two.png'),
          ),

          Align(
            alignment: AlignmentGeometry.bottomRight,
            child: Image.asset('assets/images/three.png'),
          ),
        ],
      ),
    );
  }
}
