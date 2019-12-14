import 'package:flutter/material.dart';
import '../pokehub.dart';

class PokeManDetails extends StatelessWidget {
  final Pokemon pokemon;

  PokeManDetails({this.pokemon});

  bodyWidget(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height / 1.4,
          width: MediaQuery.of(context).size.width - 20,
          left: 10.0,
          top: MediaQuery.of(context).size.height * 0.15,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            child: SizedBox(
              height: 20.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 70.0,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  Text(
                    'weight:${pokemon.weight}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    'height:${pokemon.height}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text('Types',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((t) => FilterChip(
                            backgroundColor: Colors.purpleAccent,
                            label: Text(t),
                            onSelected: (b) {}))
                        .toList(),
                  ),
                  Text('Weakness',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses
                        .map((t) => FilterChip(
                            backgroundColor: Colors.orange[700],
                            label: Text(t),
                            onSelected: (b) {}))
                        .toList(),
                  ),
                  Text('Next Evolution',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution
                        .map((n) => FilterChip(
                            backgroundColor: Colors.lightGreenAccent,
                            label: Text(n.name),
                            onSelected: (b) {}))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: pokemon.img,
            child: Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(pokemon.img))),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0.0,
        title: Center(child: Text(pokemon.name)),
        backgroundColor: Colors.cyan,
      ),
      body: bodyWidget(context),
    );
  }
}
