// membuat class manual

class Produk {
  // 1. definisikan variable yang dibutuhkan 
  // 2. set ke final supaya tidak dapat dirubah setelah dibuat
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;

  // buat Konstruktor = konstruktor adalah method khusus dalam sebuah class yang dijalankan otomatis saat objek dibuat.
  Produk({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image
  });

  // buat method untuk import dari json
  // buat method dengan keyword factory
  // keyword factory = keyword untuk membuat konstruktor khusus di dalam dart
  factory Produk.fromJson(Map<String,dynamic> json){
    return Produk(
      id          : json["id"], 
      title       : json["title"], 
      description : json["description"], 
      price       : json["price"], 
      category    : json["category"], 
      image       : json["image"]
    );
  }
}