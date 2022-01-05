import 'package:flutter/material.dart';
import 'package:notes/app_bar_widget.dart';
import 'package:notes/pages/home/widgets/button_add_widget.dart';
import 'package:notes/pages/home/widgets/card_note_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>["Primeiro item"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "NOTES"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < notes.length; i++)
              CardNoteWidget(
                description: notes[i],
                onTap: () async {
                  var response = await Navigator.pushNamed(
                      context, "/create-note",
                      arguments: notes[i]);
                  if (response != null) {
                    var description = response as String;
                    if (response.isEmpty) {
                      notes.removeAt(i);
                    } else {
                      notes[i] = description;
                    }

                    setState(() {});
                  }
                },
              ),
          ],
        ),
      ),
      floatingActionButton: ButtonAddWidget(
        onPressed: () async {
          var description = await Navigator.pushNamed(context, "/create-note");
          print(description);
          if (description != null) {
            notes.add(description as String);
            setState(() {});
          }
        },
      ),
    );
  }
}
