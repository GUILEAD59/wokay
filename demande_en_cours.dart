import 'package:flutter/material.dart';
import 'package:tests/gbase/gbase.dart';
import '../../method/methodes.dart';
import 'package:url_launcher/url_launcher_string.dart';


class ask extends StatefulWidget {
  const ask({Key? key}) : super(key: key);

  @override
  State<ask> createState() => _askState();
}

class _askState extends State<ask> {

  List<Widget> containerList = [];


    ok ()
 async {

    int bof = 1;

    await GDirectRequest.select(
        sql: "SELECT COUNT(recId) from rectification",
        table: "rectification").exec(
        onSuccess: (onSuccess)
        {

         var te = onSuccess.data[0];
         bof = te[0];

         print("WOKAY");

         print(te[0]);



        },
        onError: (onError)
    {
      print(onError);

    }
    );

    return bof;



  }

  Widget newDemand()
  {

    return Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        height: 100,
        width: 400,
        child: Card(
        child: Row(
        children: [
        SizedBox(width: 5),
        Icon(Icons.pending_actions, size: 50, ),
        SizedBox(width: 5),
        centerizedText(text: "Demande de rectification en attente pour"),
        SizedBox(width: 5),
        Icon(Icons.access_time_sharp),
    ],
    ),
    ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:  ListView.builder(
              itemCount: ok(),
              itemBuilder: (BuildContext context, int index) {
                return newDemand();
              }),
      )
    );
  }
}