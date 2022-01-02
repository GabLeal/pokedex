import 'package:pokedex/layers/domain/entities/dream_wold_entity.dart';

class DreamWorldDto extends DreamWorldEntity {
  String? frontDefault;

  DreamWorldDto({this.frontDefault})
      : super(
          frontDefault: frontDefault,
        );

  DreamWorldDto.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front_default'] = this.frontDefault;
    return data;
  }
}
