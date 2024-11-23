import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/hadeth/hadeth_content_screen.dart';
import 'package:islami/widget/loading_indicator.dart';

class HadethTab extends StatefulWidget {

  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
      List<Hadeth> ahadeth = []; 

  @override
  Widget build(BuildContext context) {
    if(ahadeth.isEmpty){
    loadHadethFile();
    }
    
    return Column(
      children: [
        Image.asset(
          'assets/images/hadeth_logo.png',
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        Expanded(
          child:ahadeth.isEmpty
          ?LoadingIndicator()
           :ListView.separated(
            padding: const EdgeInsets.only(top: 16),
            itemCount: ahadeth.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () => 
              Navigator.of(context).pushNamed(
                HadethContentScreen.routeName,
              arguments: ahadeth[index],
              ),
              child: Text(
                ahadeth[index].title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            separatorBuilder: (context, _) => const SizedBox(
              height: 12,
            ),
          ),
        ),
      ],
    );
  }
  Future<void> loadHadethFile() async{
  String ahadethFileContent=
      await rootBundle.loadString('assets/text/ahadeth.txt');
  List<String> ahadethStrings =ahadethFileContent.split('#');
   ahadeth =ahadethStrings.map((hadethString){
    List<String> hadethLines =hadethString.trim().split('\n');
    String title = hadethLines[0];
    hadethLines.removeAt(0);
    List<String> content = hadethLines ;
    return Hadeth(title, content);    
  }).toList();
  setState(() {});

}
}

