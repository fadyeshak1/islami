import 'package:flutter/material.dart';
import 'package:islami/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/radio/radio_tab.dart';
import 'package:islami/tabs/sebha/sebha_tab.dart';
import 'package:islami/tabs/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex =0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: 
          AssetImage('assets/images/default_bg.png'),
          fit: BoxFit.fill,
          ),
          ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'إسلامي'
            ),),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex:currentIndex ,
          onTap: (index){
            currentIndex = index ;
            setState(() {});
          },
          items: [
                BottomNavigationBarItem(
              icon: 
              ImageIcon(
                AssetImage('assets/images/2.0x/icon_quran@2x.png'),
                ),
                label: 'Quran',
                ),
                BottomNavigationBarItem(
              icon: 
              ImageIcon(
                AssetImage('assets/images/2.0x/icon_hadeth@2x.png'),
                ),
                label: 'Hadeth',
                ),
                BottomNavigationBarItem(
              icon: 
              ImageIcon(
                AssetImage('assets/images/2.0x/body_sebha_dark@2x.png'),
                ),
                label: 'Sebha',
                ),
                 BottomNavigationBarItem(
              icon: 
              ImageIcon(
                AssetImage('assets/images/2.0x/icon_radio@2x.png'),
                ),
                label: 'Radio'
                ),
                BottomNavigationBarItem(
              icon: 
              Icon(Icons.settings_outlined),
              label: 'Settings'
                ),
          ]
          ),
      ),
    );
  }
}