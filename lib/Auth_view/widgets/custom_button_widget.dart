import 'package:flutter/material.dart';


class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    required this.fun,
    required this.buttonText,
    this.color = Colors.blue,
    this.imageIcon,
  }) : super(key: key);
  final Function fun;
  final String buttonText;
  final Color color;
  final String? imageIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          fun();
        },
        child:Container(
                height: 45,
                width:MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: color,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Center(
                  child: Text(
                   buttonText,
                    style: TextStyle(fontSize: 17,
                      color: Colors.white,),
                  ),
                ),
              ));
  }
}

// class CustomButtonWidgetTwo extends StatelessWidget {
//   const CustomButtonWidgetTwo({
//     Key? key,
//     required this.fun,
//     required this.buttonText,
//     required this.color,
//     required this.hight,
//     required this.width,
//   }) : super(key: key);
//   final Function fun;
//   final String buttonText;
//   final Color color;
//   final double hight;
//   final double width;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         onTap: () {
//           fun();
//         },
//         child: Container(
//           height: hight,
//           width: width,
//           decoration: BoxDecoration(
//               // border: Border.all(color: Colors.white),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 0,
//                   blurRadius: 40,
//                   offset: Offset(0, 10), // changes position of shadow
//                 ),
//               ],
//               color: color,
//               borderRadius: BorderRadius.all(Radius.circular(30))),
//           child: Center(
//             child: CustomTextWidget(
//               text: buttonText,
//               textSize: 17,
//               color: Colors.white,
//             ),
//           ),
//         ));
//   }
// }
