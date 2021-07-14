class Post {
  final int ?number;
  final List<dynamic> ?people;

  Post({this.number,this.people});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      number: json['number'],
      people: json['people']
    );
  }
}