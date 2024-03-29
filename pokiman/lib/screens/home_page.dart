import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokiman/pokehub.dart';
import 'dart:convert';
import 'package:pokiman/screens/pokeman_details.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  PokeHub pokeHub;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var res = await http.get(url);
    var jsonDecoder = jsonDecode(res.body);
    pokeHub = PokeHub.fromJson(jsonDecoder);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Poki Man App'),
        backgroundColor: Colors.cyan,
      ),
      body: pokeHub == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: 2,
              children: pokeHub.pokemon.map((poke) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                     return PokeManDetails(pokemon:poke);
                    }));
                  },
                  child: Hero(
                    tag: poke.img,
                    child: Card(
                      elevation: 6.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 100.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(poke.img)),
                            ),
                          ),
                          Text(poke.name,style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),
              )).toList(),
            ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
        tooltip: 'Refresh',
        onPressed: () {
          fetchData();
        },
      ),
    );
  }
}
