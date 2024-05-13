import 'package:flutter/material.dart';

class GaathaScreen extends StatefulWidget {
  const GaathaScreen({super.key});

  @override
  State<GaathaScreen> createState() => _GaathaScreenState();
}

class _GaathaScreenState extends State<GaathaScreen> {
  @override
  Widget build(BuildContext context) {
    //screen width
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'යං නමමදාය නදියා.. පුලිනෙච තිරෙ..\nයං සචඡබදධ ගිරිකෙ.. සුමනා චලගගෙ..\nයං තථථ යොනක පුරෙ.. මුනිනොච පාදං..\nතං පාදලාංඡන මහං.. සිරසා නමාමි..',
                style: TextStyle(
                  fontSize: 20,
                  height: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'අප මහා තථාගතයන් වහන්සේ නර්මදා නදී තීරයේදීත්, සච්චබද්ධ පර්වතයේදීත්, සමන්ගිරේත්, යෝනක පුරයේදීත් තම පාද ලාංඡනය උන්වහන්සේගේ අපරිමිත වූ අධිෂ්ඨාන බල මහිමයෙන් පිහිටවූ සේක.\nඒ උත්තම වූ ශ්‍රී පා කමල් මම හිස බිම හොවා වඳිනෙමි..  දොහොත් මුදුන් තබා වන්දනා කරමි!',
                style: TextStyle(
                  fontSize: 18,
                  height: 2,
                ),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
