import 'package:pokedex/layers/domain/entities/ability_entity.dart';

class AbilityDto extends AbilityEntity {
  String? name;
  String? url;

  AbilityDto({this.name, this.url})
      : super(
          name: name,
          url: url,
        );

  AbilityDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
