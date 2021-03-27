import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rik_and_morti/model/person_list_model.dart';
import 'package:rik_and_morti/view/widget/person_detail.dart';
import 'package:rik_and_morti/viewmodel/person_list_vm.dart';

class PersonListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PersonListView> {
  final List<PersonListItemModel> persons = [];
  final PersonListViewModel viewModel = PersonListViewModel();

  @override
  void initState() {
    this.viewModel.event.listen((event) {
      dispatch(event);
    });
    this.viewModel.load();
    super.initState();
  }

  void dispatch(PersonListNotification event) {
    if (event is ResultPersonListNotification) {
      return setState(() {
        this.persons.clear();
        this.persons.addAll(event.persons);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (persons.isEmpty) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text("Loading, pleace wait"),
          ),
        ],
      ));
    }

    return ListView.builder(
      itemCount: persons.length,
      itemBuilder: (context, index) {
        PersonListItemModel person = persons[index];
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
            child: Card(
                elevation: 3,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 8.0),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: Image.network(
                      person.url,
                    ),
                  ),
                  title: Text(
                    person.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('species: ${person.species} status: ${person.status}'),
                  onTap: () =>
                      {Navigator.push(context, MaterialPageRoute(builder: (index) => PersonaDetailPage(person.id)))},
                )));
      },
    );
  }
}
