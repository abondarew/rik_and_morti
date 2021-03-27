import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rik_and_morti/view/widget/person_list.dart';

class PersonListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty',
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rick and Morty', style: TextStyle(fontSize: 18),),
              Text('Person list', style: TextStyle(fontSize: 12),),
            ],
          ),
        ),
        body: Center(child: PersonListView()),
        /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),*/
        //), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
