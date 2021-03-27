import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rik_and_morti/model/person_detail_model.dart';
import 'package:rik_and_morti/viewmodel/person_detail_vm.dart';

class PersonaDetailPage extends StatefulWidget {
  final int id;

  PersonaDetailPage(this.id);

  @override
  State<StatefulWidget> createState() => _State(id);
}

class _State extends State<PersonaDetailPage> {
  final PersonDetailViewModel personDetailViewModel = PersonDetailViewModel();
  PersonDetailModel person;
  final int id;

  _State(this.id);

  @override
  void initState() {
    personDetailViewModel.event.listen((event) {
      dispatch(event);
    });
    this.personDetailViewModel.load(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (this.personDetailViewModel.isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(person.name),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Image.network(person.avatarUrl),
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Card(
                    color: Colors.orangeAccent,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name: ${person.name}',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Divider(
                              height: 4,
                              color: Colors.deepOrange,
                            ),
                          ),
                          Text(
                            'Species: ${person.species}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Gender: ${person.gender}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Status: ${person.status}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Type: ${person.type == '' ? 'unknow' : person.type}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(''),
                          Text('Location: ${person.locationName}'),
                          if (person.originName != null) Text('Origin name ${person.originName}'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('wait...'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text('Loading...'),
              ),
            ],
          ),
        ),
      );
    }
  }

  void dispatch(PersonaDetailNotification event) {
    if (event is ResultPersonaDetailNotification) {
      setState(() {
        person = event.person;
      });
    }
  }
}
