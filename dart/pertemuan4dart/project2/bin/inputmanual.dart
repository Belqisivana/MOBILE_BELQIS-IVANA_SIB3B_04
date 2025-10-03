import 'dart:io';

void main() {
  // Input set pertama
  print("Masukkan elemen Set A: ");
  var inputA = stdin.readLineSync()!;
  Set<String> setA = inputA.split(",").map((e) => e.trim()).toSet();

  // Input set kedua
  print("Masukkan elemen Set B: ");
  var inputB = stdin.readLineSync()!;
  Set<String> setB = inputB.split(",").map((e) => e.trim()).toSet();

  // Union dan Intersection
  var union = setA.union(setB);
  var intersection = setA.intersection(setB);

  print("Set A: $setA");
  print("Set B: $setB");
  print("Union: $union");
  print("Intersection: $intersection");
}
