import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.blue.shade700;
  LinearGradient? gradient;

  _showColorDialog(BuildContext context) async {
    final result = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Very Important Question"),
          content: const Text("Please Choose A Color"),
          actions: <Widget>[
            TextButton(
                child: const Text("Red"),
                onPressed: () {
                  color = Colors.red.shade700;
                  Navigator.pop(context, color);
                }),
            TextButton(
                child: const Text("Green"),
                onPressed: () {
                  color = Colors.green.shade700;
                  Navigator.pop(context, color);
                }),
            TextButton(
                child: const Text("Blue"),
                onPressed: () {
                  color = Colors.blue.shade700;
                  Navigator.pop(context, color);
                }),
            TextButton(
                child: const Text("Magenta"),
                onPressed: () {
                  const LinearGradient gradientMagenta = LinearGradient(
                    colors: [
                      // Color(0xFF8E2DE2), // Deep purple magenta
                      // Color(0xFFDA22FF), // Bright violet
                      // Color(0xFFFF6FD8), // Soft pink magenta
                      // Color(0xFFFFB6C1),

                      Color(0xFF7A00B3),
                      Color(0xFFBA00E0), // Ungu neon gelap
                      Color(0xFFDA00FF), // Fuchsia tajam
                      Color(0xFFFF00FF), // Magenta murni (FF00FF)
                    ],
                    // stops: [0.1, 0.4, 0.6, 0.8, 1],
                    stops: [0.1, 0.3, 0.7, 1.0],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  );
                  Navigator.pop(context, gradientMagenta);
                }),
          ],
        );
      },
    );
    setState(() {
      if (result is Color) {
        color = result;
        gradient = null;
      } else if (result is LinearGradient) {
        gradient = result;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: color,
    //   appBar: AppBar(
    //     title: const Text("Navigation Dialog Screen Eka"),
    //   ),
    //   body: Center(
    //     child: ElevatedButton(
    //         child: const Text("Change Color"),
    //         onPressed: () {
    //           _showColorDialog(context);
    //         }),
    //   ),
    // );

    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text("Navigation Dialog Screen Eka"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: gradient == null ? color : null,
          gradient: gradient,
        ),
        child: Center(
          child: ElevatedButton(
            child: const Text("Change Color"),
            onPressed: () {
              _showColorDialog(context);
            },
          ),
        ),
      ),
    );
  }
}
