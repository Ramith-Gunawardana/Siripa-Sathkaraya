import 'package:flutter/material.dart';
import 'package:siripa_sathkaraya/constants/colors.dart';
import 'package:siripa_sathkaraya/screens/about_screen.dart';
import 'package:siripa_sathkaraya/screens/gaatha_screen.dart';
import 'package:siripa_sathkaraya/screens/kavi_screen.dart';
import 'package:siripa_sathkaraya/screens/map_screen.dart';
import 'package:siripa_sathkaraya/screens/sripada_protect_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //list of screens
  final List<Widget> screenList = <Widget>[
    const KaviScreen(),
    const GaathaScreen(),
    const MapScreen(),
    const SriPadaProtectScreen(),
    const AboutScreen(),
  ];

  //list of titles
  final List<String> titleList = [
    'තුන්සරණේ කවි',
    'සිරිපා වන්දනා ගාථාව',
    'මාර්ග සිතියම්',
    'සිරිපා අඩවිය රකිමු',
    'ව්‍යාපෘතිය ගැන'
  ];

  //selected screen index
  int _selectedIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _openDrawerOnStart();
  }

  void _openDrawerOnStart() {
    Future.delayed(const Duration(seconds: 1), () {
      _scaffoldKey.currentState!.openDrawer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor:
          MediaQuery.of(context).platformBrightness == Brightness.light
              ? kLightBlue
              : kDarkBlue1,
      appBar: AppBar(
        title: Text(
          titleList[_selectedIndex],
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        actions: const [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/icon.png'),
              ),
              SizedBox(
                width: 16,
              ),
            ],
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient:
              MediaQuery.of(context).platformBrightness == Brightness.light
                  ? const LinearGradient(
                      colors: [
                        kLightBlue,
                        kLightGreen,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
                    )
                  : const LinearGradient(
                      colors: [
                        kDarkBlue1,
                        kDarkGreen1,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                    ),
        ),
        child: screenList.elementAt(_selectedIndex),
      ),
      drawer: NavigationDrawer(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
            Navigator.pop(context);
          });
        },
        backgroundColor:
            MediaQuery.of(context).platformBrightness == Brightness.light
                ? kLightBlue
                : kDarkBlue1,
        children: [
          DrawerHeader(
            child: Column(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 80,
                        child: Image.asset('assets/images/kdu-logo.png'),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        height: 80,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                                'assets/images/manusathderana.png')),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'සිරිපා සත්කාරය',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          NavigationDrawerDestination(
            icon: const Icon(Icons.music_note_outlined),
            label: Text(titleList[0]),
          ),
          NavigationDrawerDestination(
            icon: const Icon(Icons.description_outlined),
            label: Text(titleList[1]),
          ),
          NavigationDrawerDestination(
            icon: const Icon(Icons.place_outlined),
            label: Text(titleList[2]),
          ),
          NavigationDrawerDestination(
            icon: const Icon(Icons.shield_outlined),
            label: Text(titleList[3]),
          ),
          NavigationDrawerDestination(
            icon: const Icon(Icons.info_outline_rounded),
            label: Text(titleList[4]),
          ),
        ],
      ),
    );
  }
}
