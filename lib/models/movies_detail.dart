class MovieDetail {

  final String imdbId;
  final String title;
  final String year;
  final String genre;
  final String director;
  final String writer;
  final String poster;
  final String plot;
  final String actors;

   MovieDetail({
  required this.imdbId,
  required this.title,
  required this.year,
  required this.genre,
  required this.director,
  required this.writer,
  required this.poster,
  required this.plot,
  required this.actors});


   factory MovieDetail.fromJson(Map<String, dynamic> json){
     return MovieDetail(
         imdbId: json["imdbID"],
         title: json["Title"],
         year: json["Year"],
         genre: json["Genre"],
         director: json["Director"],
         writer: json["Writer"],
         poster: json["Poster"],
         plot: json["Plot"],
         actors: json["Actors"]);
   }

}