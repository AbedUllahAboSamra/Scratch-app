
import 'package:http/http.dart' as http;

class HttpClass{



  Future<http.Response> fetchAlbum() {
    return http.get(Uri.parse(''));
  }












}