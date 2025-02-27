import 'dart:convert';
import 'dart:io';

/// Fungsi utama program
void main() async {
  while (true) {
    print('\nPilih kategori film:');
    print('1. Action');
    print('2. Animation');
    print('3. Sci-Fi');
    print('4. Keluar');
    stdout.write('Masukkan pilihan (1-4): ');
    String? choice = stdin.readLineSync();

    if (choice == '4') {
      print('Keluar dari program...');
      break;
    }

    String genreId;
    switch (choice) {
      case '1':
        genreId = '28'; // Action
        break;
      case '2':
        genreId = '16'; // Animation
        break;
      case '3':
        genreId = '878'; // Sci-Fi
        break;
      default:
        print('Pilihan tidak valid!');
        continue;
    }

    print('\nMengambil data film dari TMDB...');

    try {
      // Mengambil data film berdasarkan kategori dari API TMDB secara asinkron
      List<Movie> movies = await fetchMoviesByGenre(genreId);

      // Memproses data: mengurutkan berdasarkan judul
      movies.sort((a, b) => a.title.compareTo(b.title));

      // Menampilkan data ke CLI
      printMovies(movies);
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
  }
}

/// Mengambil daftar film dari API TMDB berdasarkan genre secara asinkron
Future<List<Movie>> fetchMoviesByGenre(String genreId) async {
  const apiKey = '80afc7a8b5fd40eebe52db53ca01cec7'; // API Key TMDB
  final url = 'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&language=en-US&with_genres=$genreId&page=3';
  final response = await HttpClient().getUrl(Uri.parse(url));
  final result = await response.close();

  if (result.statusCode == 200) {
    final jsonString = await result.transform(utf8.decoder).join();
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    final List<dynamic> moviesData = jsonData['results'];
    return moviesData.map((e) => Movie.fromJson(e)).toList();
  } else {
    throw Exception('Gagal mengambil data, status code: ${result.statusCode}');
  }
}

/// Menampilkan daftar film ke CLI dengan format yang rapi
void printMovies(List<Movie> movies) {
  print('\nDaftar Film:');
  print('-----------------------------------------------------');
  for (var movie in movies) {
    print('Judul   : ${movie.title}');
    print('Tahun   : ${movie.year}');
    print('Rating  : ${movie.rating}');
    print('-----------------------------------------------------');
  }
}

/// Model Movie untuk menyimpan data film
class Movie {
  final String title;
  final String year;
  final String rating;

  Movie({required this.title, required this.year, required this.rating});

  /// Konversi dari JSON ke objek Movie
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      year: json['release_date'].split('-')[0],
      rating: json['vote_average'].toString(),
    );
  }
}
