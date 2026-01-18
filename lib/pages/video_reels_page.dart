import 'package:flutter/material.dart';

class VideoReelsPage extends StatelessWidget {
  const VideoReelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[900],
            child: Image.network('https://picsum.photos/seed/movie/400/800', fit: BoxFit.cover),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black.withOpacity(0.3), Colors.transparent, Colors.black.withOpacity(0.7)],
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 100,
            child: Column(
              children: [
                _buildReelAction(Icons.favorite, "4.4K"),
                _buildReelAction(Icons.workspace_premium, "VIP"),
                _buildReelAction(Icons.star, "40.8K"),
                _buildReelAction(Icons.layers, "Daftar"),
              ],
            ),
          ),
          Positioned(
            left: 16,
            bottom: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Antara Cinta dan Benci", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: const Text(
                    "Suvi Gamila adalah putri asli yang ditemukan keluarga Gamila 12 tahun lalu...",
                    maxLines: 2, overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(4)),
                  child: const Text("EP.1 / EP.61 >", style: TextStyle(fontSize: 11)),
                )
              ],
            ),
          ),
          Positioned(top: 40, right: 16, child: IconButton(icon: const Icon(Icons.search), onPressed: () {}))
        ],
      ),
    );
  }

  Widget _buildReelAction(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Icon(icon, size: 30, color: Colors.white),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}