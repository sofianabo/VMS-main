// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CurvedDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             _showCurvedDrawer(context);
//           },
//           child: Text('Open Drawer'),
//         ),
//       ),
//     );
//   }

//   void _showCurvedDrawer(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (BuildContext context) {
//         return ClipRRect(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20.0),
//             topRight: Radius.circular(20.0),
//           ),
//           child: Container(
//             color: Colors.white,
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Add your drawer content here
//                 ListTile(
//                   title: Text('Option 1'),
//                   onTap: () {
//                     // Handle option 1 tap
//                   },
//                 ),
//                 ListTile(
//                   title: Text('Option 2'),
//                   onTap: () {
//                     // Handle option 2 tap
//                   },
//                 ),
//                 // Add more options as needed
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
