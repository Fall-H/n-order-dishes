class Dishes {
  int id;
  String title;
  String image;

  Dishes({required this.id, required this.title, required this.image});

  @override
  String toString() {
    return id.toString();
  }
}
