import 'dart:io';

void main() {
  Map<String, int> mahasiswa = {};

  // Input data 5 mahasiswa
  for (int i = 1; i <= 5; i++) {
    stdout.write("Masukkan nama mahasiswa ke-$i: ");
    String? nama = stdin.readLineSync();

    stdout.write("Masukkan nilai ujian $nama: ");
    int? nilai = int.tryParse(stdin.readLineSync() ?? "0");

    if (nama != null && nilai != null) {
      mahasiswa[nama] = nilai;
    }
  }

  print("\n=== Hasil Kelulusan Mahasiswa ===");
  mahasiswa.forEach((nama, nilai) {
    String kategori;

    if (nilai >= 80) {
      kategori = "A";
    } else if (nilai >= 60) {
      kategori = "B";
    } else {
      kategori = "C";
    }

    print("Nama: $nama | Nilai: $nilai | Kategori: $kategori");
  });
}