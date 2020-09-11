import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
Color primaryColor = Color(0xff362c20);

//===================================================================== API ===================================================

class MovieRepository {
  Future<Playing> getNowPlaying(int currentPage) async {
    var url =
        'https://api.themoviedb.org/3/movie/now_playing?api_key=b64508afff2418ed0dcf89b770586d77&language=en-EN&page=' +
            currentPage.toString();

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print('Get Data');
      return Playing.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load');
    }

  }
}

//===================================================================== Model =================================================

class Playing {
  List<Result> results;

  int page;
  int totalResults;

  Dates dates;
  int totalPages;

  Playing(
      {this.results,
      this.totalResults,
      this.dates,
      this.totalPages,
      this.page});

  factory Playing.fromRawJson(String str) =>
      Playing.fromRawJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Playing.fromJson(Map<String, dynamic> json) => new Playing(
        results: new List<Result>.from(
            json['results'].map((x) => Result.fromJson(x))),
        page: json["page"],
        totalPages: json["total_pages"],
        dates: Dates.fromJson(json["dates"]),
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "results": new List<dynamic>.from(results.map((x) => x.toJson())),
        "page": page,
        "total_results": totalResults,
        "dates": dates.toJson(),
        "total_pages": totalPages,
      };
}

class Dates {
  DateTime maximum;
  DateTime minimum;

  Dates({this.maximum, this.minimum});

  factory Dates.fromRawJson(String str) => Dates.fromRawJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Dates.fromJson(Map<String, dynamic> json) => new Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );

  Map<String, dynamic> toJson() => {
        "maximum":
            "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum":
            "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
      };
}

class Result {
  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  OriginalLanguage originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  DateTime releaseDate;

  Result({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => new Result(
        voteCount: json["vote_count"],
        id: json["id"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        title: json["title"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        originalLanguage: originalLanguageValue.map[json["original_language"]],
        originalTitle: json["original_title"],
        genreIds: new List<int>.from(json["genre_ids"].map((x) => x)),
        backdropPath: json["backdrop_path"],
        adult: json["adult"],
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]),
      );

  Map<String, dynamic> toJson() => {
        "vote_count": voteCount,
        "id": id,
        "video": video,
        "vote_average": voteAverage,
        "title": title,
        "popularity": popularity,
        "poster_path": posterPath,
        "original_language": originalLanguageValue.reverse[originalLanguage],
        "original_title": originalTitle,
        "genre_ids": new List<dynamic>.from(genreIds.map((x) => x)),
        "backdrop_path": backdropPath,
        "adult": adult,
        "overview": overview,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
      };
}

enum OriginalLanguage { EN, ID }

final originalLanguageValue = new EnumValues({"en": OriginalLanguage.EN, "id": OriginalLanguage.ID});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

//========================================================================== Movie Data ========================================

class MovieData extends StatefulWidget {
  @override
  _MovieDataState createState() => _MovieDataState();
}

class _MovieDataState extends State<MovieData> {

  List<Result> _list= [];
  List<Result> _search=[];
  var loading =false;

  TextEditingController controller = new TextEditingController();

  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _list.forEach((f) {
      if (f.title.contains(text) || f.id.toString().contains(text))
        _search.add(f);
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title:
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 55,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    color: primaryColor,
                    child: Card(
                      child: ListTile(
                        dense: true,
                        leading: Icon(Icons.search),
                        title: TextField(
                          controller: controller,
                          onChanged: onSearch,
                          decoration: InputDecoration(
                            hintText: "Search", border: InputBorder.none
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: (){
                            controller.clear();
                            onSearch('');
                          },
                          icon: Icon(Icons.cancel),
                        ),
                      ),
                    ),
                  ),

                  loading
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : Expanded(
                          child: _search.length != 0 || controller.text.isNotEmpty
                              ? ListView.builder(
                                itemCount: _search.length,
                                itemBuilder: (context,j){
                                  final b = _search[j];
                                  return Container(
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          b.title,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18
                                          ),
                                        ),

                                        SizedBox(
                                          height: 2.0,
                                        ),
                                        Text(
                                          b.overview
                                        )
                                      ],
                                    ),
                                  );
                                },
                              )
                              : ListView.builder(
                                  itemCount: _list.length,
                                  itemBuilder: (context,j){
                                    final b = _list[j];
                                    return Container(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            b.title,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(b.overview)
                                        ],
                                      ),
                                    );
                                  },
                              )
                  )
                ],
              ),
            )
        ),
        body: FutureBuilder(
          future: MovieRepository().getNowPlaying(1),
          builder: (BuildContext c, AsyncSnapshot s) {
            if (s.data == null) {
              return Center(
                  child: Shimmer.fromColors(
                    baseColor: Colors.red,
                    highlightColor: Colors.yellowAccent,
                      child: Text(
                      'Rahmatteo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ));
            } else
              return new MovieList(
                playing: s.data,
              );
          },
        )
    );
  }
}

