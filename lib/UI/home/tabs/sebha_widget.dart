import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../providers/settings_provider.dart';

class SebhaWidget extends StatefulWidget {
  @override
  State<SebhaWidget> createState() => _SebhaWidgetState();
}

class _SebhaWidgetState extends State<SebhaWidget> {
  int counter=0;
  int currentindex=0;
  double turn=0.0;

  List<String>ad3ya=[
    'سبحان الله',
    'الحمدلله',
    "الله اكبر",
    "لا اله الا الله"
  ];

  @override
  Widget build(BuildContext context) {
    SettingProvider provider=Provider.of<SettingProvider>(context);
    return Column(

      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: (){
              setState(() {
                turn+=1/34;

                counter++;
                if(counter== 34){
                  repeat();
                }
                if(currentindex==ad3ya.length){
                  currentindex=0;

                }
              });

            },
            child: Stack(

              alignment: Alignment.topCenter,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Image.asset(
                      provider.theme==ThemeMode.light?'assets/images/head of seb7a.png':"assets/images/head of seb7a dark.png",
                      height: 200,width: double.infinity, )),
                Container(
                    margin: EdgeInsets.only(top: 110,),
                    child: AnimatedRotation(
                        turns: turn,
                        duration: Duration(seconds: 1),

                        child: Image.asset(provider.theme==ThemeMode.light?'assets/images/body of seb7a.png':"assets/images/body of seb7a dark.png"  ,width: double.infinity,))),],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text( AppLocalizations.of(context)!.hymnsnumber,style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontWeight: FontWeight.bold,fontSize: 30)),
              SizedBox(height: 20,),
              Container(

                  child: ElevatedButton(
                      style:ElevatedButton.styleFrom(backgroundColor:Theme.of(context).primaryColor,fixedSize: Size(80, 90) ) ,
                      onPressed:  ()
                      {
                        setState(() {


                        });


                      },
                      child:  Text('${counter}' ,style: TextStyle(fontSize: 25,color: Theme.of(context).colorScheme.onPrimary),

                      )
                  )),
              SizedBox(height: 20,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).dividerColor,
                      border: Border.all(
                          width: 2,color:Theme.of(context).primaryColor,style: BorderStyle.solid

                      )),


                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        turn+=1/34;

                        counter++;
                        if(counter== 34){
                          repeat();
                        }
                        if(currentindex==ad3ya.length){
                          currentindex=0;

                        }
                      });

                    },
                    child: Text(' ${ad3ya[currentindex]}',
                        style: TextStyle(fontSize: 25,color: Theme.of(context).colorScheme.onSecondary)),
                  )),
            ],
          ),
        ),

      ],
    );
  }

  void repeat( ){
    setState(() {
      counter=0;
      currentindex++;
    });

  }
}



