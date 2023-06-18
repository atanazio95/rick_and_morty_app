import 'package:http/http.dart' as http;

class HomeRepository {
  final String api = "https://rickandmortyapi.com/api";

  Future<http.Response> getCharacter() async {
    Uri uri = Uri.parse('$api/character');
    return await http.get(uri, headers: <String, String>{
      'Content-type': 'application/json; charset=UTF-8',
    });
  }
}
