import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';


class HadethContentScreen extends StatelessWidget {

  static const String routeName ='/hadeth_content';

  

  // const HadethContentScreen({super.key});
  @override

  Widget build(BuildContext context) {

    final settingsProvider = Provider.of<SettingsProvider>(context);

    Hadeth hadeth=ModalRoute.of(context)!.settings.arguments as Hadeth ;
    return Container(
       decoration:  BoxDecoration(
        image: DecorationImage(
          image: 
          AssetImage('assets/images/${settingsProvider.backgroundImageName}.png'),
          fit: BoxFit.fill,
          ),
          ),
      child:Scaffold(appBar: AppBar(
        title:  Text(hadeth.title,
        style:  Theme.of(context).textTheme.headlineSmall,
        ), 
      ),
      body: Container(
        padding:EdgeInsets.all(24),
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context) .height *0.07 ,
          horizontal: 30 ,
        ), 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: ListView.builder(
          itemBuilder: (_,index) => Text(
             hadeth.content[index],
           style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
          ),
          itemCount: hadeth.content.length,
        ),
      ),

     ),
     );
  }
}