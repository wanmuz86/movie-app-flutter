import 'package:flutter/material.dart';
import 'package:weather_app/models/movies_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class DetailPage extends StatefulWidget {

  final String imdbId;

  DetailPage({required this.imdbId});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  MovieDetail? movie;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMovie().then((value) =>
        setState(() {
          movie = value;
        })
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Movie app")),
      body: Text(movie!.title),
    );
  }

  Future<MovieDetail> fetchMovie() async {
    final response = await http
        .get(Uri.parse('http://www.omdbapi.com/?i=tt1201607&apikey=87d10179'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return MovieDetail.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load movie');
    }
  }
}
