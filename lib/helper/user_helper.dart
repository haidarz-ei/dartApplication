// import 'package:http/http.dart' as http;
// // import 'package:dart_application_1/model/user.dart' as user;

// import '../model/user.dart';

// // function ambil data user dari server
// Future<User> getUserById(int id)async{
//   var alamat = 
//   Uri.parse("https://fakestoreapi.com/users/$id");
//   print("Sedang mengambil data user......");

//   // error handler jika terjadi error
//   try {
//     // lakukan request http ke endpoint
//     var respon = await http.get(alamat);
//     // cek status code dari server
//     if(respon.statusCode == 200){
//       User pengguna = User.fromJson(respon.body);
//       return pengguna;
//      } else {
//       // jika gagal 
//       throw Exception("Gagal mengambil data....");
//     }
//   } catch (e) {
//     throw Exception("Terjadi kesalah : $e");
//   }
// }

import 'dart:convert';

import 'package:dart_application_1/model/user.dart';
import 'package:http/http.dart' as http;

class UserHelper {
  final Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  // method mendapatkan semua user
  Future<List<User>> getAllUsers() async {
    var url = Uri.parse("https://fakestoreapi.com/users");
    try {
      var respon = await http.get(url);
      if (respon.statusCode == 200) {
        // konfersi respon body menjadi dynamic/list
        var json = jsonDecode(respon.body) as List<dynamic>;
        List<User> daftarUser = json.map((e) => User.fromMap(e)).toList();
        return json.map((item) => User.fromMap(item)).toList();
      } else {
        // int kode = respon.statusCode;
        throw Exception("Error koneksi status code :${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }

  // method update user
  Future<User> updateUser(User p) async {
    var url = Uri.parse("https://fakestoreapi.com/users/${p.id}");
    try {
      var respon = await http.put(url, headers: headers, body: jsonEncode(p.toMap()));
      if (respon.statusCode == 200) {
        var json = jsonDecode(respon.body);
        return User.fromMap(json);
      } else {
        // int kode = respon.statusCode;
        throw Exception("Error koneksi status code :${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }

  // method untuk membuat user baru
  Future<int> createUser(User p) async{
    var url = Uri.parse("https://fakestoreapi.com/users");
    try {
      var respon = await http.post(url, headers: headers, body: jsonEncode(p.toMap()));
      if (respon.statusCode == 200 || respon.statusCode == 201) {
        var json = jsonDecode(respon.body);
        return json['id'];
      } else {
        // int kode = respon.statusCode;
        throw Exception("Error koneksi status code :${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }

  // method ambil data user berdasarkan id
  Future<User> getUserById(int id) async {
    var url = Uri.parse("https://fakestoreapi.com/users/$id");
    print("Sedang mengambil data user......");

    try {
      var respon = await http.get(url);
      if (respon.statusCode == 200) {
        // konfersi respon ke format map/json
        var json = jsonDecode(respon.body);
        // konfersi menjadi object User
        return User.fromMap(json);
      } else {
        int kode = respon.statusCode;
        throw Exception("Error koneksi status :$kode");
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }
} 


