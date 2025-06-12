import 'package:flutter/material.dart';
import 'package:minimal_addiciton_beater/components/database/addiction.dart';
import 'package:minimal_addiciton_beater/components/database/addiction_database.dart';
import 'package:minimal_addiciton_beater/components/general/gesture_text.dart';
import 'package:minimal_addiciton_beater/components/popups/warning_dialog.dart';
import 'package:minimal_addiciton_beater/components/popups/yes_no_dialog.dart';
import 'package:minimal_addiciton_beater/pages/home_page.dart';
import 'package:provider/provider.dart';

class ManageCurrentAddictionPage extends StatelessWidget {
  const ManageCurrentAddictionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("Options:", style: TextStyle(fontSize: 20)),
          /*GestureText(
            text: "Edit",
            onTap: () {},
            textColor: null,
            fontSize: 16,
          ),*/
          GestureText(
            text: "Reset",
            onTap: () {
              showDialog(context: context, builder: (context) {
                return MyYesNoDialog(title: "Are you sure?", 
                  description: "Doing this will reset your addiction streak to today", 
                  okPressed: () {
                    var provider = Provider.of<AddictionDatabase>(context, listen: false);
                    int currentIndex = provider.currentIndex;
                    String currentAddiction = provider.currentAddictions[currentIndex].name;

                    provider.addNewAddictionDate(currentAddiction, DateTime.now());

                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => HomePage()));

                  });
              });
            },
            textColor: Colors.red,
            fontSize: 16,
          ),
          GestureText(
            text: "Delete",
            onTap: () async { 
              var provider = Provider.of<AddictionDatabase>(context, listen: false);
              int count = provider.currentAddictions.length;

              if(count <= 1) {
                showDialog(context: context, builder: (context){
                  return const MyWarningDialog(title: "Failed To Delete Addiction", description: "You cannot delete an addiction if it is the only addiction. If you would like to wipe the app please delete your data in settings.");
                });
                return;
              }

              showDialog(context: context, builder: (context) {
                return MyYesNoDialog(title: "Are you sure?", 
                  description: "You are attempting to delete this addiction. You cannot undo this action.",
                  okPressed: () {

                    int currentIndex = provider.currentIndex;
                    Addiction currentAddiction = provider.currentAddictions[currentIndex];
                    provider.deleteAddiction(currentAddiction.name);
                    provider.currentIndex = 0;
                   
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => HomePage()));

                  }); 
              });

              


            },
            textColor: Colors.red,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
