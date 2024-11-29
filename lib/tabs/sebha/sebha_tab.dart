import 'package:flutter/material.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int tasbehcount = 0; 
  double rotationAngle = 0; 

  void incrementTasbeh() {
    setState(() {
      tasbehcount++;   
      rotationAngle += pi / 6;      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120),      
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                
                Transform.rotate(
                  angle: rotationAngle,
                  child: Image.asset(
                    'assets/images/${Provider.of<SettingsProvider>(context).sebhaImage}.png'
,
                    width: 180,   
                  ),
                ),
                
                Positioned(
                  bottom: 155,       
                  child: Image.asset(
                    'assets/images/${Provider.of<SettingsProvider>(context).headImage}.png',
                    width: 70,   
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50), 
            Text(
              'عدد التسبيحات',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 35),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '$tasbehcount',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: incrementTasbeh,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                'سبحان الله',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
