import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );
  Future<void> initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      packageInfo = info;
    });
  }

  @override
  void initState() {
    super.initState();
    //get version number
    initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    //screen parameters
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: SizedBox(
              height: screenHeight * 0.75,
              child: Image.asset(
                'assets/images/flyer.jpg',
              ),
            ),
          ),
          FilledButton.icon(
            icon: const Icon(Icons.info_outline_rounded),
            label: const Text('About App'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AboutDialog(
                  applicationIcon: const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/icon.png'),
                    ),
                  ),
                  applicationName: 'සිරිපා සත්කාරය',
                  applicationVersion: packageInfo.version,
                  children: const [
                    Text(
                      'Mobile App developed by Ramith Gunawardana (Intake 39)',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'A heartfelt expression of gratitude goes to Major (Dr.) RMM Pradeep for his invaluable guidance.',
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Thank you to everyone who has contributed to the success of this project.',
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
