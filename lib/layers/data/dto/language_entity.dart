import 'package:pokedex/layers/domain/entities/language_entity.dart';

class LanguageDto extends LanguageEntity {
  String? name;
  String? url;

  LanguageDto({this.name, this.url})
      : super(
          name: name,
          url: url,
        );

  LanguageDto.fromJson(Map<String, dynamic> json) {
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
