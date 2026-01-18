import 'package:flutter/material.dart';

class ProfileSayaPage extends StatelessWidget {
  const ProfileSayaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            // Header User
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 35, 
                    backgroundImage: NetworkImage('https://api.dicebear.com/7.x/avataaars/png?seed=Felix'),
                  ),
                  const SizedBox(width: 15),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Pengunjung", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                      Text("ID 128351955 📋", style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent, 
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Masuk"),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Banner Promo Gold
            _buildGoldBanner(),
            const SizedBox(height: 20),
            // Section Akun Saya
            _buildAccountSection(),
            // List Menu
            _buildMenuItem(Icons.card_giftcard, "Dapatkan Hadiah", "Dapatkan Bonus Gratis"),
            _buildMenuItem(Icons.history, "Riwayat Tontonan", null),
            _buildMenuItem(Icons.download, "Unduhan Saya", null),
            _buildMenuItem(Icons.chat_bubble_outline, "Masukan", null),
            _buildMenuItem(Icons.settings_outlined, "Pengaturan", null),
          ],
        ),
      ),
    );
  }

  // --- FUNGSI HELPER (WAJIB ADA DI DALAM CLASS INI) ---

  Widget _buildGoldBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFFFDE9C9), Color(0xFFF6D29A)]),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("💎 Semua drama gratis", style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold)),
              Text("PERGI >", style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildGoldIcon(Icons.video_collection, "Drama Gratis"),
              _buildGoldIcon(Icons.download, "Unduh"),
              _buildGoldIcon(Icons.hd, "1080p"),
              _buildGoldIcon(Icons.wallet_giftcard, "Poin Harian"),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildGoldIcon(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: Colors.brown[700]),
        const SizedBox(height: 4),
        Text(text, style: const TextStyle(color: Colors.brown, fontSize: 10)),
      ],
    );
  }

  Widget _buildAccountSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF1C1C1C), borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Akun saya", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              Text("Detail >", style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Column(
                children: [
                  Text("Koin", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  Text("🪙 0", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
              const SizedBox(width: 30),
              const Column(
                children: [
                  Text("Bonus", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  Text("🟡 0", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, foregroundColor: Colors.white),
                child: const Text("ISI ULANG"),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String? trailing) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(title, style: const TextStyle(fontSize: 14, color: Colors.white)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailing != null) Text(trailing, style: const TextStyle(color: Colors.pink, fontSize: 12)),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}