# afl-1-visualprogramming-ahmadrivaldhi

# 🎬 CLI Movie Fetcher (TMDB API)

## 📌 Deskripsi
Aplikasi CLI ini memungkinkan pengguna untuk mengambil daftar film berdasarkan kategori **Action, Animation, dan Sci-Fi** menggunakan **The Movie Database (TMDB) API**.

Program akan menampilkan daftar film secara rapi dengan informasi **judul, tahun rilis, dan rating**.

## 🚀 Fitur
- 🔹 **Mengambil data film dari TMDB API** secara asinkron.
- 🔹 **Menampilkan daftar film** dalam format CLI yang rapi.
- 🔹 **Memilih genre film** sebelum mengambil data.
- 🔹 **Menangani kesalahan** jika terjadi masalah saat mengambil data.

## 📦 Instalasi
Pastikan Anda telah menginstal **Dart** di sistem Anda.

1. **Clone repository ini** (jika menggunakan git):
   ```sh
   git clone https://github.com/sterbenmzrt/afl-1-visualprogramming.git
   cd repo
   ```
2. **Pastikan Dart telah terinstal**, jika belum:
   ```sh
   dart --version
   ```
   Jika belum ada Dart, instal dari [dart.dev](https://dart.dev/get-dart)
3. **Tambahkan API Key TMDB** di dalam file `afl1_ahmadrivaldhi_vispro.dart`:
   ```dart
   const apiKey = 'your_tmdb_api_key'; //get from after register on page TMDB
   ```

## 🔧 Cara Menjalankan Program
1. Buka terminal di folder proyek dan jalankan perintah berikut:
   ```sh
   dart run test/afl1_ahmadrivaldhi_vispro.dart
   ```
2. Pilih kategori film dari menu yang muncul:
   ```
   Pilih kategori film:
   1. Action
   2. Animation
   3. Sci-Fi
   4. Keluar
   ```
3. Program akan mengambil data dari API dan menampilkan daftar film berdasarkan kategori yang dipilih.

## 📜 Contoh Output
```
Pilih kategori film:
1. Action
2. Animation
3. Sci-Fi
4. Keluar
Masukkan pilihan (1-4): 1

Mengambil data film dari TMDB...

Daftar Film:
-----------------------------------------------------
Judul   : Inception
Tahun   : 2010
Rating  : 8.8
-----------------------------------------------------
Judul   : The Dark Knight
Tahun   : 2008
Rating  : 9.0
-----------------------------------------------------
```

## 🛠️ Teknologi yang Digunakan
- **Dart** - Bahasa pemrograman utama.
- **TMDB API** - Sumber data film.
- **CLI (Command Line Interface)** - Untuk tampilan sederhana.

## 📝 Lisensi
Proyek ini dibuat untuk keperluan pembelajaran dan bebas digunakan sesuai kebutuhan.

## 📌 Catatan
- **Pastikan API Key sudah benar** sebelum menjalankan program.
- Jika terjadi error saat mengambil data, periksa koneksi internet dan API Key Anda.
