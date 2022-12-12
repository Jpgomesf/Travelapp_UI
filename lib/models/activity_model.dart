class Activity {
  String imageUrl;
  String name;
  String? type;
  List<String> startTimes;
  int? rating;
  int? price;

  Activity({
    required this.imageUrl,
    required this.name,
    this.type,
    required this.startTimes,
    this.rating,
    this.price,
  });
}
