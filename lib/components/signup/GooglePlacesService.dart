import 'dart:convert';
import 'package:http/http.dart' as http;

class GooglePlacesService{

  final String apiKey="AIzaSyA56YKW6VDfc0BBGdH80zxN2JY6R5nrgZk";

  Future<Map<String, dynamic>?> getPlacesDetails(String placeId) async{
    final url="https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey";

    final response= await http.get(Uri.parse(url));

    if(response.statusCode==200){
      final data=json.decode(response.body);

      if(data['status']=="OK"){
        return data["result"];
      }
      
    }

    return null;
  }

}