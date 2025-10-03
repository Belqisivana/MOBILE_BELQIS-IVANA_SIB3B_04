
Function hitungDiskon() {
  double diskon = 0;

  return (num harga) {
    diskon += 5; 
    if (diskon > 100) diskon = 100;
    double potongan = harga * (diskon / 100);
    double hargaAkhir = harga - potongan;
    return "Diskon $diskon% --> Harga setelah diskon: Rp$hargaAkhir";
  };
}

void main() {
  var diskonBertingkat = hitungDiskon();
  
  print(diskonBertingkat(100000)); // Panggilan pertama (diskon 5%)
  print(diskonBertingkat(100000)); // Panggilan kedua (diskon 10%)
  print(diskonBertingkat(100000)); // Panggilan ketiga (diskon 15%)
}