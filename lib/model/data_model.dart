// // To parse this JSON data, do
// //
// //     final admin = adminFromJson(jsonString);

// import 'dart:convert';

// Admin adminFromJson(String str) => Admin.fromJson(json.decode(str));

// String adminToJson(Admin data) => json.encode(data.toJson());

// class Admin {
//   AdminClass? admin;

//   Admin({
//     this.admin,
//   });

//   factory Admin.fromJson(Map<String, dynamic> json) => Admin(
//         admin: AdminClass.fromJson(json["Admin"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "Admin": admin?.toJson(),
//       };
// }

// class AdminClass {
//   Nishant? nishant;
//   Nishant? nishantjvvivcuvic;

//   AdminClass({
//     this.nishant,
//     this.nishantjvvivcuvic,
//   });

//   factory AdminClass.fromJson(Map<String, dynamic> json) => AdminClass(
//         nishant: Nishant.fromJson(json["nishant"]),
//         nishantjvvivcuvic: Nishant.fromJson(json["nishantjvvivcuvic"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "nishant": nishant?.toJson(),
//         "nishantjvvivcuvic": nishantjvvivcuvic?.toJson(),
//       };
// }

// class Nishant {
//   String? dateOfBirth;
//   String? nishantClass;
//   String? email;
//   String? fathername;
//   String? firstname;
//   String? gender;
//   String? lastname;
//   String? mothername;
//   String? password;
//   String? phone;
//   String? post;
//   String? uid;

//   Nishant({
//     this.dateOfBirth,
//     this.nishantClass,
//     this.email,
//     this.fathername,
//     this.firstname,
//     this.gender,
//     this.lastname,
//     this.mothername,
//     this.password,
//     this.phone,
//     this.post,
//     this.uid,
//   });

//   factory Nishant.fromJson(Map<String, dynamic> json) => Nishant(
//         dateOfBirth: json["Date of birth"],
//         nishantClass: json["class"],
//         email: json["email"],
//         fathername: json["fathername"],
//         firstname: json["firstname"],
//         gender: json["gender"],
//         lastname: json["lastname"],
//         mothername: json["mothername"],
//         password: json["password"],
//         phone: json["phone"],
//         post: json["post"],
//         uid: json["uid"],
//       );

//   Map<String, dynamic> toJson() => {
//         "Date of birth": dateOfBirth,
//         "class": nishantClass,
//         "email": email,
//         "fathername": fathername,
//         "firstname": firstname,
//         "gender": gender,
//         "lastname": lastname,
//         "mothername": mothername,
//         "password": password,
//         "phone": phone,
//         "post": post,
//         "uid": uid,
//       };
// }
