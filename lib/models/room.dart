// lib/models/room.dart
class Room {
  final String location;
  final double price;
  final String size;
  final String imagePath;
  final int capacity;
  final List<String> amenities;

  Room({
    required this.location,
    required this.price,
    required this.size,
    required this.imagePath,
    required this.capacity,
    required this.amenities,
  });
}
