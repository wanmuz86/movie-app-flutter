import 'package:flutter/material.dart';
import 'detail.dart';
import 'package:weather_app/models/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> movies = [

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Movie app")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: TextField(decoration: InputDecoration(
                      hintText: "Enter Movie"),)),
                  TextButton(onPressed: (){
                    fetchMovie().then((value) =>
                        setState(() {
                          movies = value;
                        })
                    );


                  }, child: Text("Search"))
                ],
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(movies[index].title),
                      subtitle: Text(movies[index].year),
                      trailing: Icon(Icons.chevron_right),
                      leading:Image.network(movies[index].poster),
                        onTap:(){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>DetailPage()));
                    }
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
  Future<List<Movie>> fetchMovie() async {
    final response = await http
        .get(Uri.parse('http://www.omdbapi.com/?s=Harry&apikey=87d10179'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Movie.moviesFromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
