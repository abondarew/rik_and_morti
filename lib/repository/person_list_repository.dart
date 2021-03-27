import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rik_and_morti/model/person_list_model.dart';
import 'package:rik_and_morti/repository/error_response.dart';

class PersonListRepository {
  final String urlApi = "https://rickandmortyapi.com/api/character/?page=";
  static PersonListRepository _instance;
  int page = 1;

  PersonListRepository._();

  factory PersonListRepository(){
    if(_instance == null){
      _instance = PersonListRepository._();
    }
    return _instance;
  }

  Future<List<PersonListItemModel>> getListPersons() async {
    List<PersonListItemModel> result = [];
    var response = await http.get(Uri.parse(urlApi+page.toString()));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<dynamic> jsonResult = jsonResponse['results'];
      jsonResult.forEach((element) {
        result.add(PersonListItemModel(
            id: element['id'], name: element['name'], status: element['status'], species: element['species'], url: element['image']));
      });
    }else{
      throw ErrorResponseException(errorMessage: response.statusCode.toString());
    }
    return result;
  }
}
