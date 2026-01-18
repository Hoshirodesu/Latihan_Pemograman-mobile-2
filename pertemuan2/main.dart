// import 'dart:math';

// void main() {
//   print("Hello world");
//   print(tambah(2, 3));

//   var randomnilai = (Random().nextInt(100));
//   print(randomnilai);

//   var datetime = DateTime.now();
//   print(datetime);
// }

// int tambah(int a, int b) {
//   int c = a + b;
//   return c;
// }

class mobil {
  String merk;
  int tahun;

  //construktor
  mobil(this.merk, this.tahun);

  void info() {
    print("mobil $merk, tahun $tahun");
  }
}

// void main() {
//   List<mobil> daftarMobil = [
//     mobil("Honda", 2024),
//     mobil("Toyota", 2020),
//     mobil("Suzuki", 2018),
//   ];

//   print("daftar mobil awal");
//   for(var m in daftarMobil) {

//     daftarMobil.add(mobil("mitsubishi", 2008));

//     m.info();
//   }
// }

// Future<void> fetchData() async {
//   print("Mengambil data...");
//   await Future.delayed(Duration(seconds: 2));
//   print("Data berhasil diambil");
// }

// void main() {
//   fetchData();
//   print("program tetap berjalan...");
// }

void main() {
  try {
    int hasil = 10 ~/ 0;
    print(hasil);
  } catch (e) {
      print("terjadi kesalahan: $e");
  } finally {
    print("selesai mencoba operasi");
  }
}