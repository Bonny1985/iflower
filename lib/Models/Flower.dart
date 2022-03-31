// ignore: file_names
enum FlowerColor { UNKNOWN, RED, YELLOW, GREEN, BLUE }

enum FlowerSize { UNKNOWN, SMALL, MEDIUM, LARGE }

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
      color: fromStringToColor(json["color"]),
      size: fromStringToSize(json["size"]),
    );
    f.id = json["id"];
    return f;
  }

  static FlowerColor fromStringToColor(String s) {
    FlowerColor fc = FlowerColor.UNKNOWN;
    int i = 0;
    bool found = false;
    while (i < FlowerColor.values.length && !found) {
      if (FlowerColor.values[i].name == s) {
        fc = FlowerColor.values[i];
        found = true;
      } else {
        i++;
      }
    }
    return fc;
  }

  static FlowerSize fromStringToSize(String s) {
    FlowerSize fs = FlowerSize.UNKNOWN;
    int i = 0;
    bool found = false;
    while (i < FlowerSize.values.length && !found) {
      if (FlowerSize.values[i].name == s) {
        fs = FlowerSize.values[i];
        found = true;
      } else {
        i++;
      }
    }
    return fs;
  }
}
