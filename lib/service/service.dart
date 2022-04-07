 import 'dart:convert';

import 'package:miagbo/models/trad.dart';
import 'package:http/http.dart' as http;
import 'package:miagbo/models/traduction.dart';
class Services{
   var url = "https://traduction.getsandbox.com";
Future <List<Trad>> getTrad() async{

    
    final response = await http.get(Uri.parse('$url/trads'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
      
        });
    

    if (response.statusCode == 200) {
 
        List jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      
       return jsonResponse.map((data) => new Trad.fromJson(data)).toList();
       
    }else
    {

// If that call was not successful, throw an error.
      throw Exception('Impossible de charger vos informations');

    }
  }
  Future <List<Traduction>> getCat() async{
    
      print('a');
    final response = await http.get(Uri.parse('$url/cat'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
      
        });
      print('$url/cat');
    if (response.statusCode == 200) {
  print('b');
        List jsonResponse = json.decode(utf8.decode(response.bodyBytes));
        return jsonResponse.map((data) => new Traduction.fromJson(data)).toList();
       
    }else
    {
       print('C Error');

// If that call was not successful, throw an error.
      throw Exception('Impossible de charger vos informations');

    }
  }
 
}
