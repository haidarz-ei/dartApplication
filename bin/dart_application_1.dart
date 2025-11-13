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

// import 'package:dart_application_1/helper/user_helper.dart' as users;
// import 'package:dart_application_1/model/user.dart';

// void main(List<String> args) async {
//   // ambilProduk();
//   print("Ambil data dari user....");
//   User pengguna = await users.getUserById(5);
//   print(pengguna.email);
// }

// _________________________________________________________________________

import 'package:dart_application_1/helper/user_helper.dart';
import 'package:dart_application_1/model/user.dart';

void main(List<String> arguments) async {
  print("Sedang ambil data....");
  // membuat object dari class UserHelper, untuk menampung data user
  User pengguna = await UserHelper().getUserById(2);
  print(pengguna.username);
  print("email : ${pengguna.email}");

  // membuat user baru
  User baru = User(id: 10, username: "andi", email: "andi@example.com", password: "1234");
  // kirim data ke endpoint
  int idUserBaru = await UserHelper().createUser(baru);
  print("User baru berhasil dibuat dengan id : $idUserBaru");
  print("Username :${baru.username}");
  print("Email :${baru.email}");
  print(baru.password);

  // mengupdate user baru
  User uptd = User(
    id: 2,
    username: "mawardi",
    email: "mawardi_update@example.com",
    password: "4321"
  );
  // simpan hasil respon 
  User hasil = await UserHelper().updateUser(uptd);
  print("User berhasil diupdate:");
  print("Username :${hasil.username}");
  print("Email :${hasil.email}");
  print(hasil.password);
}