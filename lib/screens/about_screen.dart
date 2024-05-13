import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  int currentIndex = 0;
  late PageController pageController;
  final Uri _url = Uri.parse('https://forms.gle/vXXRN9kGHMu4Vuud8');

  Future<void> _launchUrl() async {
    if (!await launchUrl(
      _url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $_url');
    }
  }

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
    pageController = PageController(initialPage: 0);
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
              itemCount: 2,
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
                        i == 0
                            ? const Text(
                                'වනසමුද, රැකගමුද\n\nසිරිපා කරුණාව පෙරදැරිව, සොබා දහමට ආදරය කරමින් රැක බලාගැනීමේ ආදර්ශය සමාජගත කිරීමේ අභිප්‍රාය ඇතිව පැල්මඩුල්ල රාජමහ විහාරාධිපති, ඌව වෙල්ලස්ස විශ්ව විද්‍යාලයීය හිටපු කුලපති, ශ්‍රී පාදස්ථානාධිපති පූජ්‍ය බෙංගමුවේ ධම්මදින්න මහ නාහිමිගේ අනුශාසකත්වයෙන් හා මග පෙන්වීමෙන්, නුවරඑළිය හා රත්නපුර දිස්ත්‍රික් ලේකම් කාර්යාලයන්හි සම්බන්ධීකරණය හා සහභාගීත්වය ඇතිව  "මනුසත් දෙරණ" හා ජෙනරාල් ශ්‍රීමත් ජෝන් කොතලාවල ආරක්ෂක විශ්වවිද්‍යාලය  \'වනසමුද රැකගමූද \' යන තේමාව යටතේ " KDU - මනුසත් දෙරණ සිරිපා සත්කාරය 2024 "  මැයි මස17 හා 18 දෙ දින පුරා ක්‍රියාත්මක කිරීමට නියමිතය.\n\nදැනුවත් කිරීම හා ශ්‍රම දායකත්වය  තුළින්  පූජනීය  සිරිපා  අඩවිය පවිත්‍රව තබා ගැනීමේ වැදගත්කම සමාජ ගත කිරීම මෙම සමාජ සත්කාරක ව්‍යාපෘතියෙහි මූලික අරමුණයි.\n\nසිරිපා අඩවිය සිය වාස භූමිය කරගත් සතා-සීපාවා සිරිපා සමයට ඉඩ දී සැදැහැවතුන් තුළ ශ්‍රද්ධා භක්තිය වඩන්නට සැඟව නිහඬව බලා සිටිති. සැදැහැ සිත් තුළ  සංහිඳියාව නො බිඳ සොබා දහම නිහඩව බලා සිටින්නාක් මෙන්, මිනිස් අප ද කටයුතු කිරීමේදී  සොබා දහමේ සංහිඳියාව නො බිඳිය යුතුය යන ආදර්ශය මෙමගින් සමාජ ගතවනු ඇතැයි  අපේක්ෂිතය.\n\nසිරිපා අඩවිය ජෛව විද්‍යාත්මක වශයෙන් ඉතා ඉහළ වටිනාකමක් ඇති සංවේදී පරිසර කලාපයකි. දුරාතීතයේ සිට සිරිපා කරුණා කළ බැතිමත්හු  සිය පා සටහන් පමණක් සිරිපා අඩවියෙහි තබා ගියහ. නමුත් වර්තමානයේ සිරිපා කරුණාවෙහි යෙදෙන අති බහුතරයක් සාම්ප්‍රදායික වත්පිළිවෙත් වලින් බැහැරව තමන් රැගෙන ගිය ප්ලාස්ටික් බෝතල් , පොලිතීන් වැනි  නො දිරන අපද්‍රව්‍ය ස්වයං විනයකින් තොරව, මහ මග දමා යති.\n\nපරිසරවේදීන්ගේ විශ්ලේෂණ දත්ත  අනුව සිරිපා වාරයේදී  අවට පරිසරයට මුදාහරිනු ලබන නොදිරන ඝන අපද්‍රව්‍ය ප්‍රමාණය ටොන් සිය ගණනකි.\n\nදහම් සුවඳ පැතිරෙන සිරිපා අඩවිය ම කැලි කසළ වලින් අපිරිසිදු වීම අශෝභන දසුනකි.\n\nප්ලාස්ටික් හා පොලිතීන් වැනි  දිරාපත් නො වන අපද්‍රව්‍ය  පරිසරයට  අවම ලෙස බැහැර  කිරීම තුළින් සිරිපා අඩවියෙහි සොබා සිරිය හා පාරිසරික සමතුලිතතාවය  ආරක්ෂා කිරීම අපේ ජාතික වගකීමකි.\n\nමැයි 17 වෙනිදා  කොටුව දුම්රිය ස්ථානයේ සිට හැටන්-නල්ලතන්නිය මාර්ගය, එරත්න-කූරුවිට මාර්ගය හා රත්නපුර-පලාබද්දල මාර්ගයන්  ඔස්සේ  කොතලාවල ආරක්ෂක විශ්වවිද්‍යාලයීය විද්‍යාර්ථයන්  කණ්ඩායම්  ලෙස  උඩ මළුවට කරුණා කරමින්  ප්ලාස්ටික් හා පොලිතීන් අපද්‍රව්‍ය පරිසරයට බැහැර කිරීම නිසා සිදුවන පරිසරික හානිය පිළිබඳව  බැතිමතුන් දැනුවත් කිරීමට අපේක්ෂිතය.\n\nමැයි  18 වෙනි දා  උදෑසන උඩ මළුවේ සිට ප්‍රධාන මාර්ගයන්  තුන ඔස්සේ ක්‍රමයෙන් පහළට බසිමින්, පරිසරය පවිත්‍ර කිරීමේ " සිරිපා සත්කාරය " ආරම්භ කිරීමට නියමිත ය. එම පිරිස බැතිමතුන් මාර්ගය දෙ පස බැහැර  කරන ලද ප්ලාස්ටික් හා පොලිතින් ඇතුළු නො දිරන අපද්‍රව්‍ය එක් රැස් කර බැහැර කරන ස්ථාන කරා රැගෙන ඒමට නියමිත ය.\n\nමෙම පරිසර හිතකාමී  සමාජ සත්කාර වැඩසටහන විශ්වවිද්‍යාලයීය KDU Rotract Club සහ KDU  National Rover Crew, විශ්ව විද්‍යාලයීය  ශිෂ්‍ය ප්‍රජාව හා එක්ව   සංවිධානය කරයි.\n\nවිශ්ලේෂණාත්මක අධ්‍යයන වැඩසටහනක් ලෙස  කොතලාවල ආරක්ෂක විශ්වවිද්‍යාලයීය ආපදා කළමනාකරණ හා පර්යේෂණ මධ්‍යස්ථානය මෙම පාරිසරික ගැටලුවලට දීර්ඝකාලීන විසඳුම්  යෝජනා කිරීමේ අපේක්ෂාවෙන්  ඊට අවශ්‍ය පාරිසරික දත්ත හා තොරතුරු රැස්කිරීමට ද අපේක්ෂිතය.\n\nජෙනරාල් ශ්‍රීමත් ජෝන් කොතලාවල ආරක්ෂක විශ්වවිද්‍යාලයීය උපකුලපති රියර් අද්මිරාල් ධම්මික කුමාර මහතාගේ මග පෙන්වීම හා අධීක්ෂණය යටතේ මෙම ව්‍යාපෘතිය සංවිධානය කරනු ලබයි.',
                                style: TextStyle(fontSize: 18),
                              )
                            : Center(
                                child: SizedBox(
                                  height: screenHeight * 0.75,
                                  child: Image.asset(
                                    'assets/images/flyer.jpg',
                                  ),
                                ),
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
              2,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilledButton.icon(
                onPressed: _launchUrl,
                icon: const Icon(Icons.feedback_outlined),
                label: const Text('App Feedback'),
              ),
              const SizedBox(
                width: 16,
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
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );

    // return Padding(
    //   padding: const EdgeInsets.all(16),
    //   child: SingleChildScrollView(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Center(
    //           child: SizedBox(
    //             height: screenHeight * 0.5,
    //             child: Image.asset(
    //               'assets/images/flyer.jpg',
    //             ),
    //           ),
    //         ),
    //         Text(
    //           'වනසමුද, රැකගමුද\n\nසිරිපා කරුණාව පෙරදැරිව, සොබා දහමට ආදරය කරමින් රැක බලාගැනීමේ ආදර්ශය සමාජගත කිරීමේ අභිප්‍රාය ඇතිව පැල්මඩුල්ල රාජමහ විහාරාධිපති, ඌව වෙල්ලස්ස විශ්ව විද්‍යාලයීය හිටපු කුලපති, ශ්‍රී පාදස්ථානාධිපති පූජ්‍ය බෙංගමුවේ ධම්මදින්න මහ නාහිමිගේ අනුශාසකත්වයෙන් හා මග පෙන්වීමෙන්, නුවරඑළිය හා රත්නපුර දිස්ත්‍රික් ලේකම් කාර්යාලයන්හි සම්බන්ධීකරණය හා සහභාගීත්වය ඇතිව  "මනුසත් දෙරණ" හා ජෙනරාල් ශ්‍රීමත් ජෝන් කොතලාවල ආරක්ෂක විශ්වවිද්‍යාලය  \'වනසමුද රැකගමූද \' යන තේමාව යටතේ \" KDU - මනුසත් දෙරණ සිරිපා සත්කාරය 2024 \"  මැයි මස17 හා 18 දෙ දින පුරා ක්‍රියාත්මක කිරීමට නියමිතය.\n\nදැනුවත් කිරීම හා ශ්‍රම දායකත්වය  තුළින්  පූජනීය  සිරිපා  අඩවිය පවිත්‍රව තබා ගැනීමේ වැදගත්කම සමාජ ගත කිරීම මෙම සමාජ සත්කාරක ව්‍යාපෘතියෙහි මූලික අරමුණයි.\n\nසිරිපා අඩවිය සිය වාස භූමිය කරගත් සතා-සීපාවා සිරිපා සමයට ඉඩ දී සැදැහැවතුන් තුළ ශ්‍රද්ධා භක්තිය වඩන්නට සැඟව නිහඬව බලා සිටිති. සැදැහැ සිත් තුළ  සංහිඳියාව නො බිඳ සොබා දහම නිහඩව බලා සිටින්නාක් මෙන්, මිනිස් අප ද කටයුතු කිරීමේදී  සොබා දහමේ සංහිඳියාව නො බිඳිය යුතුය යන ආදර්ශය මෙමගින් සමාජ ගතවනු ඇතැයි  අපේක්ෂිතය.\n\nසිරිපා අඩවිය ජෛව විද්‍යාත්මක වශයෙන් ඉතා ඉහළ වටිනාකමක් ඇති සංවේදී පරිසර කලාපයකි. දුරාතීතයේ සිට සිරිපා කරුණා කළ බැතිමත්හු  සිය පා සටහන් පමණක් සිරිපා අඩවියෙහි තබා ගියහ. නමුත් වර්තමානයේ සිරිපා කරුණාවෙහි යෙදෙන අති බහුතරයක් සාම්ප්‍රදායික වත්පිළිවෙත් වලින් බැහැරව තමන් රැගෙන ගිය ප්ලාස්ටික් බෝතල් , පොලිතීන් වැනි  නො දිරන අපද්‍රව්‍ය ස්වයං විනයකින් තොරව, මහ මග දමා යති.\n\nපරිසරවේදීන්ගේ විශ්ලේෂණ දත්ත  අනුව සිරිපා වාරයේදී  අවට පරිසරයට මුදාහරිනු ලබන නොදිරන ඝන අපද්‍රව්‍ය ප්‍රමාණය ටොන් සිය ගණනකි.\n\nදහම් සුවඳ පැතිරෙන සිරිපා අඩවිය ම කැලි කසළ වලින් අපිරිසිදු වීම අශෝභන දසුනකි.\n\nප්ලාස්ටික් හා පොලිතීන් වැනි  දිරාපත් නො වන අපද්‍රව්‍ය  පරිසරයට  අවම ලෙස බැහැර  කිරීම තුළින් සිරිපා අඩවියෙහි සොබා සිරිය හා පාරිසරික සමතුලිතතාවය  ආරක්ෂා කිරීම අපේ ජාතික වගකීමකි.\n\nමැයි 17 වෙනිදා  කොටුව දුම්රිය ස්ථානයේ සිට හැටන්-නල්ලතන්නිය මාර්ගය, එරත්න-කූරුවිට මාර්ගය හා රත්නපුර-පලාබද්දල මාර්ගයන්  ඔස්සේ  කොතලාවල ආරක්ෂක විශ්වවිද්‍යාලයීය විද්‍යාර්ථයන්  කණ්ඩායම්  ලෙස  උඩ මළුවට කරුණා කරමින්  ප්ලාස්ටික් හා පොලිතීන් අපද්‍රව්‍ය පරිසරයට බැහැර කිරීම නිසා සිදුවන පරිසරික හානිය පිළිබඳව  බැතිමතුන් දැනුවත් කිරීමට අපේක්ෂිතය.\n\nමැයි  18 වෙනි දා  උදෑසන උඩ මළුවේ සිට ප්‍රධාන මාර්ගයන්  තුන ඔස්සේ ක්‍රමයෙන් පහළට බසිමින්, පරිසරය පවිත්‍ර කිරීමේ \" සිරිපා සත්කාරය \" ආරම්භ කිරීමට නියමිත ය. එම පිරිස බැතිමතුන් මාර්ගය දෙ පස බැහැර  කරන ලද ප්ලාස්ටික් හා පොලිතින් ඇතුළු නො දිරන අපද්‍රව්‍ය එක් රැස් කර බැහැර කරන ස්ථාන කරා රැගෙන ඒමට නියමිත ය.\n\nමෙම පරිසර හිතකාමී  සමාජ සත්කාර වැඩසටහන විශ්වවිද්‍යාලයීය KDU Rotract Club සහ KDU  National Rover Crew, විශ්ව විද්‍යාලයීය  ශිෂ්‍ය ප්‍රජාව හා එක්ව   සංවිධානය කරයි.\n\nවිශ්ලේෂණාත්මක අධ්‍යයන වැඩසටහනක් ලෙස  කොතලාවල ආරක්ෂක විශ්වවිද්‍යාලයීය ආපදා කළමනාකරණ හා පර්යේෂණ මධ්‍යස්ථානය මෙම පාරිසරික ගැටලුවලට දීර්ඝකාලීන විසඳුම්  යෝජනා කිරීමේ අපේක්ෂාවෙන්  ඊට අවශ්‍ය පාරිසරික දත්ත හා තොරතුරු රැස්කිරීමට ද අපේක්ෂිතය.\n\nජෙනරාල් ශ්‍රීමත් ජෝන් කොතලාවල ආරක්ෂක විශ්වවිද්‍යාලයීය උපකුලපති රියර් අද්මිරාල් ධම්මික කුමාර මහතාගේ මග පෙන්වීම හා අධීක්ෂණය යටතේ මෙම ව්‍යාපෘතිය සංවිධානය කරනු ලබයි.',
    //           style: TextStyle(fontSize: 18),
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: [
    //             FilledButton.icon(
    //               onPressed: _launchUrl,
    //               icon: const Icon(Icons.feedback_outlined),
    //               label: const Text('App Feedback'),
    //             ),
    //             const SizedBox(
    //               width: 16,
    //             ),
    //             FilledButton.icon(
    //               icon: const Icon(Icons.info_outline_rounded),
    //               label: const Text('About App'),
    //               onPressed: () {
    //                 showDialog(
    //                   context: context,
    //                   builder: (context) => AboutDialog(
    //                     applicationIcon: const CircleAvatar(
    //                       backgroundColor: Colors.transparent,
    //                       child: CircleAvatar(
    //                         backgroundImage:
    //                             AssetImage('assets/images/icon.png'),
    //                       ),
    //                     ),
    //                     applicationName: 'සිරිපා සත්කාරය',
    //                     applicationVersion: packageInfo.version,
    //                     children: const [
    //                       Text(
    //                         'Mobile App developed by Ramith Gunawardana (Intake 39)',
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.w600,
    //                         ),
    //                       ),
    //                       SizedBox(height: 12),
    //                       Text(
    //                         'A heartfelt expression of gratitude goes to Major (Dr.) RMM Pradeep for his invaluable guidance.',
    //                       ),
    //                       SizedBox(height: 8),
    //                       Text(
    //                         'Thank you to everyone who has contributed to the success of this project.',
    //                       ),
    //                     ],
    //                   ),
    //                 );
    //               },
    //             ),
    //           ],
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
