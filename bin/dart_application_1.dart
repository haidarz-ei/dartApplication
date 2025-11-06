// import 'package:dart_application_1/dart_application_1.dart' as dart_application_1;

// void main(List<String> arguments) {
//   print('Hello world: ${dart_application_1.calculate()}!');
// }

// ________________________________________________________________________

// import 'package:http/http.dart' as http;
// import 'dart:convert';

// // function untuk mengambil data dari API
// Future<void> ambilProduk() async{
// // future memungkinkan kita bisa memproses hal lain selama masa tunggu proses melakukan request http

//   // siapkan endpoint (url)
//   var alamat = Uri.parse('https://fakestoreapi.com/products');

//   print("Sedang mengambil data...");
//   // bungkus dengan error handling
//   try{
//     // blok perintah yang dicoba jalankan 
//     // jika error lempar ke catch
//     var respon = await http.get(alamat);
//     if(respon.statusCode == 200) {
//       print("Ada respon dari server");
//       // print(respon.body);
//         // harus di convert ke dalam bentuk json/map (atau "map" kalau dalam dart)
//         // jsondecode = string -> json/map
//         // jsonencode = json/map -> string
//       var hasil = jsonDecode(respon.body);
//       print(hasil[0]['title']);
//     } else {
//       print("Tidak ada respon");
//     }
//   }catch(e){
//     print("Gagal : $e");

//   } 
// }

// ________________________________________________________________________

// import 'package:dart_application_1/helper/produk_helper.dart';

// void main(List<String> arguments) {
//   ambilProduk();
// }
// _________________________________________________________________________

import 'package:dart_application_1/helper/user_helper.dart' as users;
import 'package:dart_application_1/model/user.dart';

void main(List<String> args) async {
  // ambilProduk();
  print("Ambil data dari user....");
  User pengguna = await users.getUserById(5);
  print(pengguna.email);
}
