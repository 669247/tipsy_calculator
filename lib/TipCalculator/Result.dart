import 'package:tipsy_calculator/model/bill.dart';
import 'package:flutter/material.dart';

class ResultTip extends StatelessWidget {
  const ResultTip({Key? key, required this.bill}) : super(key: key);
  final Bill bill;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(),
    );
  }
}

// class Wheel extends StatefulWidget {
//   const Wheel({Key? key}) : super(key: key);

//   @override
//   State<Wheel> createState() => _WheelState();
// }

// class _WheelState extends State<Wheel> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      // body: ListWheelScrollView(
      //   itemExtent: 100,
      //   clipBehavior: Clip.antiAlias,
      //   children: const <Widget>[
      //     ElevatedButton(
      //       onPressed: null,
      //       child: Text(
      //         'Item 1',
      //         textAlign: TextAlign.start,
      //         style: TextStyle(
      //             fontSize: 25,
      //             color: Colors.black,
      //             fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //     ElevatedButton(
      //       onPressed: null,
      //       child: Text(
      //         'Item 2',
      //         textAlign: TextAlign.start,
      //         style: TextStyle(
      //             fontSize: 25,
      //             color: Colors.black,
      //             fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //     ElevatedButton(
      //       onPressed: null,
      //       child: Text(
      //         'Item 3',
      //         textAlign: TextAlign.start,
      //         style: TextStyle(
      //             fontSize: 25,
      //             color: Colors.black,
      //             fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //     ElevatedButton(
      //       onPressed: null,
      //       child: Text(
      //         'Item 4',
      //         textAlign: TextAlign.start,
      //         style: TextStyle(
      //             fontSize: 25,
      //             color: Colors.black,
      //             fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //     ElevatedButton(
      //       onPressed: null,
      //       child: Text(
      //         'Item 5',
      //         textAlign: TextAlign.start,
      //         style: TextStyle(
      //             fontSize: 25,
      //             color: Colors.black,
      //             fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //     ElevatedButton(
      //       onPressed: null,
      //       child: Text(
      //         'Item 6',
      //         textAlign: TextAlign.start,
      //         style: TextStyle(
      //             fontSize: 25,
      //             color: Colors.black,
      //             fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //     ElevatedButton(
      //       onPressed: null,
      //       child: Text(
      //         'Item 7',
      //         textAlign: TextAlign.start,
      //         style: TextStyle(
      //             fontSize: 25,
      //             color: Colors.black,
      //             fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //     ElevatedButton(
      //       onPressed: null,
      //       child: Text(
      //         'Item 8',
      //         textAlign: TextAlign.start,
      //         style: TextStyle(
      //             fontSize: 25,
      //             color: Colors.black,
      //             fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //   ],
      // ),
    // );
  // }
// }
