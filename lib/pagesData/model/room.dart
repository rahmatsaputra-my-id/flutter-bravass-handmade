class Room {
  final int id;
  final String title;
  final String description;
  final bool vegetarian;
  final bool vegan;
  final bool glutenFree;
  final bool dairyFree;
  final int servings;
  final String sourceUrl;
  final int likes;
  final int readyInMinutes;
  final String image;
  final List<String> ingredients;
  final List<String> instructions;


    Room({this.id, this.title, this.description, this.vegetarian, this.vegan,
    this.glutenFree, this.dairyFree, this.servings, this.sourceUrl,
    this.likes, this.readyInMinutes, this.image, this.ingredients,
    this.instructions});

    factory Room.fromJson(Map<String, dynamic> json){
      var ingredientsJson = json['ingridients'];
      var instructionsJson = json['instructions'];

      return Room(
          id: json['id'],
          title: json['title'],
          description: json['description'],
          vegetarian: json['vegetarian'],
          vegan: json['vegan'],
          glutenFree: json['glutenFree'],
          dairyFree: json['dairyFree'],
          servings: json['servings'],
          sourceUrl: json['sourceUrl'],
          likes: json['likes'],
          readyInMinutes: json['readyInMinutes'],
          image: json['image'],
          ingredients: ingredientsJson.cast<String>(),
          instructions: instructionsJson.cast<String>()
      );
    }
}



//class Room {
//  int id;
//  String title;
//  String description;
//  bool vegetarian;
//  bool vegan;
//  bool glutenFree;
//  bool dairyFree;
//  int servings;
//  String sourceUrl;
//  int likes;
//  int readyInMinutes;
//  String image;
//  List<String> ingredients;
//  List<String> instructions;
//
//  Room(
//      {this.id,
//        this.title,
//        this.description,
//        this.vegetarian,
//        this.vegan,
//        this.glutenFree,
//        this.dairyFree,
//        this.servings,
//        this.sourceUrl,
//        this.likes,
//        this.readyInMinutes,
//        this.image,
//        this.ingredients,
//        this.instructions});
//
//  Room.fromJson(Map<String, dynamic> json) {
//    id = json['id'];
//    title = json['title'];
//    description = json['description'];
//    vegetarian = json['vegetarian'];
//    vegan = json['vegan'];
//    glutenFree = json['glutenFree'];
//    dairyFree = json['dairyFree'];
//    servings = json['servings'];
//    sourceUrl = json['sourceUrl'];
//    likes = json['likes'];
//    readyInMinutes = json['readyInMinutes'];
//    image = json['image'];
//    ingredients = json['ingredients'].cast<String>();
//    instructions = json['instructions'].cast<String>();
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['id'] = this.id;
//    data['title'] = this.title;
//    data['description'] = this.description;
//    data['vegetarian'] = this.vegetarian;
//    data['vegan'] = this.vegan;
//    data['glutenFree'] = this.glutenFree;
//    data['dairyFree'] = this.dairyFree;
//    data['servings'] = this.servings;
//    data['sourceUrl'] = this.sourceUrl;
//    data['likes'] = this.likes;
//    data['readyInMinutes'] = this.readyInMinutes;
//    data['image'] = this.image;
//    data['ingredients'] = this.ingredients;
//    data['instructions'] = this.instructions;
//    return data;
//  }
//}