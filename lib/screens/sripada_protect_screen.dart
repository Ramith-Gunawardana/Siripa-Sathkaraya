import 'package:flutter/material.dart';
import 'package:siripa_sathkaraya/models/kavi.dart';
import 'package:url_launcher/url_launcher.dart';

class SriPadaProtectScreen extends StatefulWidget {
  const SriPadaProtectScreen({super.key});

  @override
  State<SriPadaProtectScreen> createState() => _SriPadaProtectScreenState();
}

class _SriPadaProtectScreenState extends State<SriPadaProtectScreen> {
  int currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final Uri _url = Uri.parse(
      'https://dhammadanabooks.com/wp-content/uploads/2022/04/sripadaye-watha-gotha.pdf');

  Future<void> _launchUrl() async {
    if (!await launchUrl(
      _url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    //screen parameters
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //kavi pages
          SizedBox(
            height: screenHeight * 0.75,
            child: PageView.builder(
              controller: pageController,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Scrollbar(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        //kavi content
                        Text(
                          contents[i].content,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //author
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              contents[i].author,
                              style: const TextStyle(
                                fontSize: 18,
                                height: 1.4,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          //dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.bounceIn,
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  height: 10.0,
                  width: (index == currentIndex) ? 20 : 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: (index == currentIndex)
                        ? (Theme.of(context).colorScheme.primary)
                        : (Colors.grey),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          FilledButton.icon(
            onPressed: _launchUrl,
            icon: const Icon(Icons.download_outlined),
            label: const Text(
              'ශ්‍රී පාදය පිළිබඳ රචිත ග්‍රන්ථය බාගත කරන්න',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
