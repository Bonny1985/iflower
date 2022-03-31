// ignore: file_names
enum FlowerColor { RED, YELLOW, GREEN, BLUE }

enum FlowerSize { SMALL, MEDIUM, LARGE }

class Flower {
  int? id;
  FlowerColor color;
  FlowerSize size;
  String name;
  String description;

  Flower(
      {required this.color,
      required this.name,
      required this.description,
      required this.size});

  @override
  String toString() {
    return "Flower{ id=$id, color=${color.name}, name=$name, size=${size.name} }";
  }

  factory Flower.fromRow(Map<String, dynamic> json) {
    Flower f = Flower(
      name: json["name"],
      description: json["description"],
      color: json["color"],
      size: json["size"],
    );
    f.id = json["id"];
    return f;
  }

}
