// lib/screens/room_detail_screen.dart
import 'package:flutter/material.dart';
import '../models/room.dart';

class RoomDetailScreen extends StatelessWidget {
  final Room room;

  RoomDetailScreen({required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la Habitación'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(room.imagePath, fit: BoxFit.cover, width: double.infinity, height: 200),
            SizedBox(height: 16.0),
            Text(
              'Ubicación: ${room.location}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Precio: \$${room.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Tamaño: ${room.size}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Capacidad: ${room.capacity} personas',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Comodidades:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            ...room.amenities.map((amenity) => Text('• $amenity')).toList(),
          ],
        ),
      ),
    );
  }
}
