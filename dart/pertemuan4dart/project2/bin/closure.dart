Function buatDiskonBertingkat() {
  double diskon = 0.0;

  return (double harga) {
    diskon += 0.05; // setiap kali dipanggil bertambah 5%
    if (diskon > 1) diskon = 1; // maksimal 100%

    double potongan = harga * diskon;
    double total = harga - potongan;

    print("Diskon: ${(diskon * 100.0).toStringAsFixed(0)}%");
    print("Harga Awal: Rp$harga");
    print("Harga Setelah Diskon: Rp$total\n");

    return total;
  };
}

void main() {
  var hitungDiskon = buatDiskonBertingkat();

  hitungDiskon(100000.0); // 5%
  hitungDiskon(100000.0); // 10%
  hitungDiskon(100000.0); // 15%
}
