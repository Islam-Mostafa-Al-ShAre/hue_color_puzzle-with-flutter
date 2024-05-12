// import 'package:flutter/foundation.dart';
// import 'package:flutter/widgets.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Our state
//     bool amIHovering = false;
//     Offset exitFrom = Offset(0, 0);

//     return MouseRegion(
//       onEnter: ( details) => setState(() => amIHovering = true),
//       onExit: ( details) => setState(() {
//         amIHovering = false;
//         exitFrom = details
//             .localPosition; // You can use details.position if you are interested in the global position of your pointer.
//       }),
//       child: Container(
//         width: 200,
//         height: 200,
//         child: Center(
//           child: Text(amIHovering
//               ? "Look mom, I'm hovering"
//               : "I exited from: $exitFrom"),
//         ),
//       ),
//     );
//   }
// }
