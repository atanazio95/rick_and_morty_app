import 'dart:convert';

import 'package:http/http.dart';
import 'package:rick_and_morty_app/home/models/character.dart';
import 'package:rick_and_morty_app/home/repositories/home_api_repository.dart';

class Homecontroller {
  final homeApiRepository = HomeRepository();

  Future<List<Character>> getcharacters() async {
    final Response response = await homeApiRepository.getCharacter();
    List<Character> characters = [];

    final bool validateStatusCode = response.statusCode == 200;
    if (validateStatusCode) {
      final Map dataFromApi = jsonDecode(response.body);
      final List<dynamic> charactersResults = dataFromApi['results'];

      characters = charactersResults
          .map((character) => Character.fromJson(character))
          .toList();
    }

    return characters;
  }
}

final homeController = Homecontroller();
