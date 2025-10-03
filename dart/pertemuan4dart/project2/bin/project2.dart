import 'dart:io';

import 'package:project2/project2.dart' as project2;

void main(List<String> arguments) {
  //print('Hello world: ${project2.calculate()}!');

  // var fl = List<int>.filled(4, 0);
  // fl[0] = 1;
  // fl[1] = 2;
  // fl[2] = 3;
  // fl[3] = 4;
  // //cetak
  // var gl= [1,2,3];
  // gl.add(4);
  // gl.remove(2);
  
  var setNilai1 = <int>{1,2,3,4};
  var setNilai2 = {3,3,4,5};

  print(setNilai2);
  print(setNilai1.union(setNilai2));
  print(setNilai1.intersection(setNilai2));
  // stdout.writeln(gl);
  //List<int> angka = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
}