import 'package:flutter/material.dart';
import '../models/room.dart';
import 'room_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Room> rooms = [
    Room(
      location: 'Costa Verde',
      price: 250.0,
      size: '20m²',
      imagePath: 'assets/images/room1.jpg',
      capacity: 2,
      amenities: ['WiFi', 'Aire acondicionado', 'Baño privado'],
    ),
    Room(
      location: 'PH Cocos del Mar',
      price: 300.0,
      size: '25m²',
      imagePath: 'assets/images/room2.jpg',
      capacity: 3,
      amenities: ['WiFi', 'Televisión', 'Baño privado'],
    ),
    Room(
      location: 'Torres de Toscana',
      price: 200.0,
      size: '18m²',
      imagePath: 'assets/images/room3.jpg',
      capacity: 1,
      amenities: ['WiFi', 'Ventilador', 'Baño compartido'],
    ),
    Room(
      location: 'Miramar',
      price: 275.0,
      size: '22m²',
      imagePath: 'assets/images/room4.jpg',
      capacity: 2,
      amenities: ['WiFi', 'Aire acondicionado', 'Baño privado'],
    ),
    Room(
      location: 'Dinasty',
      price: 225.0,
      size: '19m²',
      imagePath: 'assets/images/room5.jpg',
      capacity: 2,
      amenities: ['WiFi', 'Televisión', 'Baño privado'],
    ),
    Room(
      location: 'PH Aviñón',
      price: 300.0,
      size: '19m²',
      imagePath: 'assets/images/room6.jpg',
      capacity: 2,
      amenities: ['WiFi', 'Televisión', 'Baño privado'],
    ),
    Room(
      location: 'PH Alsacia',
      price: 300.0,
      size: '19m²',
      imagePath: 'assets/images/room7.jpg',
      capacity: 2,
      amenities: ['WiFi', 'Televisión', 'Baño privado'],
    ),
    Room(
      location: 'Trump Tower',
      price: 850.0,
      size: '40m²',
      imagePath: 'assets/images/room8.jpg',
      capacity: 2,
      amenities: ['WiFi', 'Televisión', 'Baño privado'],
    ),
    Room(
      location: 'Vista Alegre',
      price: 255.0,
      size: '17m²',
      imagePath: 'assets/images/room9.jpg',
      capacity: 2,
      amenities: ['WiFi', 'Televisión', 'Baño privado'],
    ),
    Room(
      location: 'Costa Pacífica',
      price: 290.0,
      size: '19m²',
      imagePath: 'assets/images/room10.jpg',
      capacity: 2,
      amenities: ['WiFi', 'Televisión', 'Baño privado'],
    ),
  ];

  List<Room> filteredRooms = [];
  String searchQuery = '';
  String sortOption = 'Ascendente';

  @override
  void initState() {
    super.initState();
    filteredRooms = rooms;
  }

  void _filterRooms(String query) {
    final filtered = rooms.where((room) {
      final locationLower = room.location.toLowerCase();
      final searchLower = query.toLowerCase();

      return locationLower.contains(searchLower);
    }).toList();

    setState(() {
      searchQuery = query;
      filteredRooms = _sortRooms(filtered, sortOption);
    });
  }

  List<Room> _sortRooms(List<Room> rooms, String option) {
    rooms.sort((a, b) {
      if (option == 'Ascendente') {
        return a.price.compareTo(b.price);
      } else {
        return b.price.compareTo(a.price);
      }
    });
    return rooms;
  }

  void _onSortOptionChanged(String? newOption) {
    if (newOption != null) {
      setState(() {
        sortOption = newOption;
        filteredRooms = _sortRooms(filteredRooms, newOption);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'), // Imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50.0),
                Text(
                  'Encuentra tu habitación ideal',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.white.withOpacity(0.9),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Buscar por ubicación',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (query) => _filterRooms(query),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Ordenar por precio: '),
                              DropdownButton<String>(
                                value: sortOption,
                                onChanged: _onSortOptionChanged,
                                items: <String>['Ascendente', 'Descendente'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Habitaciones disponibles',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Column(
                        children: filteredRooms.map((room) => RoomCard(
                          location: room.location,
                          price: room.price,
                          size: room.size,
                          imagePath: room.imagePath,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RoomDetailScreen(room: room),
                              ),
                            );
                          },
                        )).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  final String location;
  final double price;
  final String size;
  final String imagePath;
  final VoidCallback onTap;

  RoomCard({
    required this.location,
    required this.price,
    required this.size,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white.withOpacity(0.9),
        margin: EdgeInsets.symmetric(vertical: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ubicación: $location',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Precio: \$${price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      'Tamaño: $size',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
