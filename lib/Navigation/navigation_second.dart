import "package:flutter/material.dart";

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation Second Screen Eka"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                child: const Text("Red"),
                onPressed: () {
                  color = Colors.red.shade700;
                  Navigator.pop(context, color);
                }),
            ElevatedButton(
                child: const Text("Green"),
                onPressed: () {
                  color = Colors.green.shade700;
                  Navigator.pop(context, color);
                }),
            ElevatedButton(
                child: const Text("Blue"),
                onPressed: () {
                  color = Colors.blue.shade700;
                  Navigator.pop(context, color);
                }),
            ElevatedButton(
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
