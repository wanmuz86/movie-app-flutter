// If you need more information. read the chapter 3 of the flutter book
// Class declaration
class Movie {

  // Property of a class
  final String title;
  final String year;
  final String poster;
  final String type;
  final String imdbId;

  // Create constructor of this class
  Movie({
    required this.title,
    required this.year,
    required this.poster,
    required this.type,
    required this.imdbId
});
// Transform from JSON to a Class
  factory Movie.fromJson(Map<String,dynamic> json){
    return Movie(
      title: json["Title"],
      imdbId: json["imdbID"],
      poster: json["Poster"],
      type: json["Type"],
      year: json["Year"]
    );
  }
// Transform an Array of JSON to a List of class (only if you retrieve an Array on JSON)
  static List<Movie> moviesFromJson(dynamic json ){
    var searchResult = json["Search"];
    List<Movie> results = new List.empty(growable: true);

    if (searchResult != null){

      searchResult.forEach((v)=>{
        results.add(Movie.fromJson(v))
      });
      return results;
    }
    return results;
  }



}