class Sprites {
  String? backDefault;
  String? frontDefault;
  Sprites({this.backDefault, this.frontDefault});

  Sprites.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    backDefault = json['back_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front_default'] = this.frontDefault;
    data['back_default'] = this.backDefault;

    return data;
  }
}
