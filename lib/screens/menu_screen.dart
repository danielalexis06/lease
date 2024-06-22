// import 'package:flutter/material.dart';
// import '../models/room.dart';

// class MenuScreen extends StatefulWidget {
//   @override
//   _MenuScreenState createState() => _MenuScreenState();
// }

// class _MenuScreenState extends State<MenuScreen> {
//   final List<Room> rooms = [
//     Room(location: 'Centro', price: 250.0, size: '20m²', imagePath: 'assets/images/room1.jpg'),
//     Room(location: 'Norte', price: 300.0, size: '25m²', imagePath: 'assets/images/room2.jpg'),
//     Room(location: 'Sur', price: 200.0, size: '18m²', imagePath: 'assets/images/room3.jpg'),
//     Room(location: 'Este', price: 275.0, size: '22m²', imagePath: 'assets/images/room4.jpg'),
//     Room(location: 'Oeste', price: 225.0, size: '19m²', imagePath: 'assets/images/room5.jpg'),
//   ];

//   List<Room> filteredRooms = [];
//   String searchQuery = '';
//   String sortOption = 'Ascendente';

//   @override
//   void initState() {
//     super.initState();
//     filteredRooms = rooms;
//   }

//   void _filterRooms(String query) {
//     final filtered = rooms.where((room) {
//       final locationLower = room.location.toLowerCase();
//       final searchLower = query.toLowerCase();

//       return locationLower.contains(searchLower);
//     }).toList();

//     setState(() {
//       searchQuery = query;
//       filteredRooms = _sortRooms(filtered, sortOption);
//     });
//   }

//   List<Room> _sortRooms(List<Room> rooms, String option) {
//     rooms.sort((a, b) {
//       if (option == 'Ascendente') {
//         return a.price.compareTo(b.price);
//       } else {
//         return b.price.compareTo(a.price);
//       }
//     });
//     return rooms;
//   }

//   void _onSortOptionChanged(String? newOption) {
//     if (newOption != null) {
//       setState(() {
//         sortOption = newOption;
//         filteredRooms = _sortRooms(filteredRooms, newOption);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Menú Principal'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(10.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 labelText: 'Buscar por ubicación',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.search),
//               ),
//               onChanged: (query) => _filterRooms(query),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Text('Ordenar por precio: '),
//                 DropdownButton<String>(
//                   value: sortOption,
//                   onChanged: _onSortOptionChanged,
//                   items: <String>['Ascendente', 'Descendente'].map((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredRooms.length,
//               itemBuilder: (context, index) {
//                 final room = filteredRooms[index];
//                 return Card(
//                   color: Colors.lightGreenAccent.shade100,
//                   margin: EdgeInsets.all(10.0),
//                   child: Padding(
//                     padding: EdgeInsets.all(10.0),
//                     child: Row(
//                       children: [
//                         Image.asset(
//                           room.imagePath,
//                           width: 150,
//                           height: 150,
//                           fit: BoxFit.cover,
//                         ),
//                         SizedBox(width: 10.0),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Text(
//                                 'Ubicación: ${room.location}',
//                                 style: TextStyle(
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 'Precio: \$${room.price.toStringAsFixed(2)}',
//                                 style: TextStyle(
//                                   fontSize: 16.0,
//                                 ),
//                               ),
//                               Text(
//                                 'Tamaño: ${room.size}',
//                                 style: TextStyle(
//                                   fontSize: 16.0,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
