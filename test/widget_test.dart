import 'package:get/get.dart';
import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse("https://api.rajaongkir.com/starter/cost");
  final Response = await http.post(
    url,
    body: {
      "origin": "501",
      "destination": "114",
      "weight": "1700",
      "courir": "jne"
    },
    headers: {
      "key": "428084606cd44a1724aaf7b2c83de401",
      "content-type": "application/x-www-form-urlencoded",
    },
  );
}
