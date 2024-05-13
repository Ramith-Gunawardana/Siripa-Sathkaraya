import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int selectedIndex = 0;
  List<String> imagePathList = [
    'assets/images/nallathanniya.jpg',
    'assets/images/erathna.jpg',
    'assets/images/palabaddala.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    //screen parameters
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      child: Column(
        children: [
          DropdownButtonFormField<int>(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            items: const [
              DropdownMenuItem(value: 0, child: Text('නල්ලතන්නිය මාර්ගය')),
              DropdownMenuItem(value: 1, child: Text('එරත්න මාර්ගය')),
              DropdownMenuItem(value: 2, child: Text('පලාබද්දල මාර්ගය')),
            ],
            value: selectedIndex,
            onChanged: (value) {
              setState(() {
                selectedIndex = value!;
              });
            },
            borderRadius: BorderRadius.circular(8),
          ),
          const SizedBox(
            height: 24,
          ),
          InteractiveViewer(
            minScale: 0.3,
            child: Image.asset(
              imagePathList[selectedIndex],
              height: screenHeight * 0.75,
            ),
          ),
        ],
      ),
    );
  }
}
