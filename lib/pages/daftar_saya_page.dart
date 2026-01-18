import 'package:flutter/material.dart';

class DaftarSayaPage extends StatelessWidget {
  const DaftarSayaPage({super.key});

  final List<Map<String, String>> movies = const [
    {'title': 'Antara Cinta dan B...', 'ep': 'EP.1/ EP.61', 'img': 'https://picsum.photos/seed/1/200/300'},
    {'title': 'The Alpha\'s Rejecte...', 'ep': 'EP.1/ EP.75', 'img': 'https://picsum.photos/seed/2/200/300'},
    {'title': '[ENG DUB] Please B...', 'ep': 'EP.1/ EP.100', 'img': 'https://picsum.photos/seed/3/200/300'},
    {'title': 'Billionaire CEO\'s Ob...', 'ep': 'EP.1/ EP.87', 'img': 'https://picsum.photos/seed/4/200/300'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Daftar Saya", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.tune), onPressed: () {}),
          IconButton(icon: const Icon(Icons.history), onPressed: () {}),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.6,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(movies[index]['img']!, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 5),
              Text(movies[index]['title']!, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold), maxLines: 1),
              Text(movies[index]['ep']!, style: const TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          );
        },
      ),
    );
  }
}