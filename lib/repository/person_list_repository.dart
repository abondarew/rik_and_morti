import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rik_and_morti/model/person_list_model.dart';

class PersonListRepository {
  final String urlApi = "https://rickandmortyapi.com/api/character";

  Future<List<PersonListItemModel>> getListPersons() async {
    List<PersonListItemModel> result = [];
    var response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<dynamic> jsonResult = jsonResponse['results'];
      jsonResult.forEach((element) {
        result.add(PersonListItemModel(
            id: element['id'], name: element['name'], status: element['status'], species: element['species']));
      });
    }
    return result;
  }
}
