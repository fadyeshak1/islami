import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:islami/widget/loading_indicator.dart';
import 'package:provider/provider.dart';

class SuraContentScreen extends StatefulWidget {

  static const String routeName ='/sura_content';

  @override
  State<SuraContentScreen> createState() => _SuraContentScreenState();
}

class _SuraContentScreenState extends State<SuraContentScreen> {
  List<String> ayat = [];
  late SuraContentArgs args ;

  // const SuraContentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    args=ModalRoute.of(context)!.settings.arguments as SuraContentArgs ;
    if(ayat.isEmpty){
    loadSuraFile();
    }

     final settingsProvider =Provider.of<SettingsProvider>(context);

    return Container(
       decoration:  BoxDecoration(
        image: DecorationImage(
          image: 
          AssetImage('assets/images/${settingsProvider.backgroundImageName}.png'),
          fit: BoxFit.fill,
          ),
          ),
      child:Scaffold(appBar: AppBar(
        title:  Text(args.surName,
        style: Theme.of(context).textTheme.headlineSmall,
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
        child: ayat.isEmpty
        ?LoadingIndicator()
        :ListView.builder(itemBuilder: 
        (_,index)=>Text( 
          ayat[index],
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        itemCount: ayat.length,
        ),
      ),

     )
     );
  }

  Future <void> loadSuraFile() async{
    await Future.delayed(Duration(seconds: 2));
    String sura =
            await rootBundle.loadString('assets/text/${args.index+1}.txt');
    ayat =sura.split('\r\n');
    setState(() {});
  }
}