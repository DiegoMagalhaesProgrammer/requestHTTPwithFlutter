import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api_manipulation/model/model_api.dart';

class Connection {
  // classe futura (pois é chamada após o retorno da requisição) que retorna lista do tipo API
  static Future<List<User>> getUser() async {
    try {
      List<User> listReturn = List();
      final response = await http.get("http://jsonplaceholder.typicode.com/users");
      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);
        decodeJson.forEach((item) => listReturn.add(User.fromJson(item)));
        return listReturn;
      } else {
        print("Erro ao carregar lista");
        return null;
      }
    } catch (e) {
      print("Erro ao carregar lista");
      return null;
    }
  }
}
