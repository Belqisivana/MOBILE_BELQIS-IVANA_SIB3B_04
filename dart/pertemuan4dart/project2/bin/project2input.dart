import 'dart:io';

// void main() {
//   var setNilai1 = <int>[];
//   var setNilai2 = <int>[1, 2, 3];

//   stdout.writeln('Jumlah data setNilai1: ');
//   String? input1 = stdin.readLineSync();
//   int jumlah1 = int.tryParse(input1 ?? "") ?? 0;

//   for (var i = 0; i < jumlah1; i++) {
//     stdout.writeln('Masukkan nilai ke ${i + 1} = ');
//     String? inputNilai = stdin.readLineSync();
//     int nilai = int.tryParse(inputNilai ?? "") ?? 0;
//     setNilai1.add(nilai);
//   }

//   print(setNilai1);
// }


// void main() {
//   var setNilai1 = <String>{};
//   stdout.writeln('Jumlah data setNilai1: ');
//   String? input1 = stdin.readLineSync();
//   int jumlah1 = int.tryParse(input1 ?? "") ?? 0;

//   for (var i = 0; i < jumlah1; i++) {
//     stdout.writeln('Masukkan nilai ke ${i + 1} = ');
//     String? inputNilai = stdin.readLineSync();
//     String nilai = inputNilai ?? "";
//     setNilai1.add(nilai);
//   }
//   var NilaiList = setNilai1.toList();
//   print(NilaiList);
  
// }

void main() {
  // var sudah = {'nim': "101", 'nama': "andi", 'umur': 20};
  // print(sudah);
  // print(sudah['nama']);

  var opo ={
  'nim': ["101", "404"], 
  'nama': ["andi", "budi"], 
  'umur': [20, 17]};
  print(opo);
  print(opo['nama']![1]);
}