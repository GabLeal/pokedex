import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/model/move_details.dart';
import 'package:pokedex/repository/move_repository.dart';
import 'package:pokedex/util/base_url.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();

  final repository = MoveDetailsRepository(dio: dio);

  test('Deve pega MoveDetails', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: BaseUrl.url),
        data: json,
        statusCode: 200));

    MoveDetails? moveDetails = await repository.getMoveDetails(url);

    expect(moveDetails, isNotNull);
  });
}

var url = 'https://pokeapi.co/api/v2/move/345/';
var json = jsonEncode('''
{accuracy: null, contest_combos: {normal: {use_after: null, use_before: [{name: cut, url: https://pokeapi.co/api/v2/move/15/}, {name: crabhammer, url: https://pokeapi.co/api/v2/move/152/}, {name: slash, url: https://pokeapi.co/api/v2/move/163/}, {name: false-swipe, url: https://pokeapi.co/api/v2/move/206/}, {name: fury-cutter, url: https://pokeapi.co/api/v2/move/210/}, {name: crush-claw, url: https://pokeapi.co/api/v2/move/306/}]}, super: {use_after: null, use_before: null}}, contest_effect: {url: https://pokeapi.co/api/v2/contest-effect/32/}, contest_type: {name: beauty, url: https://pokeapi.co/api/v2/contest-type/2/}, damage_class: {name: status, url: https://pokeapi.co/api/v2/move-damage-class/1/}, effect_chance: null, effect_changes: [], effect_entries: [{effect: Raises the user's Attack by two stages., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, short_effect: Raises the user's Attack by two stages.}], flavor_text_entries: [{flavor_text: 激烈地跳起战舞提高气势。
      大幅提高自己的攻击。, language: {name: zh-Hans, url: https://pokeapi.co/api/v2/language/12/}, version_group: {name: ultra-sun-ultra-moon, url: https://pokeapi.co/api/v2/version-group/18/}}, {flavor_text: A dance that in­
      creases ATTACK., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: gold-silver, url: https://pokeapi.co/api/v2/version-group/3/}}, {flavor_text: A dance that in­
      creases ATTACK., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: crystal, url: https://pokeapi.co/api/v2/version-group/4/}}, {flavor_text: A fighting dance that
      sharply raises ATTACK., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: ruby-sapphire, url: https://pokeapi.co/api/v2/version-group/5/}}, {flavor_text: A fighting dance that
      sharply raises ATTACK., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: emerald, url: https://pokeapi.co/api/v2/version-group/6/}}, {flavor_text: A frenetic dance of
      fighting. It sharply
      raises the ATTACK
      stat., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: firered-leafgreen, url: https://pokeapi.co/api/v2/version-group/7/}}, {flavor_text: A frenetic dance to
      uplift the fighting
      spirit. It sharply
      raises the user’s
      Attack stat., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: diamond-pearl, url: https://pokeapi.co/api/v2/version-group/8/}}, {flavor_text: A frenetic dance to
      uplift the fighting
      spirit. It sharply
      raises the user’s
      Attack stat., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: platinum, url: https://pokeapi.co/api/v2/version-group/9/}}, {flavor_text: A frenetic dance to
      uplift the fighting
      spirit. It sharply
      raises the user’s
      Attack stat., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: heartgold-soulsilver, url: https://pokeapi.co/api/v2/version-group/10/}}, {flavor_text: Danse frénétique qui exalte l’esprit
      combatif. Augmente beaucoup
      l’Attaque du lanceur., language: {name: fr, url: https://pokeapi.co/api/v2/language/5/}, version_group: {name: black-white, url: https://pokeapi.co/api/v2/version-group/11/}}, {flavor_text: A frenetic dance to uplift the fighting
      spirit. It sharply raises the user’s
      Attack stat., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: black-white, url: https://pokeapi.co/api/v2/version-group/11/}}, {flavor_text: A frenetic dance to uplift the fighting
      spirit. It sharply raises the user’s
      Attack stat., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: black-2-white-2, url: https://pokeapi.co/api/v2/version-group/14/}}, {flavor_text: たたかいのまいを　はげしく　おどって
      きあいを　たかめる。
      じぶんの　こうげきを　ぐーんと　あげる。, language: {name: ja-Hrkt, url: https://pokeapi.co/api/v2/language/1/}, version_group: {name: x-y, url: https://pokeapi.co/api/v2/version-group/15/}}, {flavor_text: 싸움의 춤을 격렬하게 추며
      기세를 높인다.
      자신의 공격을 크게 올린다., language: {name: ko, url: https://pokeapi.co/api/v2/language/3/}, version_group: {name: x-y, url: https://pokeapi.co/api/v2/version-group/15/}}, {flavor_text: Danse frénétique qui exalte l’esprit combatif.
      Augmente beaucoup l’Attaque du lanceur., language: {name: fr, url: https://pokeapi.co/api/v2/language/5/}, version_group: {name: x-y, url: https://pokeapi.co/api/v2/version-group/15/}}, {flavor_text: Ein wilder Kampftanz, der den eigenen
      Angriffs-Wert stark erhöht., language: {name: de, url: https://pokeapi.co/api/v2/language/6/}, version_group: {name: x-y, url: https://pokeapi.co/api/v2/version-group/15/}}, {flavor_text: Baile frenético que aumenta mucho el Ataque., language: {name: es, url: https://pokeapi.co/api/v2/language/7/}, version_group: {name: x-y, url: https://pokeapi.co/api/v2/version-group/15/}}, {flavor_text: Danza frenetica che incrementa lo spirito
      combattivo. Chi la usa aumenta di molto
      il suo Attacco., language: {name: it, url: https://pokeapi.co/api/v2/language/8/}, version_group: {name: x-y, url: https://pokeapi.co/api/v2/version-group/15/}}, {flavor_text: A frenetic dance to uplift the fighting
      spirit. This sharply raises the user’s
      Attack stat., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: x-y, url: https://pokeapi.co/api/v2/version-group/15/}}, {flavor_text: 戦いの舞を　激しく　おどって
      気合を　高める。
      自分の　攻撃を　ぐーんと　あげる。, language: {name: ja, url: https://pokeapi.co/api/v2/language/11/}, version_group: {name: x-y, url: https://pokeapi.co/api/v2/version-group/15/}}, {flavor_text: たたかいのまいを　はげしく　おどって
      きあいを　たかめる。
      じぶんの　こうげきを　ぐーんと　あげる。, language: {name: ja-Hrkt, url: https://pokeapi.co/api/v2/language/1/}, version_group: {name: omega-ruby-alpha-sapphire, url: https://pokeapi.co/api/v2/version-group/16/}}, {flavor_text: 싸움의 춤을 격렬하게 추며
      기세를 높인다.
      자신의 공격을 크게 올린다., language: {name: ko, url: https://pokeapi.co/api/v2/language/3/}, version_group: {name: omega-ruby-alpha-sapphire, url: https://pokeapi.co/api/v2/version-group/16/}}, {flavor_text: Danse frénétique qui exalte l’esprit combatif.
      Augmente beaucoup l’Attaque du lanceur., language: {name: fr, url: https://pokeapi.co/api/v2/language/5/}, version_group: {name: omega-ruby-alpha-sapphire, url: https://pokeapi.co/api/v2/version-group/16/}}, {flavor_text: Ein wilder Kampftanz, der den eigenen
      Angriffs-Wert stark erhöht., language: {name: de, url: https://pokeapi.co/api/v2/language/6/}, version_group: {name: omega-ruby-alpha-sapphire, url: https://pokeapi.co/api/v2/version-group/16/}}, {flavor_text: Baile frenético que aumenta mucho el Ataque., language: {name: es, url: https://pokeapi.co/api/v2/language/7/}, version_group: {name: omega-ruby-alpha-sapphire, url: https://pokeapi.co/api/v2/version-group/16/}}, {flavor_text: Danza frenetica che incrementa lo spirito
      combattivo. Chi la usa aumenta di molto
      il suo Attacco., language: {name: it, url: https://pokeapi.co/api/v2/language/8/}, version_group: {name: omega-ruby-alpha-sapphire, url: https://pokeapi.co/api/v2/version-group/16/}}, {flavor_text: A frenetic dance to uplift the fighting
      spirit. This sharply raises the user’s
      Attack stat., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: omega-ruby-alpha-sapphire, url: https://pokeapi.co/api/v2/version-group/16/}}, {flavor_text: 戦いの舞を　激しく　おどって
      気合を　高める。
      自分の　攻撃を　ぐーんと　あげる。, language: {name: ja, url: https://pokeapi.co/api/v2/language/11/}, version_group: {name: omega-ruby-alpha-sapphire, url: https://pokeapi.co/api/v2/version-group/16/}}, {flavor_text: たたかいのまいを　はげしく　おどって
      きあいを　たかめる。
      じぶんの　こうげきを　ぐーんと　あげる。, language: {name: ja-Hrkt, url: https://pokeapi.co/api/v2/language/1/}, version_group: {name: sun-moon, url: https://pokeapi.co/api/v2/version-group/17/}}, {flavor_text: 싸움의 춤을 격렬하게 춰서
      기세를 높인다.
      자신의 공격을 크게 올린다., language: {name: ko, url: https://pokeapi.co/api/v2/language/3/}, version_group: {name: sun-moon, url: https://pokeapi.co/api/v2/version-group/17/}}, {flavor_text: 激烈地跳起戰舞提升氣勢。
      大幅提高自己的攻擊。, language: {name: zh-Hant, url: https://pokeapi.co/api/v2/language/4/}, version_group: {name: sun-moon, url: https://pokeapi.co/api/v2/version-group/17/}}, {flavor_text: Danse frénétique qui exalte l’esprit combatif.
      Augmente beaucoup l’Attaque du lanceur., language: {name: fr, url: https://pokeapi.co/api/v2/language/5/}, version_group: {name: sun-moon, url: https://pokeapi.co/api/v2/version-group/17/}}, {flavor_text: Ein wilder Kampftanz, der den eigenen Angriffs-Wert
      stark erhöht., language: {name: de, url: https://pokeapi.co/api/v2/language/6/}, version_group: {name: sun-moon, url: https://pokeapi.co/api/v2/version-group/17/}}, {flavor_text: Baile frenético que aumenta mucho el Ataque., language: {name: es, url: https://pokeapi.co/api/v2/language/7/}, version_group: {name: sun-moon, url: https://pokeapi.co/api/v2/version-group/17/}}, {flavor_text: Danza frenetica che incrementa lo spirito
      combattivo. Chi la usa aumenta di molto
      il suo Attacco., language: {name: it, url: https://pokeapi.co/api/v2/language/8/}, version_group: {name: sun-moon, url: https://pokeapi.co/api/v2/version-group/17/}}, {flavor_text: A frenetic dance to uplift the fighting spirit.
      This sharply raises the user’s Attack stat., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: sun-moon, url: https://pokeapi.co/api/v2/version-group/17/}}, {flavor_text: 戦いの舞を　激しく　おどって
      気合を　高める。
      自分の　攻撃を　ぐーんと　あげる。, language: {name: ja, url: https://pokeapi.co/api/v2/language/11/}, version_group: {name: sun-moon, url: https://pokeapi.co/api/v2/version-group/17/}}, {flavor_text: 激烈地跳起战舞提高气势。
      大幅提高自己的攻击。, language: {name: zh-Hans, url: https://pokeapi.co/api/v2/language/12/}, version_group: {name: sun-moon, url: https://pokeapi.co/api/v2/version-group/17/}}, {flavor_text: たたかいのまいを　はげしく　おどって
      きあいを　たかめる。
      じぶんの　こうげきを　ぐーんと　あげる。, language: {name: ja-Hrkt, url: https://pokeapi.co/api/v2/language/1/}, version_group: {name: ultra-sun-ultra-moon, url: https://pokeapi.co/api/v2/version-group/18/}}, {flavor_text: 싸움의 춤을 격렬하게 춰서
      기세를 높인다.
      자신의 공격을 크게 올린다., language: {name: ko, url: https://pokeapi.co/api/v2/language/3/}, version_group: {name: ultra-sun-ultra-moon, url: https://pokeapi.co/api/v2/version-group/18/}}, {flavor_text: 激烈地跳起戰舞提升氣勢。
      大幅提高自己的攻擊。, language: {name: zh-Hant, url: https://pokeapi.co/api/v2/language/4/}, version_group: {name: ultra-sun-ultra-moon, url: https://pokeapi.co/api/v2/version-group/18/}}, {flavor_text: Danse frénétique qui exalte l’esprit combatif.
      Augmente beaucoup l’Attaque du lanceur., language: {name: fr, url: https://pokeapi.co/api/v2/language/5/}, version_group: {name: ultra-sun-ultra-moon, url: https://pokeapi.co/api/v2/version-group/18/}}, {flavor_text: Ein wilder Kampftanz, der den eigenen Angriffs-Wert
      stark erhöht., language: {name: de, url: https://pokeapi.co/api/v2/language/6/}, version_group: {name: ultra-sun-ultra-moon, url: https://pokeapi.co/api/v2/version-group/18/}}, {flavor_text: Baile frenético que aumenta mucho el Ataque., language: {name: es, url: https://pokeapi.co/api/v2/language/7/}, version_group: {name: ultra-sun-ultra-moon, url: https://pokeapi.co/api/v2/version-group/18/}}, {flavor_text: Danza frenetica che incrementa lo spirito
      combattivo. Chi la usa aumenta di molto
      il suo Attacco., language: {name: it, url: https://pokeapi.co/api/v2/language/8/}, version_group: {name: ultra-sun-ultra-moon, url: https://pokeapi.co/api/v2/version-group/18/}}, {flavor_text: A frenetic dance to uplift the fighting spirit.
      This sharply raises the user’s Attack stat., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: ultra-sun-ultra-moon, url: https://pokeapi.co/api/v2/version-group/18/}}, {flavor_text: 戦いの舞を　激しく　おどって
      気合を　高める。
      自分の　攻撃を　ぐーんと　あげる。, language: {name: ja, url: https://pokeapi.co/api/v2/language/11/}, version_group: {name: ultra-sun-ultra-moon, url: https://pokeapi.co/api/v2/version-group/18/}}], generation: {name: generation-i, url: https://pokeapi.co/api/v2/generation/1/}, id: 14, learned_by_pokemon: [{name: bulbasaur, url: https://pokeapi.co/api/v2/pokemon/1/}, {name: ivysaur, url: https://pokeapi.co/api/v2/pokemon/2/}, {name: venusaur, url: https://pokeapi.co/api/v2/pokemon/3/}, {name: charmander, url: https://pokeapi.co/api/v2/pokemon/4/}, {name: charmeleon, url: https://pokeapi.co/api/v2/pokemon/5/}, {name: charizard, url: https://pokeapi.co/api/v2/pokemon/6/}, {name: beedrill, url: https://pokeapi.co/api/v2/pokemon/15/}, {name: raticate, url: https://pokeapi.co/api/v2/pokemon/20/}, {name: sandshrew, url: https://pokeapi.co/api/v2/pokemon/27/}, {name: sandslash, url: https://pokeapi.co/api/v2/pokemon/28/}, {name: oddish, url: https://pokeapi.co/api/v2/pokemon/43/}, {name: gloom, url: https://pokeapi.co/api/v2/pokemon/44/}, {name: vileplume, url: https://pokeapi.co/api/v2/pokemon/45/}, {name: paras, url: https://pokeapi.co/api/v2/pokemon/46/}, {name: parasect, url: https://pokeapi.co/api/v2/pokemon/47/}, {name: bellsprout, url: https://pokeapi.co/api/v2/pokemon/69/}, {name: weepinbell, url: https://pokeapi.co/api/v2/pokemon/70/}, {name: victreebel, url: https://pokeapi.co/api/v2/pokemon/71/}, {name: tentacool, url: https://pokeapi.co/api/v2/pokemon/72/}, {name: tentacruel, url: https://pokeapi.co/api/v2/pokemon/73/}, {name: farfetchd, url: https://pokeapi.co/api/v2/pokemon/83/}, {name: doduo, url: https://pokeapi.co/api/v2/pokemon/84/}, {name: dodrio, url: https://pokeapi.co/api/v2/pokemon/85/}, {name: krabby, url: https://pokeapi.co/api/v2/pokemon/98/}, {name: kingler, url: https://pokeapi.co/api/v2/pokemon/99/}, {name: exeggcute, url: https://pokeapi.co/api/v2/pokemon/102/}, {name: exeggutor, url: https://pokeapi.co/api/v2/pokemon/103/}, {name: cubone, url: https://pokeapi.co/api/v2/pokemon/104/}, {name: marowak, url: https://pokeapi.co/api/v2/pokemon/105/}, {name: lickitung, url: https://pokeapi.co/api/v2/pokemon/108/}, {name: rhyhorn, url: https://pokeapi.co/api/v2/pokemon/111/}, {name: rhydon, url: https://pokeapi.co/api/v2/pokemon/112/}, {name: tangela, url: https://pokeapi.co/api/v2/pokemon/114/}, {name: scyther, url: https://pokeapi.co/api/v2/pokemon/123/}, {name: pinsir, url: https://pokeapi.co/api/v2/pokemon/127/}, {name: kabutops, url: https://pokeapi.co/api/v2/pokemon/141/}, {name: mew, url: https://pokeapi.co/api/v2/pokemon/151/}, {name: chikorita, url: https://pokeapi.co/api/v2/pokemon/152/}, {name: bayleef, url: https://pokeapi.co/api/v2/pokemon/153/}, {name: meganium, url: https://pokeapi.co/api/v2/pokemon/154/}, {name: totodile, url: https://pokeapi.co/api/v2/pokemon/158/}, {name: croconaw, url: https://pokeapi.co/api/v2/pokemon/159/}, {name: feraligatr, url: https://pokeapi.co/api/v2/pokemon/160/}, {name: ledyba, url: https://pokeapi.co/api/v2/pokemon/165/}, {name: ledian, url: https://pokeapi.co/api/v2/pokemon/166/}, {name: ariados, url: https://pokeapi.co/api/v2/pokemon/168/}, {name: bellossom, url: https://pokeapi.co/api/v2/pokemon/182/}, {name: hoppip, url: https://pokeapi.co/api/v2/pokemon/187/}, {name: skiploom, url: https://pokeapi.co/api/v2/pokemon/188/}, {name: jumpluff, url: https://pokeapi.co/api/v2/pokemon/189/}, {name: sunkern, url: https://pokeapi.co/api/v2/pokemon/191/}, {name: sunflora, url: https://pokeapi.co/api/v2/pokemon/192/}, {name: gligar, url: https://pokeapi.co/api/v2/pokemon/207/}, {name: qwilfish, url: https://pokeapi.co/api/v2/pokemon/211/}, {name: scizor, url: https://pokeapi.co/api/v2/pokemon/212/}, {name: heracross, url: https://pokeapi.co/api/v2/pokemon/214/}, {name: sneasel, url: https://pokeapi.co/api/v2/pokemon/215/}, {name: teddiursa, url: https://pokeapi.co/api/v2/pokemon/216/}, {name: ursaring, url: https://pokeapi.co/api/v2/pokemon/217/}, {name: skarmory, url: https://pokeapi.co/api/v2/pokemon/227/}, {name: celebi, url: https://pokeapi.co/api/v2/pokemon/251/}, {name: treecko, url: https://pokeapi.co/api/v2/pokemon/252/}, {name: grovyle, url: https://pokeapi.co/api/v2/pokemon/253/}, {name: sceptile, url: https://pokeapi.co/api/v2/pokemon/254/}, {name: torchic, url: https://pokeapi.co/api/v2/pokemon/255/}, {name: combusken, url: https://pokeapi.co/api/v2/pokemon/256/}, {name: blaziken, url: https://pokeapi.co/api/v2/pokemon/257/}, {name: lotad, url: https://pokeapi.co/api/v2/pokemon/270/}, {name: lombre, url: https://pokeapi.co/api/v2/pokemon/271/}, {name: ludicolo, url: https://pokeapi.co/api/v2/pokemon/272/}, {name: seedot, url: https://pokeapi.co/api/v2/pokemon/273/}, {name: nuzleaf, url: https://pokeapi.co/api/v2/pokemon/274/}, {name: shiftry, url: https://pokeapi.co/api/v2/pokemon/275/}, {name: shroomish, url: https://pokeapi.co/api/v2/pokemon/285/}, {name: breloom, url: https://pokeapi.co/api/v2/pokemon/286/}, {name: ninjask, url: https://pokeapi.co/api/v2/pokemon/291/}, {name: mawile, url: https://pokeapi.co/api/v2/pokemon/303/}, {name: roselia, url: https://pokeapi.co/api/v2/pokemon/315/}, {name: cacnea, url: https://pokeapi.co/api/v2/pokemon/331/}, {name: cacturne, url: https://pokeapi.co/api/v2/pokemon/332/}, {name: zangoose, url: https://pokeapi.co/api/v2/pokemon/335/}, {name: seviper, url: https://pokeapi.co/api/v2/pokemon/336/}, {name: corphish, url: https://pokeapi.co/api/v2/pokemon/341/}, {name: crawdaunt, url: https://pokeapi.co/api/v2/pokemon/342/}, {name: lileep, url: https://pokeapi.co/api/v2/pokemon/345/}, {name: cradily, url: https://pokeapi.co/api/v2/pokemon/346/}, {name: anorith, url: https://pokeapi.co/api/v2/pokemon/347/}, {name: armaldo, url: https://pokeapi.co/api/v2/pokemon/348/}, {name: tropius, url: https://pokeapi.co/api/v2/pokemon/357/}, {name: absol, url: https://pokeapi.co/api/v2/pokemon/359/}, {name: groudon, url: https://pokeapi.co/api/v2/pokemon/383/}, {name: rayquaza, url: https://pokeapi.co/api/v2/pokemon/384/}, {name: turtwig, url: https://pokeapi.co/api/v2/pokemon/387/}, {name: grotle, url: https://pokeapi.co/api/v2/pokemon/388/}, {name: torterra, url: https://pokeapi.co/api/v2/pokemon/389/}, {name: chimchar, url: https://pokeapi.co/api/v2/pokemon/390/}, {name: monferno, url: https://pokeapi.co/api/v2/pokemon/391/}, {name: infernape, url: https://pokeapi.co/api/v2/pokemon/392/}, {name: empoleon, url: https://pokeapi.co/api/v2/pokemon/395/}, {name: bidoof, url: https://pokeapi.co/api/v2/pokemon/399/}, {name: bibarel, url: https://pokeapi.co/api/v2/pokemon/400/}, {name: kricketune, url: https://pokeapi.co/api/v2/pokemon/402/}, {name: budew, url: https://pokeapi.co/api/v2/pokemon/406/}, {name: roserade, url: https://pokeapi.co/api/v2/pokemon/407/}, {name: cranidos, url: https://pokeapi.co/api/v2/pokemon/408/}, {name: rampardos, url: https://pokeapi.co/api/v2/pokemon/409/}, {name: cherubi, url: https://pokeapi.co/api/v2/pokemon/420/}, {name: cherrim, url: https://pokeapi.co/api/v2/pokemon/421/}, {name: garchomp, url: https://pokeapi.co/api/v2/pokemon/445/}, {name: riolu, url: https://pokeapi.co/api/v2/pokemon/447/}, {name: lucario, url: https://pokeapi.co/api/v2/pokemon/448/}, {name: skorupi, url: https://pokeapi.co/api/v2/pokemon/451/}, {name: drapion, url: https://pokeapi.co/api/v2/pokemon/452/}, {name: toxicroak, url: https://pokeapi.co/api/v2/pokemon/454/}, {name: carnivine, url: https://pokeapi.co/api/v2/pokemon/455/}, {name: snover, url: https://pokeapi.co/api/v2/pokemon/459/}, {name: abomasnow, url: https://pokeapi.co/api/v2/pokemon/460/}, {name: weavile, url: https://pokeapi.co/api/v2/pokemon/461/}, {name: lickilicky, url: https://pokeapi.co/api/v2/pokemon/463/}, {name: rhyperior, url: https://pokeapi.co/api/v2/pokemon/464/}, {name: tangrowth, url: https://pokeapi.co/api/v2/pokemon/465/}, {name: leafeon, url: https://pokeapi.co/api/v2/pokemon/470/}, {name: gliscor, url: https://pokeapi.co/api/v2/pokemon/472/}, {name: gallade, url: https://pokeapi.co/api/v2/pokemon/475/}, {name: darkrai, url: https://pokeapi.co/api/v2/pokemon/491/}, {name: shaymin-land, url: https://pokeapi.co/api/v2/pokemon/492/}, {name: arceus, url: https://pokeapi.co/api/v2/pokemon/493/}, {name: snivy, url: https://pokeapi.co/api/v2/pokemon/495/}, {name: servine, url: https://pokeapi.co/api/v2/pokemon/496/}, {name: serperior, url: https://pokeapi.co/api/v2/pokemon/497/}, {name: oshawott, url: https://pokeapi.co/api/v2/pokemon/501/}, {name: dewott, url: https://pokeapi.co/api/v2/pokemon/502/}, {name: samurott, url: https://pokeapi.co/api/v2/pokemon/503/}, {name: patrat, url: https://pokeapi.co/api/v2/pokemon/504/}, {name: watchog, url: https://pokeapi.co/api/v2/pokemon/505/}, {name: drilbur, url: https://pokeapi.co/api/v2/pokemon/529/}, {name: excadrill, url: https://pokeapi.co/api/v2/pokemon/530/}, {name: leavanny, url: https://pokeapi.co/api/v2/pokemon/542/}, {name: scolipede, url: https://pokeapi.co/api/v2/pokemon/545/}, {name: lilligant, url: https://pokeapi.co/api/v2/pokemon/549/}, {name: dwebble, url: https://pokeapi.co/api/v2/pokemon/557/}, {name: crustle, url: https://pokeapi.co/api/v2/pokemon/558/}, {name: zorua, url: https://pokeapi.co/api/v2/pokemon/570/}, {name: zoroark, url: https://pokeapi.co/api/v2/pokemon/571/}, {name: sawsbuck, url: https://pokeapi.co/api/v2/pokemon/586/}, {name: karrablast, url: https://pokeapi.co/api/v2/pokemon/588/}, {name: escavalier, url: https://pokeapi.co/api/v2/pokemon/589/}, {name: ferrothorn, url: https://pokeapi.co/api/v2/pokemon/598/}, {name: axew, url: https://pokeapi.co/api/v2/pokemon/610/}, {name: fraxure, url: https://pokeapi.co/api/v2/pokemon/611/}, {name: haxorus, url: https://pokeapi.co/api/v2/pokemon/612/}, {name: beartic, url: https://pokeapi.co/api/v2/pokemon/614/}, {name: mienfoo, url: https://pokeapi.co/api/v2/pokemon/619/}, {name: mienshao, url: https://pokeapi.co/api/v2/pokemon/620/}, {name: pawniard, url: https://pokeapi.co/api/v2/pokemon/624/}, {name: bisharp, url: https://pokeapi.co/api/v2/pokemon/625/}, {name: bouffalant, url: https://pokeapi.co/api/v2/pokemon/626/}, {name: cobalion, url: https://pokeapi.co/api/v2/pokemon/638/}, {name: terrakion, url: https://pokeapi.co/api/v2/pokemon/639/}, {name: virizion, url: https://pokeapi.co/api/v2/pokemon/640/}, {name: landorus-incarnate, url: https://pokeapi.co/api/v2/pokemon/645/}, {name: keldeo-ordinary, url: https://pokeapi.co/api/v2/pokemon/647/}, {name: chespin, url: https://pokeapi.co/api/v2/pokemon/650/}, {name: quilladin, url: https://pokeapi.co/api/v2/pokemon/651/}, {name: chesnaught, url: https://pokeapi.co/api/v2/pokemon/652/}, {name: diggersby, url: https://pokeapi.co/api/v2/pokemon/660/}, {name: fletchling, url: https://pokeapi.co/api/v2/pokemon/661/}, {name: fletchinder, url: https://pokeapi.co/api/v2/pokemon/662/}, {name: talonflame, url: https://pokeapi.co/api/v2/pokemon/663/}, {name: pancham, url: https://pokeapi.co/api/v2/pokemon/674/}, {name: pangoro, url: https://pokeapi.co/api/v2/pokemon/675/}, {name: honedge, url: https://pokeapi.co/api/v2/pokemon/679/}, {name: doublade, url: https://pokeapi.co/api/v2/pokemon/680/}, {name: aegislash-shield, url: https://pokeapi.co/api/v2/pokemon/681/}, {name: binacle, url: https://pokeapi.co/api/v2/pokemon/688/}, {name: barbaracle, url: https://pokeapi.co/api/v2/pokemon/689/}, {name: clauncher, url: https://pokeapi.co/api/v2/pokemon/692/}, {name: clawitzer, url: https://pokeapi.co/api/v2/pokemon/693/}, {name: hawlucha, url: https://pokeapi.co/api/v2/pokemon/701/}, {name: rowlet, url: https://pokeapi.co/api/v2/pokemon/722/}, {name: dartrix, url: https://pokeapi.co/api/v2/pokemon/723/}, {name: decidueye, url: https://pokeapi.co/api/v2/pokemon/724/}, {name: litten, url: https://pokeapi.co/api/v2/pokemon/725/}, {name: torracat, url: https://pokeapi.co/api/v2/pokemon/726/}, {name: incineroar, url: https://pokeapi.co/api/v2/pokemon/727/}, {name: pikipek, url: https://pokeapi.co/api/v2/pokemon/731/}, {name: trumbeak, url: https://pokeapi.co/api/v2/pokemon/732/}, {name: toucannon, url: https://pokeapi.co/api/v2/pokemon/733/}, {name: oricorio-baile, url: https://pokeapi.co/api/v2/pokemon/741/}, {name: lycanroc-midday, url: https://pokeapi.co/api/v2/pokemon/745/}, {name: fomantis, url: https://pokeapi.co/api/v2/pokemon/753/}, {name: lurantis, url: https://pokeapi.co/api/v2/pokemon/754/}, {name: stufful, url: https://pokeapi.co/api/v2/pokemon/759/}, {name: bewear, url: https://pokeapi.co/api/v2/pokemon/760/}, {name: golisopod, url: https://pokeapi.co/api/v2/pokemon/768/}, {name: type-null, url: https://pokeapi.co/api/v2/pokemon/772/}, {name: silvally, url: https://pokeapi.co/api/v2/pokemon/773/}, {name: komala, url: https://pokeapi.co/api/v2/pokemon/775/}, {name: mimikyu-disguised, url: https://pokeapi.co/api/v2/pokemon/778/}, {name: bruxish, url: https://pokeapi.co/api/v2/pokemon/779/}, {name: dhelmise, url: https://pokeapi.co/api/v2/pokemon/781/}, {name: jangmo-o, url: https://pokeapi.co/api/v2/pokemon/782/}, {name: hakamo-o, url: https://pokeapi.co/api/v2/pokemon/783/}, {name: kommo-o, url: https://pokeapi.co/api/v2/pokemon/784/}, {name: tapu-bulu, url: https://pokeapi.co/api/v2/pokemon/787/}, {name: kartana, url: https://pokeapi.co/api/v2/pokemon/798/}, {name: necrozma, url: https://pokeapi.co/api/v2/pokemon/800/}, {name: shaymin-sky, url: https://pokeapi.co/api/v2/pokemon/10006/}, {name: landorus-therian, url: https://pokeapi.co/api/v2/pokemon/10021/}, {name: keldeo-resolute, url: https://pokeapi.co/api/v2/pokemon/10024/}, {name: aegislash-blade, url: https://pokeapi.co/api/v2/pokemon/10026/}, {name: venusaur-mega, url: https://pokeapi.co/api/v2/pokemon/10033/}, {name: charizard-mega-x, url: https://pokeapi.co/api/v2/pokemon/10034/}, {name: charizard-mega-y, url: https://pokeapi.co/api/v2/pokemon/10035/}, {name: pinsir-mega, url: https://pokeapi.co/api/v2/pokemon/10040/}, {name: scizor-mega, url: https://pokeapi.co/api/v2/pokemon/10046/}, {name: heracross-mega, url: https://pokeapi.co/api/v2/pokemon/10047/}, {name: blaziken-mega, url: https://pokeapi.co/api/v2/pokemon/10050/}, {name: mawile-mega, url: https://pokeapi.co/api/v2/pokemon/10052/}, {name: absol-mega, url: https://pokeapi.co/api/v2/pokemon/10057/}, {name: garchomp-mega, url: https://pokeapi.co/api/v2/pokemon/10058/}, {name: lucario-mega, url: https://pokeapi.co/api/v2/pokemon/10059/}, {name: abomasnow-mega, url: https://pokeapi.co/api/v2/pokemon/10060/}, {name: sceptile-mega, url: https://pokeapi.co/api/v2/pokemon/10065/}, {name: gallade-mega, url: https://pokeapi.co/api/v2/pokemon/10068/}, {name: groudon-primal, url: https://pokeapi.co/api/v2/pokemon/10078/}, {name: rayquaza-mega, url: https://pokeapi.co/api/v2/pokemon/10079/}, {name: beedrill-mega, url: https://pokeapi.co/api/v2/pokemon/10090/}, {name: raticate-alola, url: https://pokeapi.co/api/v2/pokemon/10092/}, {name: raticate-totem-alola, url: https://pokeapi.co/api/v2/pokemon/10093/}, {name: sandshrew-alola, url: https://pokeapi.co/api/v2/pokemon/10101/}, {name: sandslash-alola, url: https://pokeapi.co/api/v2/pokemon/10102/}, {name: exeggutor-alola, url: https://pokeapi.co/api/v2/pokemon/10114/}, {name: marowak-alola, url: https://pokeapi.co/api/v2/pokemon/10115/}, {name: oricorio-pom-pom, url: https://pokeapi.co/api/v2/pokemon/10123/}, {name: oricorio-pau, url: https://pokeapi.co/api/v2/pokemon/10124/}, {name: oricorio-sensu, url: https://pokeapi.co/api/v2/pokemon/10125/}, {name: lycanroc-midnight, url: https://pokeapi.co/api/v2/pokemon/10126/}, {name: lurantis-totem, url: https://pokeapi.co/api/v2/pokemon/10128/}, {name: mimikyu-busted, url: https://pokeapi.co/api/v2/pokemon/10143/}, {name: mimikyu-totem-disguised, url: https://pokeapi.co/api/v2/pokemon/10144/}, {name: mimikyu-totem-busted, url: https://pokeapi.co/api/v2/pokemon/10145/}, {name: kommo-o-totem, url: https://pokeapi.co/api/v2/pokemon/10146/}, {name: marowak-totem, url: https://pokeapi.co/api/v2/pokemon/10149/}, {name: lycanroc-dusk, url: https://pokeapi.co/api/v2/pokemon/10152/}, {name: necrozma-dusk, url: https://pokeapi.co/api/v2/pokemon/10155/}, {name: necrozma-dawn, url: https://pokeapi.co/api/v2/pokemon/10156/}, {name: necrozma-ultra, url: https://pokeapi.co/api/v2/pokemon/10157/}], machines: [{machine: {url: https://pokeapi.co/api/v2/machine/37/}, version_group: {name: red-blue, url: https://pokeapi.co/api/v2/version-group/1/}}, {machine: {url: https://pokeapi.co/api/v2/machine/38/}, version_group: {name: yellow, url: https://pokeapi.co/api/v2/version-group/2/}}, {machine: {url: https://pokeapi.co/api/v2/machine/1117/}, version_group: {name: diamond-pearl, url: https://pokeapi.co/api/v2/version-group/8/}}, {machine: {url: https://pokeapi.co/api/v2/machine/1118/}, version_group: {name: platinum, url: https://pokeapi.co/api/v2/version-group/9/}}, {machine: {url: https://pokeapi.co/api/v2/machine/1119/}, version_group: {name: heartgold-soulsilver, url: https://pokeapi.co/api/v2/version-group/10/}}, {machine: {url: https://pokeapi.co/api/v2/machine/1120/}, version_group: {name: black-white, url: https://pokeapi.co/api/v2/version-group/11/}}, {machine: {url: https://pokeapi.co/api/v2/machine/1121/}, version_group: {name: black-2-white-2, url: https://pokeapi.co/api/v2/version-group/14/}}, {machine: {url: https://pokeapi.co/api/v2/machine/1122/}, version_group: {name: x-y, url: https://pokeapi.co/api/v2/version-group/15/}}, {machine: {url: https://pokeapi.co/api/v2/machine/1123/}, version_group: {name: omega-ruby-alpha-sapphire, url: https://pokeapi.co/api/v2/version-group/16/}}, {machine: {url: https://pokeapi.co/api/v2/machine/1124/}, version_group: {name: sun-moon, url: https://pokeapi.co/api/v2/version-group/17/}}, {machine: {url: https://pokeapi.co/api/v2/machine/1125/}, version_group: {name: ultra-sun-ultra-moon, url: https://pokeapi.co/api/v2/version-group/18/}}], meta: {ailment: {name: none, url: https://pokeapi.co/api/v2/move-ailment/0/}, ailment_chance: 0, category: {name: net-good-stats, url: https://pokeapi.co/api/v2/move-category/2/}, crit_rate: 0, drain: 0, flinch_chance: 0, healing: 0, max_hits: null, max_turns: null, min_hits: null, min_turns: null, stat_chance: 0}, name: swords-dance, names: [{language: {name: ja-Hrkt, url: https://pokeapi.co/api/v2/language/1/}, name: つるぎのまい}, {language: {name: ko, url: https://pokeapi.co/api/v2/language/3/}, name: 칼춤}, {language: {name: zh-Hant, url: https://pokeapi.co/api/v2/language/4/}, name: 劍舞}, {language: {name: fr, url: https://pokeapi.co/api/v2/language/5/}, name: Danse Lames}, {language: {name: de, url: https://pokeapi.co/api/v2/language/6/}, name: Schwerttanz}, {language: {name: es, url: https://pokeapi.co/api/v2/language/7/}, name: Danza Espada}, {language: {name: it, url: https://pokeapi.co/api/v2/language/8/}, name: Danzaspada}, {language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, name: Swords Dance}, {language: {name: ja, url: https://pokeapi.co/api/v2/language/11/}, name: つるぎのまい}, {language: {name: zh-Hans, url: https://pokeapi.co/api/v2/language/12/}, name: 剑舞}], past_values: [{accuracy: null, effect_chance: null, effect_entries: [], power: null, pp: 30, type: null, version_group: {name: x-y, url: https://pokeapi.co/api/v2/version-group/15/}}], power: null, pp: 20, priority: 0, stat_changes: [{change: 2, stat: {name: attack, url: https://pokeapi.co/api/v2/stat/2/}}], super_contest_effect: {url: https://pokeapi.co/api/v2/super-contest-effect/11/}, target: {name: user, url: https://pokeapi.co/api/v2/move-target/7/}, type: {name: normal, url: https://pokeapi.co/api/v2/type/1/}}
''');
