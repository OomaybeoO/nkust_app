import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nkust_final/newNotes.dart';




String title="";
String index="";
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: addNotes()
    );
  }
}




class addNotes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _addNotes();
}

class _addNotes extends State<addNotes>{

  List<Widget> notes = <Widget>[];

  @override
  Widget build(BuildContext context) {

    void updatePage() {
      if (kDebugMode) {
        print("Update");
      }
      setState(() {
        // 讀資料庫並更新
        notes.clear();
        for(int i = 0; i < note; i++) {
          title = "no data";
          index = "no data";
          if (i == 0) {
            title = tempA1;
            index = tempA2;
          }
          if (i == 1) {
            title = tempB1;
            index = tempB2;
          }
          if (i == 2) {
            title = tempC1;
            index = tempC2;
          }
          if (i == 3) {
            title = tempD1;
            index = tempD2;
          }
          if (i == 4) {
            title = tempE1;
            index = tempE2;
          }
          notes.add(
              Card(
                child: Column(
                  children: [
                    ListTile(
                        leading: Icon(Icons.list),
                        title: Text(title),
                        subtitle: Text(index)
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              print(i);
                              note--;
                              if (i == 0) {
                                tempA1=tempB1;
                                tempA2=tempB2;
                                tempB1=tempC1;
                                tempB2=tempC2;
                                tempC1=tempD1;
                                tempC2=tempD2;
                                tempD1=tempE1;
                                tempD2=tempE2;
                                tempE1="";
                                tempE2="";
                              }
                              if (i == 1) {
                                tempB1=tempC1;
                                tempB2=tempC2;
                                tempC1=tempD1;
                                tempC2=tempD2;
                                tempD1=tempE1;
                                tempD2=tempE2;
                                tempE1="";
                                tempE2="";
                              }
                              if (i == 2) {
                                tempC1=tempD1;
                                tempC2=tempD2;
                                tempD1=tempE1;
                                tempD2=tempE2;
                                tempE1="";
                                tempE2="";

                              }
                              if (i == 3) {
                                tempD1=tempE1;
                                tempD2=tempE2;
                                tempE1="";
                                tempE2="";
                              }
                              if (i == 4) {
                                tempE1="";
                                tempE2="";
                              }
                              updatePage();
                            },
                            child: const Text("Delete"))
                      ],
                    )
                  ],
                ),
              )
          );
        }
      });
    }



    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Final"),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const newNote())
                  ).then((value) => updatePage());
                },
              ),
            ),
            body: SingleChildScrollView(
                child: Center(
                    child: Column(
                      children: notes
                    )
                )
            )
        )
    );
  }
}