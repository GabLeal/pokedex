import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/layers/data/dto/move_details_entity.dart';
import 'package:pokedex/layers/data/repositories/move_repository_imp.dart';
import 'package:pokedex/util/base_url.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();

  final repository = MoveDetailsRepositoryImp(dio: dio);

  test('should return MoveDetails', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: BaseUrl.url),
        data: jsonMove,
        statusCode: 200));

    MoveDetailsDto? moveDetails = await repository.getMoveDetails(url);

    expect(moveDetails, isNotNull);
  });
}

var url = 'https://pokeapi.co/api/v2/move/345/';
var jsonMove = jsonEncode('''
{accuracy: 100, contest_combos: {normal: {use_after: [{name: ice-punch, url: https://pokeapi.co/api/v2/move/8/}, {name: thunder-punch, url: https://pokeapi.co/api/v2/move/9/}, {name: sunny-day, url: https://pokeapi.co/api/v2/move/241/}], use_before: [{name: ice-punch, url: https://pokeapi.co/api/v2/move/8/}, {name: thunder-punch, url: https://pokeapi.co/api/v2/move/9/}]}, super: {use_after: null, use_before: null}}, contest_effect: {url: https://pokeapi.co/api/v2/contest-effect/1/}, contest_type: {name: beauty, url: https://pokeapi.co/api/v2/contest-type/2/}, damage_class: {name: physical, url: https://pokeapi.co/api/v2/move-damage-class/2/}, effect_chance: 10, effect_changes: [], effect_entries: [{effect: Inflicts regular damage.  Has a effect_chance% chance to burn the target., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, short_effect: Has a effect_chance% chance to burn the target.}], flavor_text_entries: [{flavor_text: A fiery punch. May
      cause a burn., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: gold-silver, url: https://pokeapi.co/api/v2/version-group/3/}}, {flavor_text: A fiery punch. May
      cause a burn., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: crystal, url: https://pokeapi.co/api/v2/version-group/4/}}, {flavor_text: A fiery punch that may burn
      the foe., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: ruby-sapphire, url: https://pokeapi.co/api/v2/version-group/5/}}, {flavor_text: A fiery punch that may burn
      the foe., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: emerald, url: https://pokeapi.co/api/v2/version-group/6/}}, {flavor_text: The foe is punched
      with a fiery fist.
      It may leave the
      foe with a burn., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: firered-leafgreen, url: https://pokeapi.co/api/v2/version-group/7/}}, {flavor_text: The foe is punched
      with a fiery fist.
      It may leave the
      target with a burn.
      , language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: diamond-pearl, url: https://pokeapi.co/api/v2/version-group/8/}}, {flavor_text: The foe is punched
      with a fiery fist.
      It may leave the
      target with a burn.
      , language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: platinum, url: https://pokeapi.co/api/v2/version-group/9/}}, {flavor_text: The foe is punched
      with a fiery fist.
      It may leave the
      target with a burn.
      , language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: heartgold-soulsilver, url: https://pokeapi.co/api/v2/version-group/10/}}, {flavor_text: Un coup de poing enflammé vient
      frapper l’ennemi. Peut le brûler., language: {name: fr, url: https://pokeapi.co/api/v2/language/5/}, version_group: {name: black-white, url: https://pokeapi.co/api/v2/version-group/11/}}, {flavor_text: The target is punched with a fiery fist.
      It may also leave the target with a burn., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: black-white, url: https://pokeapi.co/api/v2/version-group/11/}}, {flavor_text: The target is punched with a fiery fist.
      It may also leave the target with a burn., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: black-2-white-2, url: https://pokeapi.co/api/v2/version-group/14/}}, {flavor_text: ほのおを　こめた　パンチで
      あいてを　こうげきする。
      やけど　じょうたいに　することが　ある。, language: {name: ja-Hrkt, url: https://pokeapi.co/api/v2/language/1/}, version_group: {name: x-y, url: https://pokeapi.co/api/v2/version-group/15/}}, {flavor_text: 불꽃을 담은 펀치로
      상대를 공격한다.
      화상 상태로 만들 때가 있다., language: {name: ko, url: https://pokeapi.co/api/v2/language/3/}, version_group: {name: x-y, url: https://pokeapi.co/api/v2/version-group/15/}}, {flavor_text: Un coup de poing enflammé vient frapper l’ennemi.
      Peut le brûler., language: {name: fr, url: https://pokeapi.co/api/v2/language/5/}, version_group: {name: x-y, url: https://pokeapi.co/api/v2/version-group/15/}}, {flavor_text: Feuriger Schlag, der dem Ziel eventuell
      Verbrennungen zufügt., language: {name: de, url: https://pokeapi.co/api/v2/language/6/}, version_group: {name: x-y, url: https://pokeapi.co/api/v2/version-group/15/}}, {flavor_text: Puñetazo ardiente. Puede quemar., language: {name: es, url: https://pokeapi.co/api/v2/language/7/}, version_group: {name: x-y, url: https://pokeapi.co/api/v2/version-group/15/}}, {flavor_text: Colpisce il bersaglio con un pugno ardente
      che può scottarlo., language: {name: it, url: https://pokeapi.co/api/v2/language/8/}, version_group: {name: x-y, url: https://pokeapi.co/api/v2/version-group/15/}}, {flavor_text: The target is punched with a fiery fist.
      This may also leave the target with a burn., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: x-y, url: https://pokeapi.co/api/v2/version-group/15/}}, {flavor_text: 炎を　こめた　パンチで
      相手を　攻撃する。
      やけど状態に　することが　ある。, language: {name: ja, url: https://pokeapi.co/api/v2/language/11/}, version_group: {name: x-y, url: https://pokeapi.co/api/v2/version-group/15/}}, {flavor_text: ほのおを　こめた　パンチで
      あいてを　こうげきする。
      やけど　じょうたいに　することが　ある。, language: {name: ja-Hrkt, url: https://pokeapi.co/api/v2/language/1/}, version_group: {name: omega-ruby-alpha-sapphire, url: https://pokeapi.co/api/v2/version-group/16/}}, {flavor_text: 불꽃을 담은 펀치로
      상대를 공격한다.
      화상 상태로 만들 때가 있다., language: {name: ko, url: https://pokeapi.co/api/v2/language/3/}, version_group: {name: omega-ruby-alpha-sapphire, url: https://pokeapi.co/api/v2/version-group/16/}}, {flavor_text: Un coup de poing enflammé vient frapper l’ennemi.
      Peut le brûler., language: {name: fr, url: https://pokeapi.co/api/v2/language/5/}, version_group: {name: omega-ruby-alpha-sapphire, url: https://pokeapi.co/api/v2/version-group/16/}}, {flavor_text: Feuriger Schlag, der dem Ziel eventuell
      Verbrennungen zufügt., language: {name: de, url: https://pokeapi.co/api/v2/language/6/}, version_group: {name: omega-ruby-alpha-sapphire, url: https://pokeapi.co/api/v2/version-group/16/}}, {flavor_text: Puñetazo ardiente. Puede quemar., language: {name: es, url: https://pokeapi.co/api/v2/language/7/}, version_group: {name: omega-ruby-alpha-sapphire, url: https://pokeapi.co/api/v2/version-group/16/}}, {flavor_text: Colpisce il bersaglio con un pugno ardente
      che può scottarlo., language: {name: it, url: https://pokeapi.co/api/v2/language/8/}, version_group: {name: omega-ruby-alpha-sapphire, url: https://pokeapi.co/api/v2/version-group/16/}}, {flavor_text: The target is punched with a fiery fist.
      This may also leave the target with a burn., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: omega-ruby-alpha-sapphire, url: https://pokeapi.co/api/v2/version-group/16/}}, {flavor_text: 炎を　こめた　パンチで
      相手を　攻撃する。
      やけど状態に　することが　ある。, language: {name: ja, url: https://pokeapi.co/api/v2/language/11/}, version_group: {name: omega-ruby-alpha-sapphire, url: https://pokeapi.co/api/v2/version-group/16/}}, {flavor_text: ほのおを　こめた　パンチで
      あいてを　こうげきする。
      やけど　じょうたいに　することが　ある。, language: {name: ja-Hrkt, url: https://pokeapi.co/api/v2/language/1/}, version_group: {name: sun-moon, url: https://pokeapi.co/api/v2/version-group/17/}}, {flavor_text: 불꽃을 담은 펀치로
      상대를 공격한다.
      화상 상태로 만들 때가 있다., language: {name: ko, url: https://pokeapi.co/api/v2/language/3/}, version_group: {name: sun-moon, url: https://pokeapi.co/api/v2/version-group/17/}}, {flavor_text: 用帶有火焰的拳頭
      攻擊對手。
      有時會讓對手陷入灼傷狀態。, language: {name: zh-Hant, url: https://pokeapi.co/api/v2/language/4/}, version_group: {name: sun-moon, url: https://pokeapi.co/api/v2/version-group/17/}}, {flavor_text: Un coup de poing enflammé vient frapper l’ennemi.
      Peut le brûler., language: {name: fr, url: https://pokeapi.co/api/v2/language/5/}, version_group: {name: sun-moon, url: https://pokeapi.co/api/v2/version-group/17/}}, {flavor_text: Feuriger Schlag, der dem Ziel eventuell
      Verbrennungen zufügt., language: {name: de, url: https://pokeapi.co/api/v2/language/6/}, version_group: {name: sun-moon, url: https://pokeapi.co/api/v2/version-group/17/}}, {flavor_text: Puñetazo ardiente. Puede quemar., language: {name: es, url: https://pokeapi.co/api/v2/language/7/}, version_group: {name: sun-moon, url: https://pokeapi.co/api/v2/version-group/17/}}, {flavor_text: Colpisce il bersaglio con un pugno ardente
      che può scottarlo., language: {name: it, url: https://pokeapi.co/api/v2/language/8/}, version_group: {name: sun-moon, url: https://pokeapi.co/api/v2/version-group/17/}}, {flavor_text: The target is punched with a fiery fist. This may also
      leave the target with a burn., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: sun-moon, url: https://pokeapi.co/api/v2/version-group/17/}}, {flavor_text: 炎を　こめた　パンチで
      相手を　攻撃する。
      やけど状態に　することが　ある。, language: {name: ja, url: https://pokeapi.co/api/v2/language/11/}, version_group: {name: sun-moon, url: https://pokeapi.co/api/v2/version-group/17/}}, {flavor_text: 用充满火焰的拳头攻击对手。
      有时会让对手陷入灼伤状态。, language: {name: zh-Hans, url: https://pokeapi.co/api/v2/language/12/}, version_group: {name: sun-moon, url: https://pokeapi.co/api/v2/version-group/17/}}, {flavor_text: ほのおを　こめた　パンチで
      あいてを　こうげきする。
      やけど　じょうたいに　することが　ある。, language: {name: ja-Hrkt, url: https://pokeapi.co/api/v2/language/1/}, version_group: {name: ultra-sun-ultra-moon, url: https://pokeapi.co/api/v2/version-group/18/}}, {flavor_text: 불꽃을 담은 펀치로
      상대를 공격한다.
      화상 상태로 만들 때가 있다., language: {name: ko, url: https://pokeapi.co/api/v2/language/3/}, version_group: {name: ultra-sun-ultra-moon, url: https://pokeapi.co/api/v2/version-group/18/}}, {flavor_text: 用帶有火焰的拳頭
      攻擊對手。
      有時會讓對手陷入灼傷狀態。, language: {name: zh-Hant, url: https://pokeapi.co/api/v2/language/4/}, version_group: {name: ultra-sun-ultra-moon, url: https://pokeapi.co/api/v2/version-group/18/}}, {flavor_text: Un coup de poing enflammé vient frapper l’ennemi.
      Peut le brûler., language: {name: fr, url: https://pokeapi.co/api/v2/language/5/}, version_group: {name: ultra-sun-ultra-moon, url: https://pokeapi.co/api/v2/version-group/18/}}, {flavor_text: Feuriger Schlag, der dem Ziel eventuell
      Verbrennungen zufügt., language: {name: de, url: https://pokeapi.co/api/v2/language/6/}, version_group: {name: ultra-sun-ultra-moon, url: https://pokeapi.co/api/v2/version-group/18/}}, {flavor_text: Puñetazo ardiente. Puede quemar., language: {name: es, url: https://pokeapi.co/api/v2/language/7/}, version_group: {name: ultra-sun-ultra-moon, url: https://pokeapi.co/api/v2/version-group/18/}}, {flavor_text: Colpisce il bersaglio con un pugno ardente
      che può scottarlo., language: {name: it, url: https://pokeapi.co/api/v2/language/8/}, version_group: {name: ultra-sun-ultra-moon, url: https://pokeapi.co/api/v2/version-group/18/}}, {flavor_text: The target is punched with a fiery fist. This may also
      leave the target with a burn., language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, version_group: {name: ultra-sun-ultra-moon, url: https://pokeapi.co/api/v2/version-group/18/}}, {flavor_text: 炎を　こめた　パンチで
      相手を　攻撃する。
      やけど状態に　することが　ある。, language: {name: ja, url: https://pokeapi.co/api/v2/language/11/}, version_group: {name: ultra-sun-ultra-moon, url: https://pokeapi.co/api/v2/version-group/18/}}, {flavor_text: 用充满火焰的拳头攻击对手。
      有时会让对手陷入灼伤状态。, language: {name: zh-Hans, url: https://pokeapi.co/api/v2/language/12/}, version_group: {name: ultra-sun-ultra-moon, url: https://pokeapi.co/api/v2/version-group/18/}}], generation: {name: generation-i, url: https://pokeapi.co/api/v2/generation/1/}, id: 7, learned_by_pokemon: [{name: charmander, url: https://pokeapi.co/api/v2/pokemon/4/}, {name: charmeleon, url: https://pokeapi.co/api/v2/pokemon/5/}, {name: charizard, url: https://pokeapi.co/api/v2/pokemon/6/}, {name: nidoqueen, url: https://pokeapi.co/api/v2/pokemon/31/}, {name: nidoking, url: https://pokeapi.co/api/v2/pokemon/34/}, {name: clefairy, url: https://pokeapi.co/api/v2/pokemon/35/}, {name: clefable, url: https://pokeapi.co/api/v2/pokemon/36/}, {name: jigglypuff, url: https://pokeapi.co/api/v2/pokemon/39/}, {name: wigglytuff, url: https://pokeapi.co/api/v2/pokemon/40/}, {name: mankey, url: https://pokeapi.co/api/v2/pokemon/56/}, {name: primeape, url: https://pokeapi.co/api/v2/pokemon/57/}, {name: abra, url: https://pokeapi.co/api/v2/pokemon/63/}, {name: kadabra, url: https://pokeapi.co/api/v2/pokemon/64/}, {name: alakazam, url: https://pokeapi.co/api/v2/pokemon/65/}, {name: machop, url: https://pokeapi.co/api/v2/pokemon/66/}, {name: machoke, url: https://pokeapi.co/api/v2/pokemon/67/}, {name: machamp, url: https://pokeapi.co/api/v2/pokemon/68/}, {name: geodude, url: https://pokeapi.co/api/v2/pokemon/74/}, {name: graveler, url: https://pokeapi.co/api/v2/pokemon/75/}, {name: golem, url: https://pokeapi.co/api/v2/pokemon/76/}, {name: grimer, url: https://pokeapi.co/api/v2/pokemon/88/}, {name: muk, url: https://pokeapi.co/api/v2/pokemon/89/}, {name: gastly, url: https://pokeapi.co/api/v2/pokemon/92/}, {name: haunter, url: https://pokeapi.co/api/v2/pokemon/93/}, {name: gengar, url: https://pokeapi.co/api/v2/pokemon/94/}, {name: drowzee, url: https://pokeapi.co/api/v2/pokemon/96/}, {name: hypno, url: https://pokeapi.co/api/v2/pokemon/97/}, {name: cubone, url: https://pokeapi.co/api/v2/pokemon/104/}, {name: marowak, url: https://pokeapi.co/api/v2/pokemon/105/}, {name: hitmonchan, url: https://pokeapi.co/api/v2/pokemon/107/}, {name: lickitung, url: https://pokeapi.co/api/v2/pokemon/108/}, {name: rhydon, url: https://pokeapi.co/api/v2/pokemon/112/}, {name: chansey, url: https://pokeapi.co/api/v2/pokemon/113/}, {name: kangaskhan, url: https://pokeapi.co/api/v2/pokemon/115/}, {name: mr-mime, url: https://pokeapi.co/api/v2/pokemon/122/}, {name: electabuzz, url: https://pokeapi.co/api/v2/pokemon/125/}, {name: magmar, url: https://pokeapi.co/api/v2/pokemon/126/}, {name: snorlax, url: https://pokeapi.co/api/v2/pokemon/143/}, {name: dragonite, url: https://pokeapi.co/api/v2/pokemon/149/}, {name: mewtwo, url: https://pokeapi.co/api/v2/pokemon/150/}, {name: mew, url: https://pokeapi.co/api/v2/pokemon/151/}, {name: typhlosion, url: https://pokeapi.co/api/v2/pokemon/157/}, {name: sentret, url: https://pokeapi.co/api/v2/pokemon/161/}, {name: furret, url: https://pokeapi.co/api/v2/pokemon/162/}, {name: flaaffy, url: https://pokeapi.co/api/v2/pokemon/180/}, {name: ampharos, url: https://pokeapi.co/api/v2/pokemon/181/}, {name: sudowoodo, url: https://pokeapi.co/api/v2/pokemon/185/}, {name: aipom, url: https://pokeapi.co/api/v2/pokemon/190/}, {name: snubbull, url: https://pokeapi.co/api/v2/pokemon/209/}, {name: granbull, url: https://pokeapi.co/api/v2/pokemon/210/}, {name: teddiursa, url: https://pokeapi.co/api/v2/pokemon/216/}, {name: ursaring, url: https://pokeapi.co/api/v2/pokemon/217/}, {name: elekid, url: https://pokeapi.co/api/v2/pokemon/239/}, {name: magby, url: https://pokeapi.co/api/v2/pokemon/240/}, {name: miltank, url: https://pokeapi.co/api/v2/pokemon/241/}, {name: blissey, url: https://pokeapi.co/api/v2/pokemon/242/}, {name: tyranitar, url: https://pokeapi.co/api/v2/pokemon/248/}, {name: combusken, url: https://pokeapi.co/api/v2/pokemon/256/}, {name: blaziken, url: https://pokeapi.co/api/v2/pokemon/257/}, {name: lombre, url: https://pokeapi.co/api/v2/pokemon/271/}, {name: ludicolo, url: https://pokeapi.co/api/v2/pokemon/272/}, {name: ralts, url: https://pokeapi.co/api/v2/pokemon/280/}, {name: kirlia, url: https://pokeapi.co/api/v2/pokemon/281/}, {name: gardevoir, url: https://pokeapi.co/api/v2/pokemon/282/}, {name: slakoth, url: https://pokeapi.co/api/v2/pokemon/287/}, {name: vigoroth, url: https://pokeapi.co/api/v2/pokemon/288/}, {name: slaking, url: https://pokeapi.co/api/v2/pokemon/289/}, {name: whismur, url: https://pokeapi.co/api/v2/pokemon/293/}, {name: loudred, url: https://pokeapi.co/api/v2/pokemon/294/}, {name: exploud, url: https://pokeapi.co/api/v2/pokemon/295/}, {name: makuhita, url: https://pokeapi.co/api/v2/pokemon/296/}, {name: hariyama, url: https://pokeapi.co/api/v2/pokemon/297/}, {name: nosepass, url: https://pokeapi.co/api/v2/pokemon/299/}, {name: sableye, url: https://pokeapi.co/api/v2/pokemon/302/}, {name: aggron, url: https://pokeapi.co/api/v2/pokemon/306/}, {name: meditite, url: https://pokeapi.co/api/v2/pokemon/307/}, {name: medicham, url: https://pokeapi.co/api/v2/pokemon/308/}, {name: gulpin, url: https://pokeapi.co/api/v2/pokemon/316/}, {name: swalot, url: https://pokeapi.co/api/v2/pokemon/317/}, {name: grumpig, url: https://pokeapi.co/api/v2/pokemon/326/}, {name: spinda, url: https://pokeapi.co/api/v2/pokemon/327/}, {name: flygon, url: https://pokeapi.co/api/v2/pokemon/330/}, {name: zangoose, url: https://pokeapi.co/api/v2/pokemon/335/}, {name: kecleon, url: https://pokeapi.co/api/v2/pokemon/352/}, {name: dusclops, url: https://pokeapi.co/api/v2/pokemon/356/}, {name: regirock, url: https://pokeapi.co/api/v2/pokemon/377/}, {name: groudon, url: https://pokeapi.co/api/v2/pokemon/383/}, {name: jirachi, url: https://pokeapi.co/api/v2/pokemon/385/}, {name: deoxys-normal, url: https://pokeapi.co/api/v2/pokemon/386/}, {name: chimchar, url: https://pokeapi.co/api/v2/pokemon/390/}, {name: monferno, url: https://pokeapi.co/api/v2/pokemon/391/}, {name: infernape, url: https://pokeapi.co/api/v2/pokemon/392/}, {name: cranidos, url: https://pokeapi.co/api/v2/pokemon/408/}, {name: rampardos, url: https://pokeapi.co/api/v2/pokemon/409/}, {name: ambipom, url: https://pokeapi.co/api/v2/pokemon/424/}, {name: buneary, url: https://pokeapi.co/api/v2/pokemon/427/}, {name: lopunny, url: https://pokeapi.co/api/v2/pokemon/428/}, {name: munchlax, url: https://pokeapi.co/api/v2/pokemon/446/}, {name: lickilicky, url: https://pokeapi.co/api/v2/pokemon/463/}, {name: rhyperior, url: https://pokeapi.co/api/v2/pokemon/464/}, {name: electivire, url: https://pokeapi.co/api/v2/pokemon/466/}, {name: magmortar, url: https://pokeapi.co/api/v2/pokemon/467/}, {name: gallade, url: https://pokeapi.co/api/v2/pokemon/475/}, {name: probopass, url: https://pokeapi.co/api/v2/pokemon/476/}, {name: dusknoir, url: https://pokeapi.co/api/v2/pokemon/477/}, {name: uxie, url: https://pokeapi.co/api/v2/pokemon/480/}, {name: mesprit, url: https://pokeapi.co/api/v2/pokemon/481/}, {name: azelf, url: https://pokeapi.co/api/v2/pokemon/482/}, {name: regigigas, url: https://pokeapi.co/api/v2/pokemon/486/}, {name: victini, url: https://pokeapi.co/api/v2/pokemon/494/}, {name: pignite, url: https://pokeapi.co/api/v2/pokemon/499/}, {name: emboar, url: https://pokeapi.co/api/v2/pokemon/500/}, {name: watchog, url: https://pokeapi.co/api/v2/pokemon/505/}, {name: pansear, url: https://pokeapi.co/api/v2/pokemon/513/}, {name: simisear, url: https://pokeapi.co/api/v2/pokemon/514/}, {name: audino, url: https://pokeapi.co/api/v2/pokemon/531/}, {name: timburr, url: https://pokeapi.co/api/v2/pokemon/532/}, {name: gurdurr, url: https://pokeapi.co/api/v2/pokemon/533/}, {name: conkeldurr, url: https://pokeapi.co/api/v2/pokemon/534/}, {name: throh, url: https://pokeapi.co/api/v2/pokemon/538/}, {name: sawk, url: https://pokeapi.co/api/v2/pokemon/539/}, {name: darumaka, url: https://pokeapi.co/api/v2/pokemon/554/}, {name: darmanitan-standard, url: https://pokeapi.co/api/v2/pokemon/555/}, {name: scraggy, url: https://pokeapi.co/api/v2/pokemon/559/}, {name: scrafty, url: https://pokeapi.co/api/v2/pokemon/560/}, {name: reuniclus, url: https://pokeapi.co/api/v2/pokemon/579/}, {name: eelektross, url: https://pokeapi.co/api/v2/pokemon/604/}, {name: druddigon, url: https://pokeapi.co/api/v2/pokemon/621/}, {name: golett, url: https://pokeapi.co/api/v2/pokemon/622/}, {name: golurk, url: https://pokeapi.co/api/v2/pokemon/623/}, {name: heatmor, url: https://pokeapi.co/api/v2/pokemon/631/}, {name: meloetta-aria, url: https://pokeapi.co/api/v2/pokemon/648/}, {name: braixen, url: https://pokeapi.co/api/v2/pokemon/654/}, {name: delphox, url: https://pokeapi.co/api/v2/pokemon/655/}, {name: diggersby, url: https://pokeapi.co/api/v2/pokemon/660/}, {name: pancham, url: https://pokeapi.co/api/v2/pokemon/674/}, {name: pangoro, url: https://pokeapi.co/api/v2/pokemon/675/}, {name: heliolisk, url: https://pokeapi.co/api/v2/pokemon/695/}, {name: hawlucha, url: https://pokeapi.co/api/v2/pokemon/701/}, {name: goodra, url: https://pokeapi.co/api/v2/pokemon/706/}, {name: hoopa, url: https://pokeapi.co/api/v2/pokemon/720/}, {name: marshadow, url: https://pokeapi.co/api/v2/pokemon/802/}, {name: deoxys-speed, url: https://pokeapi.co/api/v2/pokemon/10003/}, {name: darmanitan-zen, url: https://pokeapi.co/api/v2/pokemon/10017/}, {name: meloetta-pirouette, url: https://pokeapi.co/api/v2/pokemon/10018/}, {name: charizard-mega-x, url: https://pokeapi.co/api/v2/pokemon/10034/}, {name: charizard-mega-y, url: https://pokeapi.co/api/v2/pokemon/10035/}, {name: alakazam-mega, url: https://pokeapi.co/api/v2/pokemon/10037/}, {name: gengar-mega, url: https://pokeapi.co/api/v2/pokemon/10038/}, {name: kangaskhan-mega, url: https://pokeapi.co/api/v2/pokemon/10039/}, {name: mewtwo-mega-x, url: https://pokeapi.co/api/v2/pokemon/10043/}, {name: mewtwo-mega-y, url: https://pokeapi.co/api/v2/pokemon/10044/}, {name: ampharos-mega, url: https://pokeapi.co/api/v2/pokemon/10045/}, {name: tyranitar-mega, url: https://pokeapi.co/api/v2/pokemon/10049/}, 
      {name: blaziken-mega, url: https://pokeapi.co/api/v2/pokemon/10050/}, {name: gardevoir-mega, url: https://pokeapi.co/api/v2/pokemon/10051/}, {name: aggron-mega, url: https://pokeapi.co/api/v2/pokemon/10053/}, {name: medicham-mega, url: https://pokeapi.co/api/v2/pokemon/10054/}, {name: sableye-mega, url: https://pokeapi.co/api/v2/pokemon/10066/}, {name: gallade-mega, url: https://pokeapi.co/api/v2/pokemon/10068/}, {name: audino-mega, url: https://pokeapi.co/api/v2/pokemon/10069/}, {name: groudon-primal, url: https://pokeapi.co/api/v2/pokemon/10078/}, {name: hoopa-unbound, url: https://pokeapi.co/api/v2/pokemon/10086/}, {name: lopunny-mega, url: https://pokeapi.co/api/v2/pokemon/10088/}], machines: [{machine: {url: https://pokeapi.co/api/v2/machine/849/}, version_group: {name: gold-silver, url: https://pokeapi.co/api/v2/version-group/3/}}, {machine: {url: https://pokeapi.co/api/v2/machine/850/}, version_group: {name: crystal, url: https://pokeapi.co/api/v2/version-group/4/}}], meta: {ailment: {name: burn, url: https://pokeapi.co/api/v2/move-ailment/4/}, ailment_chance: 10, category: {name: damage+ailment, url: https://pokeapi.co/api/v2/move-category/4/}, crit_rate: 0, drain: 0, flinch_chance: 0, healing: 0, max_hits: null, max_turns: null, min_hits: null, min_turns: null, stat_chance: 0}, name: fire-punch, names: [{language: {name: ja-Hrkt, url: https://pokeapi.co/api/v2/language/1/}, name: ほのおのパンチ}, {language: {name: ko, url: https://pokeapi.co/api/v2/language/3/}, name: 불꽃펀치}, {language: {name: zh-Hant, url: https://pokeapi.co/api/v2/language/4/}, name: 火焰拳}, {language: {name: fr, url: https://pokeapi.co/api/v2/language/5/}, name: Poing Feu}, {language: {name: de, url: https://pokeapi.co/api/v2/language/6/}, name: Feuerschlag}, {language: {name: es, url: https://pokeapi.co/api/v2/language/7/}, name: Puño Fuego}, {language: {name: it, url: https://pokeapi.co/api/v2/language/8/}, name: Fuocopugno}, {language: {name: en, url: https://pokeapi.co/api/v2/language/9/}, name: Fire Punch}, {language: {name: ja, url: https://pokeapi.co/api/v2/language/11/}, name: ほのおのパンチ}, {language: {name: zh-Hans, url: https://pokeapi.co/api/v2/language/12/}, name: 火焰拳}], past_values: [], power: 75, pp: 15, priority: 0, stat_changes: [], super_contest_effect: {url: https://pokeapi.co/api/v2/super-contest-effect/17/}, target: {name: selected-pokemon, url: https://pokeapi.co/api/v2/move-target/10/}, type: {name: fire, url: https://pokeapi.co/api/v2/type/10/}}
''');
