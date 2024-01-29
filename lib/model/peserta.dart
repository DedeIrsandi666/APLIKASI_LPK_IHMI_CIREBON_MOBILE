class Peserta {
    int idPeserta;
    String foto;
    String nama;
    String alamat;
    String email;
    String password;
    String angkatan;
    DateTime? createdAt;
    DateTime? updatedAt;

    Peserta({
        required this.idPeserta,
        required this.foto,
        required this.nama,
        required this.alamat,
        required this.email,
        required this.password,
        required this.angkatan,
        required this.createdAt,
        required this.updatedAt,
    });

  static fromJson(json) {}

    // factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    //     idPeserta: json["id_peserta"],
    //     foto: json["foto"],
    //     nama: json["nama"],
    //     alamat: json["alamat"],
    //     email: json["email"],
    //     password: json["password"],
    //     angkatan: json["angkatan"],
    //     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    //     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    // );

    // Map<String, dynamic> toJson() => {
    //     "id_peserta": idPeserta,
    //     "foto": foto,
    //     "nama": nama,
    //     "alamat": alamat,
    //     "email": email,
    //     "password": password,
    //     "angkatan": angkatan,
    //     "created_at": createdAt?.toIso8601String(),
    //     "updated_at": updatedAt?.toIso8601String(),
    // };
}
