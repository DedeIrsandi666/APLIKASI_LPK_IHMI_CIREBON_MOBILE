class Informasi {
    int id;
    String gambar;
    String postingan;
    DateTime createdAt;
    DateTime updatedAt;

    Informasi({
        required this.id,
        required this.gambar,
        required this.postingan,
        required this.createdAt,
        required this.updatedAt,
    });

  static fromJson(json) {}

    // factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    //     id: json["id"],
    //     gambar: json["gambar"],
    //     postingan: json["postingan"],
    //     createdAt: DateTime.parse(json["created_at"]),
    //     updatedAt: DateTime.parse(json["updated_at"]),
    // );

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "gambar": gambar,
    //     "postingan": postingan,
    //     "created_at": createdAt.toIso8601String(),
    //     "updated_at": updatedAt.toIso8601String(),
    // };
}
