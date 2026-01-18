import 'package:flutter/material.dart';

class MovieHomePage extends StatelessWidget {
  const MovieHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Agar konten ada di belakang AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparan ala Netflix
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network('https://upload.wikimedia.org/wikipedia/commons/0/08/Netflix_2015_logo.svg', 
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.movie, color: Colors.red, size: 30),
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search, size: 28), onPressed: () {}),
          IconButton(icon: const Icon(Icons.cast, size: 28), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroBanner(),
            const SizedBox(height: 20),
            _buildMovieSection("Populer di MovieApp", 200, true),
            _buildMovieSection("Lanjutkan Menonton", 160, false),
            _buildMovieSection("Drama Romantis", 160, false),
            _buildMovieSection("Trending Sekarang", 160, false),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Banner Utama Besar di Atas
  Widget _buildHeroBanner() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 500,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://image.tmdb.org/t/p/original/8GxvUfkYZ9jCws9Sgy5tQgFlsYm.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Efek Gradient Hitam di bawah banner
        Container(
          height: 500,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.transparent,
                Colors.black.withOpacity(0.9),
                Colors.black,
              ],
            ),
          ),
        ),
        // Tombol Play & Daftar Saya
        Positioned(
          bottom: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHeroButton(Icons.add, "Daftar Saya"),
              const SizedBox(width: 30),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow, color: Colors.black),
                label: const Text("Putar", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
              ),
              const SizedBox(width: 30),
              _buildHeroButton(Icons.info_outline, "Info"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeroButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  // Section Baris Film Horizontal
  Widget _buildMovieSection(String title, double height, bool isLarge) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 20, bottom: 8),
          child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: height,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (context, index) {
              return Container(
                width: isLarge ? 130 : 110,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage('https://picsum.photos/seed/${title.hashCode + index}/200/300'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}