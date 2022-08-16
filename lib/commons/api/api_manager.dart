import 'package:movies_app/commons/utils/utils.dart';

import 'api.dart';

class APIManager {
  Future<dynamic> getAPICall(
    String url, {
    Map<String, String>? headers,
    Duration timeLimit = const Duration(seconds: 10),
  }) async {
    dynamic responseJson;
    String errorConnecting =
        'Hubo un problema al conectarse al servidor. Inténtalo de nuevo.';
    try {
      bool hasNetwork = await Utils.hasNetwork();
      if (!hasNetwork) {
        throw FetchDataException('"$errorConnecting"');
      }

      final request = await get(Uri.parse(url), headers: headers).timeout(
        timeLimit,
        onTimeout: () {
          throw FetchDataException('"$errorConnecting"');
        },
      );
      responseJson = _response(request);
    } on SocketException {
      throw FetchDataException('"$errorConnecting"');
    }
    return responseJson;
  }

  _response(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            '"Ocurrió un error durante la comunicación con el servidor con el código de estado: ${response.statusCode}"');
    }
  }
}
