import 'package:pokedex/layers/domain/entities/damage_entity.dart';

class DamageDto extends DamageEntity {
  String? name;
  String? url;

  DamageDto({this.name, this.url})
      : super(
          name: name,
          url: url,
        );

  DamageDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
