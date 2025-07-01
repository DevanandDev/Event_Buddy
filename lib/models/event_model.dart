class EventModel {
  final String name;
  final String image;

  EventModel({required this.name, required this.image});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      name: json['name'] ?? '',
      image: json['images'] ?? '',
    );
  }
}