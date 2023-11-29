import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class MacrosCall {
  static Future<ApiCallResponse> call({
    String? foodname = '',
    String? brand = '',
    String? category = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Macros',
      apiUrl: 'https://api.edamam.com/api/food-database/v2/parser',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer bc8c17d9d561592196d553ecf162d20d',
      },
      params: {
        'app_id': "5ca95bf3",
        'app_key': "bc8c17d9d561592196d553ecf162d20d",
        'ingr': foodname,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic food(dynamic response) => getJsonField(
        response,
        r'''$.parsed[:].food.label''',
      );
  static dynamic calories(dynamic response) => getJsonField(
        response,
        r'''$.parsed[:].food.nutrients.ENERC_KCAL''',
      );
  static dynamic protein(dynamic response) => getJsonField(
        response,
        r'''$.parsed[:].food.nutrients.PROCNT''',
      );
  static dynamic fats(dynamic response) => getJsonField(
        response,
        r'''$.parsed[:].food.nutrients.FAT''',
      );
  static dynamic carbs(dynamic response) => getJsonField(
        response,
        r'''$.parsed[:].food.nutrients.CHOCDF''',
      );
  static dynamic image(dynamic response) => getJsonField(
        response,
        r'''$.parsed[:].food.image''',
      );
  static dynamic quantity(dynamic response) => getJsonField(
        response,
        r'''$.parsed[:].quantity''',
      );
  static dynamic weight(dynamic response) => getJsonField(
        response,
        r'''$.parsed[:].measure.weight''',
      );
  static dynamic serving(dynamic response) => getJsonField(
        response,
        r'''$.parsed[:].measure.label''',
      );
  static dynamic servinglist(dynamic response) => getJsonField(
        response,
        r'''$.hints[:].measures[:].label''',
        true,
      );
  static dynamic weightlist(dynamic response) => getJsonField(
        response,
        r'''$.hints[:].measures[:].weight''',
        true,
      );
  static dynamic carbList(dynamic response) => getJsonField(
        response,
        r'''$.hints[:].food.nutrients.CHOCDF''',
        true,
      );
  static dynamic fatList(dynamic response) => getJsonField(
        response,
        r'''$.hints[:].food.nutrients.FAT''',
        true,
      );
  static dynamic proteinList(dynamic response) => getJsonField(
        response,
        r'''$.hints[:].food.nutrients.PROCNT''',
        true,
      );
  static dynamic kcalList(dynamic response) => getJsonField(
        response,
        r'''$.hints[:].food.nutrients.ENERC_KCAL''',
        true,
      );
  static dynamic nameList(dynamic response) => getJsonField(
        response,
        r'''$.hints[:].food.label''',
        true,
      );
}

class WorkoutsCall {
  static Future<ApiCallResponse> call({
    String? muscle = '',
    String? difficulty = '',
    String? type = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Workouts',
      apiUrl: 'https://api.api-ninjas.com/v1/exercises',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer iUE+ceYF8wCQr6DQZYHr3A==TX3oh4qjF56l6a8D',
        'X-Api-Key': 'iUE+ceYF8wCQr6DQZYHr3A==TX3oh4qjF56l6a8D',
      },
      params: {
        'type': type,
        'muscle': muscle,
        'difficulty': difficulty,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic muscleJSON(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
  static dynamic muscletype(dynamic response) => getJsonField(
        response,
        r'''$[:].type''',
        true,
      );
  static dynamic musclemuscle(dynamic response) => getJsonField(
        response,
        r'''$[:].muscle''',
        true,
      );
  static dynamic musclename(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
        true,
      );
  static dynamic muscleequipment(dynamic response) => getJsonField(
        response,
        r'''$[:].equipment''',
        true,
      );
  static dynamic muscledifficulties(dynamic response) => getJsonField(
        response,
        r'''$[:].difficulty''',
        true,
      );
  static dynamic muscleinstructions(dynamic response) => getJsonField(
        response,
        r'''$[:].instructions''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
