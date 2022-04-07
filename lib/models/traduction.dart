
import 'dart:ffi';

import 'package:miagbo/models/trad.dart';

class Traduction {
  int id ;
   String cat;


  Traduction({
    this.id,
    this.cat
    
  });
   Traduction.fromJson(Map<dynamic, dynamic> parsedJson) {
     id= parsedJson['id'];
    cat= parsedJson['cat'];

  }
}