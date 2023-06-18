import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty_app/home/controllers/home_controller.dart';
import 'package:rick_and_morty_app/home/models/character.dart';
import 'package:rick_and_morty_app/home/screens/widgets/character_card.dart';
import 'package:rick_and_morty_app/utils/widgets/my_draweer.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rick & Morty App"),
      ),
      drawer: Drawer(child: MyDrawer()),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [getCharacters()],
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<Character>> getCharacters() =>
      FutureBuilder<List<Character>>(
        future: homeController.getcharacters(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox(
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(),
                ));
          }

          final List<Character> characters = snapshot.data ?? [];
          final bool characterCounter = characters.isNotEmpty;
          if (characterCounter) {
            return _buildMyCharacters(characters);
          } else {
            return Container();
          }
        },
      );

  Widget _buildMyCharacters(List<Character> characters) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return CharacterCard(character: characters[index]);
        });
  }
}
