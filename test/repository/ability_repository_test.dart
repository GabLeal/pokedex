import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/core/util/base_url.dart';
import 'package:pokedex/layers/domain/entities/ability_details_entity.dart';
import 'package:pokedex/layers/data/repositories/ability_repository_imp.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();

  final repository = AbilityDetailsRepositoryImp(dio: dio);

  test('should return AbilityDetails', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: BaseUrl.url),
        data: json,
        statusCode: 200));

    AbilityDetailsEntity? abilityDetails =
        await repository.getAbilityDetails(url);

    expect(abilityDetails, isNotNull);
  });
}

var url = 'https://pokeapi.co/api/v2/ability/65/';
var json = jsonDecode('''
{
  "effect_changes": [
    
  ],
  "effect_entries": [
    {
      "effect": "When this Pokémon has 1/3 or less of its HP remaining, its grass-type moves inflict 1.5× as much regular damage.",
      "language": {
        "name": "en",
        "url": "https://pokeapi.co/api/v2/language/9/"
      },
      "short_effect": "Strengthens grass moves to inflict 1.5× damage at 1/3 max HP or less."
    },
    {
      "effect": "Wenn ein Pokémon mit dieser Fähigkeit nur noch 1/3 seiner maximalen hp oder weniger hat, werden all seine grass Attacken verstärkt, so dass sie 1,5× so viel regular damage anrichten wie sonst.",
      "language": {
        "name": "de",
        "url": "https://pokeapi.co/api/v2/language/6/"
      },
      "short_effect": "Erhöht den Schaden von grass Attacken um 50% wenn nur noch 1/3 der maximalen hp oder weniger übrig sind."
    }
  ],
  "flavor_text_entries": [
    {
      "flavor_text": "Ups GRASS moves in a pinch.",
      "language": {
        "name": "en",
        "url": "https://pokeapi.co/api/v2/language/9/"
      },
      "version_group": {
        "name": "ruby-sapphire",
        "url": "https://pokeapi.co/api/v2/version-group/5/"
      }
    },
    {
      "flavor_text": "Ups GRASS moves in a pinch.",
      "language": {
        "name": "en",
        "url": "https://pokeapi.co/api/v2/language/9/"
      },
      "version_group": {
        "name": "emerald",
        "url": "https://pokeapi.co/api/v2/version-group/6/"
      }
    },
    {
      "flavor_text": "Ups GRASS moves in a pinch.",
      "language": {
        "name": "en",
        "url": "https://pokeapi.co/api/v2/language/9/"
      },
      "version_group": {
        "name": "firered-leafgreen",
        "url": "https://pokeapi.co/api/v2/version-group/7/"
      }
    },
    {
      "flavor_text": "Powers up Grass-type\nmoves in a pinch.",
      "language": {
        "name": "en",
        "url": "https://pokeapi.co/api/v2/language/9/"
      },
      "version_group": {
        "name": "diamond-pearl",
        "url": "https://pokeapi.co/api/v2/version-group/8/"
      }
    },
    {
      "flavor_text": "Powers up Grass-type\nmoves in a pinch.",
      "language": {
        "name": "en",
        "url": "https://pokeapi.co/api/v2/language/9/"
      },
      "version_group": {
        "name": "platinum",
        "url": "https://pokeapi.co/api/v2/version-group/9/"
      }
    },
    {
      "flavor_text": "Powers up Grass-type\nmoves in a pinch.",
      "language": {
        "name": "en",
        "url": "https://pokeapi.co/api/v2/language/9/"
      },
      "version_group": {
        "name": "heartgold-soulsilver",
        "url": "https://pokeapi.co/api/v2/version-group/10/"
      }
    },
    {
      "flavor_text": "Booste les capacités\nPlante en cas de besoin.",
      "language": {
        "name": "fr",
        "url": "https://pokeapi.co/api/v2/language/5/"
      },
      "version_group": {
        "name": "black-white",
        "url": "https://pokeapi.co/api/v2/version-group/11/"
      }
    },
    {
      "flavor_text": "Powers up Grass-type\nmoves in a pinch.",
      "language": {
        "name": "en",
        "url": "https://pokeapi.co/api/v2/language/9/"
      },
      "version_group": {
        "name": "black-white",
        "url": "https://pokeapi.co/api/v2/version-group/11/"
      }
    },
    {
      "flavor_text": "Powers up Grass-type\nmoves in a pinch.",
      "language": {
        "name": "en",
        "url": "https://pokeapi.co/api/v2/language/9/"
      },
      "version_group": {
        "name": "black-2-white-2",
        "url": "https://pokeapi.co/api/v2/version-group/14/"
      }
    },
    {
      "flavor_text": "ピンチのとき　くさの\nいりょくが　あがる。",
      "language": {
        "name": "ja-Hrkt",
        "url": "https://pokeapi.co/api/v2/language/1/"
      },
      "version_group": {
        "name": "x-y",
        "url": "https://pokeapi.co/api/v2/version-group/15/"
      }
    },
    {
      "flavor_text": "위급할 때 풀타입의\n위력이 올라간다.",
      "language": {
        "name": "ko",
        "url": "https://pokeapi.co/api/v2/language/3/"
      },
      "version_group": {
        "name": "x-y",
        "url": "https://pokeapi.co/api/v2/version-group/15/"
      }
    },
    {
      "flavor_text": "Booste les capacités Plante en\ncas de besoin.",
      "language": {
        "name": "fr",
        "url": "https://pokeapi.co/api/v2/language/5/"
      },
      "version_group": {
        "name": "x-y",
        "url": "https://pokeapi.co/api/v2/version-group/15/"
      }
    },
    {
      "flavor_text": "Erhöht in Notfällen die Stärke\nvon Pflanzen-Attacken.",
      "language": {
        "name": "de",
        "url": "https://pokeapi.co/api/v2/language/6/"
      },
      "version_group": {
        "name": "x-y",
        "url": "https://pokeapi.co/api/v2/version-group/15/"
      }
    },
    {
      "flavor_text": "Potencia los ataques de tipo\nPlanta en un apuro.",
      "language": {
        "name": "es",
        "url": "https://pokeapi.co/api/v2/language/7/"
      },
      "version_group": {
        "name": "x-y",
        "url": "https://pokeapi.co/api/v2/version-group/15/"
      }
    },
    {
      "flavor_text": "Quando si è in difficoltà, potenzia\nle mosse di tipo Erba.",
      "language": {
        "name": "it",
        "url": "https://pokeapi.co/api/v2/language/8/"
      },
      "version_group": {
        "name": "x-y",
        "url": "https://pokeapi.co/api/v2/version-group/15/"
      }
    },
    {
      "flavor_text": "Powers up Grass-type moves\nwhen the Pokémon is in trouble.",
      "language": {
        "name": "en",
        "url": "https://pokeapi.co/api/v2/language/9/"
      },
      "version_group": {
        "name": "x-y",
        "url": "https://pokeapi.co/api/v2/version-group/15/"
      }
    },
    {
      "flavor_text": "ピンチのとき　くさの\n威力が　あがる。",
      "language": {
        "name": "ja",
        "url": "https://pokeapi.co/api/v2/language/11/"
      },
      "version_group": {
        "name": "x-y",
        "url": "https://pokeapi.co/api/v2/version-group/15/"
      }
    },
    {
      "flavor_text": "ピンチのとき　くさの\nいりょくが　あがる。",
      "language": {
        "name": "ja-Hrkt",
        "url": "https://pokeapi.co/api/v2/language/1/"
      },
      "version_group": {
        "name": "omega-ruby-alpha-sapphire",
        "url": "https://pokeapi.co/api/v2/version-group/16/"
      }
    },
    {
      "flavor_text": "위급할 때 풀타입의\n위력이 올라간다.",
      "language": {
        "name": "ko",
        "url": "https://pokeapi.co/api/v2/language/3/"
      },
      "version_group": {
        "name": "omega-ruby-alpha-sapphire",
        "url": "https://pokeapi.co/api/v2/version-group/16/"
      }
    },
    {
      "flavor_text": "Booste les capacités Plante en\ncas de besoin.",
      "language": {
        "name": "fr",
        "url": "https://pokeapi.co/api/v2/language/5/"
      },
      "version_group": {
        "name": "omega-ruby-alpha-sapphire",
        "url": "https://pokeapi.co/api/v2/version-group/16/"
      }
    },
    {
      "flavor_text": "Erhöht in Notfällen die Stärke\nvon Pflanzen-Attacken.",
      "language": {
        "name": "de",
        "url": "https://pokeapi.co/api/v2/language/6/"
      },
      "version_group": {
        "name": "omega-ruby-alpha-sapphire",
        "url": "https://pokeapi.co/api/v2/version-group/16/"
      }
    },
    {
      "flavor_text": "Potencia los ataques de tipo\nPlanta en un apuro.",
      "language": {
        "name": "es",
        "url": "https://pokeapi.co/api/v2/language/7/"
      },
      "version_group": {
        "name": "omega-ruby-alpha-sapphire",
        "url": "https://pokeapi.co/api/v2/version-group/16/"
      }
    },
    {
      "flavor_text": "Quando si è in difficoltà, potenzia  \nle mosse di tipo Erba.",
      "language": {
        "name": "it",
        "url": "https://pokeapi.co/api/v2/language/8/"
      },
      "version_group": {
        "name": "omega-ruby-alpha-sapphire",
        "url": "https://pokeapi.co/api/v2/version-group/16/"
      }
    },
    {
      "flavor_text": "Powers up Grass-type moves\nwhen the Pokémon is in trouble.",
      "language": {
        "name": "en",
        "url": "https://pokeapi.co/api/v2/language/9/"
      },
      "version_group": {
        "name": "omega-ruby-alpha-sapphire",
        "url": "https://pokeapi.co/api/v2/version-group/16/"
      }
    },
    {
      "flavor_text": "ピンチのとき　くさの\n威力が　あがる。",
      "language": {
        "name": "ja",
        "url": "https://pokeapi.co/api/v2/language/11/"
      },
      "version_group": {
        "name": "omega-ruby-alpha-sapphire",
        "url": "https://pokeapi.co/api/v2/version-group/16/"
      }
    },
    {
      "flavor_text": "ＨＰが　へったとき\nくさタイプの　わざの\nいりょくが　あがる。",
      "language": {
        "name": "ja-Hrkt",
        "url": "https://pokeapi.co/api/v2/language/1/"
      },
      "version_group": {
        "name": "sun-moon",
        "url": "https://pokeapi.co/api/v2/version-group/17/"
      }
    },
    {
      "flavor_text": "HP가 줄었을 때\n풀타입 기술의\n위력이 올라간다.",
      "language": {
        "name": "ko",
        "url": "https://pokeapi.co/api/v2/language/3/"
      },
      "version_group": {
        "name": "sun-moon",
        "url": "https://pokeapi.co/api/v2/version-group/17/"
      }
    },
    {
      "flavor_text": "ＨＰ減少的時候，\n草屬性的招式威力會提高。",
      "language": {
        "name": "zh-Hant",
        "url": "https://pokeapi.co/api/v2/language/4/"
      },
      "version_group": {
        "name": "sun-moon",
        "url": "https://pokeapi.co/api/v2/version-group/17/"
      }
    },
    {
      "flavor_text": "Augmente la puissance des capacités de type Plante\ndu Pokémon quand il a perdu une certaine quantité\nde PV.",
      "language": {
        "name": "fr",
        "url": "https://pokeapi.co/api/v2/language/5/"
      },
      "version_group": {
        "name": "sun-moon",
        "url": "https://pokeapi.co/api/v2/version-group/17/"
      }
    },
    {
      "flavor_text": "Erhöht die Stärke von Pflanzen-Attacken,\nwenn die KP auf einen gewissen Wert fallen.",
      "language": {
        "name": "de",
        "url": "https://pokeapi.co/api/v2/language/6/"
      },
      "version_group": {
        "name": "sun-moon",
        "url": "https://pokeapi.co/api/v2/version-group/17/"
      }
    },
    {
      "flavor_text": "Potencia los movimientos de tipo Planta del Pokémon\ncuando le quedan pocos PS.",
      "language": {
        "name": "es",
        "url": "https://pokeapi.co/api/v2/language/7/"
      },
      "version_group": {
        "name": "sun-moon",
        "url": "https://pokeapi.co/api/v2/version-group/17/"
      }
    },
    {
      "flavor_text": "Quando il Pokémon ha pochi PS, la potenza delle\nsue mosse di tipo Erba aumenta.",
      "language": {
        "name": "it",
        "url": "https://pokeapi.co/api/v2/language/8/"
      },
      "version_group": {
        "name": "sun-moon",
        "url": "https://pokeapi.co/api/v2/version-group/17/"
      }
    },
    {
      "flavor_text": "Powers up Grass-type moves when the Pokémon’s\nHP is low.",
      "language": {
        "name": "en",
        "url": "https://pokeapi.co/api/v2/language/9/"
      },
      "version_group": {
        "name": "sun-moon",
        "url": "https://pokeapi.co/api/v2/version-group/17/"
      }
    },
    {
      "flavor_text": "ＨＰが　減ったとき\nくさタイプの　技の\n威力が　上がる。",
      "language": {
        "name": "ja",
        "url": "https://pokeapi.co/api/v2/language/11/"
      },
      "version_group": {
        "name": "sun-moon",
        "url": "https://pokeapi.co/api/v2/version-group/17/"
      }
    },
    {
      "flavor_text": "ＨＰ减少的时候，\n草属性的招式威力会提高。",
      "language": {
        "name": "zh-Hans",
        "url": "https://pokeapi.co/api/v2/language/12/"
      },
      "version_group": {
        "name": "sun-moon",
        "url": "https://pokeapi.co/api/v2/version-group/17/"
      }
    },
    {
      "flavor_text": "ＨＰが　へったとき\nくさタイプの　わざの\nいりょくが　あがる。",
      "language": {
        "name": "ja-Hrkt",
        "url": "https://pokeapi.co/api/v2/language/1/"
      },
      "version_group": {
        "name": "ultra-sun-ultra-moon",
        "url": "https://pokeapi.co/api/v2/version-group/18/"
      }
    },
    {
      "flavor_text": "HP가 줄었을 때\n풀타입 기술의\n위력이 올라간다.",
      "language": {
        "name": "ko",
        "url": "https://pokeapi.co/api/v2/language/3/"
      },
      "version_group": {
        "name": "ultra-sun-ultra-moon",
        "url": "https://pokeapi.co/api/v2/version-group/18/"
      }
    },
    {
      "flavor_text": "ＨＰ減少的時候，\n草屬性的招式威力會提高。",
      "language": {
        "name": "zh-Hant",
        "url": "https://pokeapi.co/api/v2/language/4/"
      },
      "version_group": {
        "name": "ultra-sun-ultra-moon",
        "url": "https://pokeapi.co/api/v2/version-group/18/"
      }
    },
    {
      "flavor_text": "Augmente la puissance des capacités de type Plante\ndu Pokémon quand il a perdu une certaine quantité\nde PV.",
      "language": {
        "name": "fr",
        "url": "https://pokeapi.co/api/v2/language/5/"
      },
      "version_group": {
        "name": "ultra-sun-ultra-moon",
        "url": "https://pokeapi.co/api/v2/version-group/18/"
      }
    },
    {
      "flavor_text": "Erhöht die Stärke von Pflanzen-Attacken,\nwenn die KP auf einen gewissen Wert fallen.",
      "language": {
        "name": "de",
        "url": "https://pokeapi.co/api/v2/language/6/"
      },
      "version_group": {
        "name": "ultra-sun-ultra-moon",
        "url": "https://pokeapi.co/api/v2/version-group/18/"
      }
    },
    {
      "flavor_text": "Potencia los movimientos de tipo Planta del Pokémon\ncuando le quedan pocos PS.",
      "language": {
        "name": "es",
        "url": "https://pokeapi.co/api/v2/language/7/"
      },
      "version_group": {
        "name": "ultra-sun-ultra-moon",
        "url": "https://pokeapi.co/api/v2/version-group/18/"
      }
    },
    {
      "flavor_text": "Quando il Pokémon ha pochi PS, la potenza delle\nsue mosse di tipo Erba aumenta.",
      "language": {
        "name": "it",
        "url": "https://pokeapi.co/api/v2/language/8/"
      },
      "version_group": {
        "name": "ultra-sun-ultra-moon",
        "url": "https://pokeapi.co/api/v2/version-group/18/"
      }
    },
    {
      "flavor_text": "Powers up Grass-type moves when the Pokémon’s\nHP is low.",
      "language": {
        "name": "en",
        "url": "https://pokeapi.co/api/v2/language/9/"
      },
      "version_group": {
        "name": "ultra-sun-ultra-moon",
        "url": "https://pokeapi.co/api/v2/version-group/18/"
      }
    },
    {
      "flavor_text": "ＨＰが　減ったとき\nくさタイプの　技の\n威力が　上がる。",
      "language": {
        "name": "ja",
        "url": "https://pokeapi.co/api/v2/language/11/"
      },
      "version_group": {
        "name": "ultra-sun-ultra-moon",
        "url": "https://pokeapi.co/api/v2/version-group/18/"
      }
    },
    {
      "flavor_text": "ＨＰ减少的时候，\n草属性的招式威力会提高。",
      "language": {
        "name": "zh-Hans",
        "url": "https://pokeapi.co/api/v2/language/12/"
      },
      "version_group": {
        "name": "ultra-sun-ultra-moon",
        "url": "https://pokeapi.co/api/v2/version-group/18/"
      }
    }
  ],
  "generation": {
    "name": "generation-iii",
    "url": "https://pokeapi.co/api/v2/generation/3/"
  },
  "id": 65,
  "is_main_series": true,
  "name": "overgrow",
  "names": [
    {
      "language": {
        "name": "ja-Hrkt",
        "url": "https://pokeapi.co/api/v2/language/1/"
      },
      "name": "しんりょく"
    },
    {
      "language": {
        "name": "ko",
        "url": "https://pokeapi.co/api/v2/language/3/"
      },
      "name": "심록"
    },
    {
      "language": {
        "name": "zh-Hant",
        "url": "https://pokeapi.co/api/v2/language/4/"
      },
      "name": "茂盛"
    },
    {
      "language": {
        "name": "fr",
        "url": "https://pokeapi.co/api/v2/language/5/"
      },
      "name": "Engrais"
    },
    {
      "language": {
        "name": "de",
        "url": "https://pokeapi.co/api/v2/language/6/"
      },
      "name": "Notdünger"
    },
    {
      "language": {
        "name": "es",
        "url": "https://pokeapi.co/api/v2/language/7/"
      },
      "name": "Espesura"
    },
    {
      "language": {
        "name": "it",
        "url": "https://pokeapi.co/api/v2/language/8/"
      },
      "name": "Erbaiuto"
    },
    {
      "language": {
        "name": "en",
        "url": "https://pokeapi.co/api/v2/language/9/"
      },
      "name": "Overgrow"
    },
    {
      "language": {
        "name": "ja",
        "url": "https://pokeapi.co/api/v2/language/11/"
      },
      "name": "しんりょく"
    },
    {
      "language": {
        "name": "zh-Hans",
        "url": "https://pokeapi.co/api/v2/language/12/"
      },
      "name": "茂盛"
    }
  ],
  "pokemon": [
    {
      "is_hidden": false,
      "pokemon": {
        "name": "bulbasaur",
        "url": "https://pokeapi.co/api/v2/pokemon/1/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "ivysaur",
        "url": "https://pokeapi.co/api/v2/pokemon/2/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "venusaur",
        "url": "https://pokeapi.co/api/v2/pokemon/3/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "chikorita",
        "url": "https://pokeapi.co/api/v2/pokemon/152/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "bayleef",
        "url": "https://pokeapi.co/api/v2/pokemon/153/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "meganium",
        "url": "https://pokeapi.co/api/v2/pokemon/154/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "treecko",
        "url": "https://pokeapi.co/api/v2/pokemon/252/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "grovyle",
        "url": "https://pokeapi.co/api/v2/pokemon/253/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "sceptile",
        "url": "https://pokeapi.co/api/v2/pokemon/254/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "turtwig",
        "url": "https://pokeapi.co/api/v2/pokemon/387/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "grotle",
        "url": "https://pokeapi.co/api/v2/pokemon/388/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "torterra",
        "url": "https://pokeapi.co/api/v2/pokemon/389/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "snivy",
        "url": "https://pokeapi.co/api/v2/pokemon/495/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "servine",
        "url": "https://pokeapi.co/api/v2/pokemon/496/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "serperior",
        "url": "https://pokeapi.co/api/v2/pokemon/497/"
      },
      "slot": 1
    },
    {
      "is_hidden": true,
      "pokemon": {
        "name": "pansage",
        "url": "https://pokeapi.co/api/v2/pokemon/511/"
      },
      "slot": 3
    },
    {
      "is_hidden": true,
      "pokemon": {
        "name": "simisage",
        "url": "https://pokeapi.co/api/v2/pokemon/512/"
      },
      "slot": 3
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "chespin",
        "url": "https://pokeapi.co/api/v2/pokemon/650/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "quilladin",
        "url": "https://pokeapi.co/api/v2/pokemon/651/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "chesnaught",
        "url": "https://pokeapi.co/api/v2/pokemon/652/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "rowlet",
        "url": "https://pokeapi.co/api/v2/pokemon/722/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "dartrix",
        "url": "https://pokeapi.co/api/v2/pokemon/723/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "decidueye",
        "url": "https://pokeapi.co/api/v2/pokemon/724/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "grookey",
        "url": "https://pokeapi.co/api/v2/pokemon/810/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "thwackey",
        "url": "https://pokeapi.co/api/v2/pokemon/811/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "rillaboom",
        "url": "https://pokeapi.co/api/v2/pokemon/812/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "venusaur-gmax",
        "url": "https://pokeapi.co/api/v2/pokemon/10186/"
      },
      "slot": 1
    },
    {
      "is_hidden": false,
      "pokemon": {
        "name": "rillaboom-gmax",
        "url": "https://pokeapi.co/api/v2/pokemon/10200/"
      },
      "slot": 1
    }
  ]
}
''');
