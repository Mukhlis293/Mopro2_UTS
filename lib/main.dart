import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MovieService {
  
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);


  Future<void> refreshData() async {
    if (isLoading.value) return;

    isLoading.value = true;
    print("Memulai proses refresh data...");

    // Simulasi proses memuat data dari API
    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;
    print("Data berhasil di-refresh!");
  }
}


final MovieService movieService = MovieService();



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App UI Clone',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.red,
        useMaterial3: true,
      ),
      home: const MovieHomeShell(),
    );
  }
}

class MovieHomeShell extends StatefulWidget {
  const MovieHomeShell({super.key});

  @override
  State<MovieHomeShell> createState() => _MovieHomeShellState();
}

class _MovieHomeShellState extends State<MovieHomeShell> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MovieHomePage(),
    const Center(child: Text("Halaman Genre", style: TextStyle(fontSize: 24, color: Colors.grey))),
    const Center(child: Text("Halaman Favorit", style: TextStyle(fontSize: 24, color: Colors.grey))),
    const Center(child: Text("Halaman Profile", style: TextStyle(fontSize: 24, color: Colors.red))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color(0xFF1C1C1C),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Genre'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}



class MovieHomePage extends StatelessWidget {
  const MovieHomePage({super.key});

  final List<String> trendingImageUrls = const [
    'images/trending/galaksi.png',
    'https://image.tmdb.org/t/p/w185/pWQgb7Q0UeG4V4z8R7u4eJpP2hG.jpg',
    'https://image.tmdb.org/t/p/w185/b0Ej6fnXAP8fK75hlyi2jKqgCNd.jpg',
    'https://image.tmdb.org/t/p/w185/qloJ8Q2h3G4r7sO74WnIuN4L3tM.jpg',
    'https://image.tmdb.org/t/p/w185/kqjL17yufvn9AEZRDPzMG3ikQOp.jpg',
  ];

  final List<String> popularImageUrls = const [
    'images/popular/joker.jpeg',
    'https://image.tmdb.org/t/p/w185/xqw5z1mK7L5S8V8vLqD7W7rJ0bE.jpg',
    'https://image.tmdb.org/t/p/w185/A2E05dJ8HkX2j9zU2B9N8f1eN6h.jpg',
    'https://image.tmdb.org/t/p/w185/hu40Uxp9WtpL3NofOOdLgGVRs4.jpg',
    'https://image.tmdb.org/t/p/w185/f8y80w4JgKx3s15eR0O2Fw5vW2f.jpg',
  ];

  final List<String> topRatedImageUrls = const [
    'images/top rated/loerm.jpg',
    'https://image.tmdb.org/t/p/w185/aMsZtYf1u57qI0B0cDYm0Dk2f7m.jpg',
    'https://image.tmdb.org/t/p/w185/oo2mC3h4t0Wc3QWv5xQJv6gL6Q.jpg',
    'https://image.tmdb.org/t/p/w185/pHMufP01X0vE1bX5682jWJ9tF0M.jpg',
    'https://image.tmdb.org/t/p/w185/tN33yQn3e120P8vjR2Q82G59qR9.jpg',
  ];

  @override
  Widget build(BuildContext context) {
   
    return ValueListenableBuilder<bool>(
      valueListenable: movieService.isLoading,
      builder: (context, isLoading, child) {
        return RefreshIndicator(
          onRefresh: movieService.refreshData,
          color: Colors.red,
          backgroundColor: Colors.black,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              
                NowPlayingSection(
                  onRefreshPressed: movieService.refreshData,
                  isLoading: isLoading, 
                ),
                const SizedBox(height: 20),
                MovieSection(
                  title: 'Trending',
                  height: 180,
                  itemCount: trendingImageUrls.length,
                  itemBuilder: (context, index) => MoviePoster(
                    width: 120,
                    imageUrl: trendingImageUrls[index],
                  ),
                ),
                MovieSection(
                  title: 'Popular',
                  height: 180,
                  itemCount: popularImageUrls.length,
                  itemBuilder: (context, index) => MoviePoster(
                    width: 120,
                    imageUrl: popularImageUrls[index],
                  ),
                ),
                MovieSection(
                  title: 'Top Rated',
                  height: 180,
                  itemCount: topRatedImageUrls.length,
                  itemBuilder: (context, index) => MoviePoster(
                    width: 120,
                    imageUrl: topRatedImageUrls[index],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}


class NowPlayingSection extends StatelessWidget {
  final Future<void> Function() onRefreshPressed;
  final bool isLoading;

  const NowPlayingSection({
    super.key,
    required this.onRefreshPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Now Playing',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               
                GestureDetector(
                  onTap: isLoading ? null : onRefreshPressed, 
                  child: isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.red,
                            backgroundColor: Colors.transparent,
                          ),
                        )
                      : const Icon(
                          Icons.refresh,
                          color: Colors.red, 
                        ),
                ),
              ],
            ),
          ),
         
          Expanded(
            child: PageView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                   
                    image: const DecorationImage(
                      image: NetworkImage('https://www.xtrafondos.com/wallpapers/vertical/deadpool-y-wolverine-12232.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(10),
                            ),
                            gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deadpool & Wolverine',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '2024 | Action',
                              style: TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Yorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              style: TextStyle(color: Colors.white70, fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        right: 20,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.chevron_right, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final double width;
  final Color? color;
  final String? imageUrl;

  const MoviePoster({
    super.key,
    required this.width,
    this.color,
    this.imageUrl,
  }) : assert(color != null || imageUrl != null, 'Either color or imageUrl must be provided');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: imageUrl != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey,
                  child: const Center(
                    child: Icon(Icons.broken_image, color: Colors.white54),
                  ),
                ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey.shade800,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              ),
            )
          : Center(
              child: Text(
                'Poster',
                style: TextStyle(color: Colors.white.withOpacity(0.5)),
              ),
            ),
    );
  }
}

class MovieSection extends StatelessWidget {
  final String title;
  final double height;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  const MovieSection({
    super.key,
    required this.title,
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'More',
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 16 : 8,
                  right: index == itemCount - 1 ? 16 : 0,
                ),
                child: itemBuilder(context, index),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}