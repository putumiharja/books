import 'package:flutter/material.dart';
import '../Navigation/navigation_second.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

// class _NavigationFirstState extends State<NavigationFirst> {
//   Color color = Colors.blue.shade700;

//   Future _navigateAndGetColor(BuildContext context) async {
//     color = await Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const NavigationSecond()),
//         ) ??
//         Colors.blue;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: color,
//       appBar: AppBar(
//         title: const Text("Navigation First Screen Eka"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//             child: const Text("Change Color"),
//             onPressed: () {
//               _navigateAndGetColor(context);
//             }),
//       ),
//     );
//   }
// }

class _NavigationFirstState extends State<NavigationFirst> {
  Color? color = Colors.blue.shade700;
  LinearGradient? gradient;

  Future _navigateAndGetColor(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NavigationSecond()),
    );

    if (result is Color) {
      setState(() {
        color = result;
        gradient = null; // Reset gradient
      });
    } else if (result is LinearGradient) {
      setState(() {
        gradient = result;
        color = null; // Reset color
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text("Navigation First Screen Eka"),
      ),
      body: Container(
        decoration: gradient != null ? BoxDecoration(gradient: gradient) : null,
        color: gradient == null ? color : null,
        child: Center(
          child: ElevatedButton(
            child: const Text("Change Color"),
            onPressed: () {
              _navigateAndGetColor(context);
            },
          ),
        ),
      ),
    );
  }
}
