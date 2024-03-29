

import 'package:flutter/material.dart';
import 'package:islamyapp/UI/home/ahadeth_model.dart';
import 'package:islamyapp/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../style/app_theme.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName='HadethDetailsScreen';

  @override
  Widget build(BuildContext context) {
    SettingProvider provider= Provider.of<SettingProvider>(context);
    HadethModel hadethModel=ModalRoute.of(context)?.settings.arguments as HadethModel;
    return  Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  provider.theme==ThemeMode.dark? "assets/images/darkbg.png" :'assets/images/default_bg.png'
              ), //msh mwgoda fe al theme
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(hadethModel.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: Card(

                  child:SingleChildScrollView(
                    child: Text(
                      hadethModel.content,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
