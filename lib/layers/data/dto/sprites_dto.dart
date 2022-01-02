import 'package:pokedex/layers/domain/entities/sprites_entity.dart';

class SpritesDto extends SpritesEntity {
  String? backDefault;
  String? frontDefault;
  SpritesDto({this.backDefault, this.frontDefault})
      : super(
          backDefault: backDefault,
          frontDefault: frontDefault,
        );

  SpritesDto.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    backDefault = json['back_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['front_default'] = this.frontDefault;
    data['back_default'] = this.backDefault;

    return data;
  }
}
