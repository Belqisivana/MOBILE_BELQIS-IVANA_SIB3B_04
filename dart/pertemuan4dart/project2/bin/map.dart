void main() {
  // Map dengan kode sebagai key, dan value berupa Map lagi
  Map<String, Map<String, dynamic>> barang = {
    "B001": {"nama": "Laptop", "harga": 7500000},
    "B002": {"nama": "Mouse", "harga": 150000},
    "B003": {"nama": "Keyboard", "harga": 300000},
  };

  print("Data Barang:");
  barang.forEach((kode, data) {
    print("Kode: $kode, Nama: ${data['nama']}, Harga: Rp${data['harga']}");
  });
}
