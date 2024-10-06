import 'package:flutter/material.dart';
import 'package:minimal_addiciton_beater/components/database/addiction_database.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Your Battles",
              style: TextStyle(fontSize: 22),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Provider.of<AddictionDatabase>(context)
                  .currentAddictions
                  .length,
              itemBuilder: (BuildContext context, int index) {
                TextStyle textStyle;
                bool isSelected = false;

                if (Provider.of<AddictionDatabase>(context).currentIndex ==
                    index) {
                  textStyle = const TextStyle(
                    fontSize: 20,
                  );
                  isSelected = true;
                } else {
                  textStyle = TextStyle(fontSize: 20, color: Colors.grey[400]);
                }

                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () => {
                        if (!isSelected)
                          {
                            Provider.of<AddictionDatabase>(context,
                                    listen: false)
                                .currentIndex = index,
                          },
                        Navigator.pop(context),
                      },
                      child: Text(
                        Provider.of<AddictionDatabase>(context)
                            .currentAddictions[index]
                            .name,
                        style: textStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