class MovieList extends StatefulWidget {
  final Playing playing;

  const MovieList({
    this.playing,
    Key key,
  }) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  ScrollController scrollController = new ScrollController();
  List<Result> movie;
  int currentPage = 1;

  bool onNotification(ScrollNotification notfication) {
    if (notfication is ScrollUpdateNotification) {
      if (scrollController.position.maxScrollExtent > scrollController.offset &&
          scrollController.position.maxScrollExtent - scrollController.offset <=
              50) {
        print('End Scroll');

        MovieRepository().getNowPlaying(currentPage + 1).then((val) {
          currentPage = val.page;
          setState(() {
            movie.addAll(val.results);
          });
        });
      }
    }
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    movie = widget.playing.results;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: onNotification,
      child: ListView.builder(
          itemCount: movie.length,
          controller: scrollController,
          itemBuilder: (BuildContext c, int i) {
            return Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//              height: 210.0,
              decoration: BoxDecoration(
                  color: Colors.white,
//                image: DecorationImage(
//                  image: NetworkImage('https://image.tmdb.org/t/p/w500'+ movie[i].posterPath),
//                  fit: BoxFit.cover,
//                  alignment: Alignment.topCenter),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 6, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
//                        padding: const EdgeInsets.all(8.0),
                          child: Text(
                            movie[i].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16.0),
                          ),
                        ),
                        Text(
                          movie[i].releaseDate.day.toString() +
                              ", " +
                              movie[i].releaseDate.month.toString() +
                              " " +
                              movie[i].releaseDate.year.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
//                  Expanded(
//                    child: Container(
//                      height: 20,
//                    ),
//                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      movie[i].overview,
                      textAlign: TextAlign.justify,
                      maxLines: 5,
                      style: TextStyle(color: Colors.black, fontSize: 11),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
//                        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 3.0),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                            "Rating: " + movie[i].voteAverage.toString(),
                            style: TextStyle(color: Colors.white)),
                      ),
                      RaisedButton.icon(
                        color: primaryColor,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0)),
                        icon: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        ),
                        label: Text('See Details',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(todo: movie[i]))),
                      )
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Result todo;

  const DetailScreen({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(todo.title + ' (' + todo.releaseDate.year.toString() + ')'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  onPressed: () {},
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(todo.voteAverage.toString() + "/10"),
                    Text(
                      todo.voteCount.toString(),
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              height: 330,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500' + todo.posterPath),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter),
                  borderRadius: BorderRadius.circular(15.0)),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        "Release : " +
                            todo.releaseDate.day.toString() +
                            ", " +
                            todo.releaseDate.month.toString() +
                            " " +
                            todo.releaseDate.year.toString() +
                            "\n"
                                "Path : " +
                            todo.posterPath +
                            "\n"
                                "Vote Count : " +
                            todo.voteCount.toString() +
                            "\n",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Text(
                      todo.overview,
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}


