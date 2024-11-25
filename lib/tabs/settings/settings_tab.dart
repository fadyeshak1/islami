import 'package:flutter/material.dart';
import 'package:islami/tabs/settings/language.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  List<language> languages = [
    language( 'English', 'en'),
    language( 'العربية', 'ar'),
  ];
  
 
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider> (context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dark Mode',
              style: Theme.of(context)
              .textTheme
              .titleLarge?.copyWith(fontWeight: FontWeight.w500)
              ),
              Switch(
                value: settingsProvider.themeMode == ThemeMode.dark,
               onChanged: (isDark) => settingsProvider
               .changeTheme(isDark? ThemeMode.dark :ThemeMode.light),
               )
            ],
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Language',
              style: Theme.of(context)
              .textTheme
              .titleLarge?.copyWith(fontWeight: FontWeight.w500)
              ),

             DropdownButtonHideUnderline(
               child: DropdownButton<language>(
                value: languages.firstWhere((language) =>
                   language.code == settingsProvider.languageCode),
                items: languages
                .map((Language) =>DropdownMenuItem<language>(
                 value: Language,
                child: Text(Language.name)
                )
                )
               .toList(),
               onChanged:(SelectedLanguage){
                if(SelectedLanguage != null){
                 settingsProvider.changeLanguage(SelectedLanguage.code);
                }
               },
               ),
             )
            ],
          ),
        ],
      ),
      );
  }
}