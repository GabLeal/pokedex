class TypeDamage {
  DamageRelations? damageRelations;

  TypeDamage({this.damageRelations});

  TypeDamage.fromJson(Map<String, dynamic> json) {
    damageRelations = json['damage_relations'] != null
        ? new DamageRelations.fromJson(json['damage_relations'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.damageRelations != null) {
      data['damage_relations'] = this.damageRelations!.toJson();
    }
    return data;
  }
}

class DamageRelations {
  List<DoubleDamageFrom>? doubleDamageFrom;
  List<DoubleDamageTo>? doubleDamageTo;
  List<HalfDamageFrom>? halfDamageFrom;
  List<HalfDamageTo>? halfDamageTo;

  DamageRelations(
      {this.doubleDamageFrom,
      this.doubleDamageTo,
      this.halfDamageFrom,
      this.halfDamageTo});

  DamageRelations.fromJson(Map<String, dynamic> json) {
    if (json['double_damage_from'] != null) {
      doubleDamageFrom = [];
      json['double_damage_from'].forEach((v) {
        doubleDamageFrom!.add(new DoubleDamageFrom.fromJson(v));
      });
    }
    if (json['double_damage_to'] != null) {
      doubleDamageTo = [];
      json['double_damage_to'].forEach((v) {
        doubleDamageTo!.add(new DoubleDamageTo.fromJson(v));
      });
    }
    if (json['half_damage_from'] != null) {
      halfDamageFrom = [];
      json['half_damage_from'].forEach((v) {
        halfDamageFrom!.add(new HalfDamageFrom.fromJson(v));
      });
    }
    if (json['half_damage_to'] != null) {
      halfDamageTo = [];
      json['half_damage_to'].forEach((v) {
        halfDamageTo!.add(new HalfDamageTo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doubleDamageFrom != null) {
      data['double_damage_from'] =
          this.doubleDamageFrom!.map((v) => v.toJson()).toList();
    }
    if (this.doubleDamageTo != null) {
      data['double_damage_to'] =
          this.doubleDamageTo!.map((v) => v.toJson()).toList();
    }
    if (this.halfDamageFrom != null) {
      data['half_damage_from'] =
          this.halfDamageFrom!.map((v) => v.toJson()).toList();
    }
    if (this.halfDamageTo != null) {
      data['half_damage_to'] =
          this.halfDamageTo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Damage {
  String? name;
  String? url;

  Damage({this.name, this.url});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class DoubleDamageFrom extends Damage {
  DoubleDamageFrom.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}

class DoubleDamageTo extends Damage {
  DoubleDamageTo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}

class HalfDamageFrom extends Damage {
  HalfDamageFrom.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}

class HalfDamageTo extends Damage {
  HalfDamageTo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
