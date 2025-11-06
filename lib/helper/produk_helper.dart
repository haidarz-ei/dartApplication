import 'package:http/http.dart' as http;
import 'dart:convert';

// function untuk mengambil data dari API
Future<void> ambilProduk() async{
// future memungkinkan kita bisa memproses hal lain selama masa tunggu proses melakukan request http

  // siapkan endpoint (url)
  var alamat = Uri.parse('https://fakestoreapi.com/products/4');

  print("Sedang mengambil data...");
  // bungkus dengan error handling
  try{
    // blok perintah yang dicoba jalankan 
    // jika error lempar ke catch
    var respon = await http.get(alamat);
    if(respon.statusCode == 200) {
      print("Ada respon dari server");
      // print(respon.body);
        // harus di convert ke dalam bentuk json/map (atau "map" kalau dalam dart)
        // jsondecode = string -> json/map
        // jsonencode = json/map -> string
      var hasil = jsonDecode(respon.body);
      print(hasil["price"]);
    } else {
      print("Tidak ada respon");
    }
  }catch(e){
    print("Gagal : $e");

  } 
}