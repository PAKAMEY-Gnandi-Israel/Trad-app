
import 'dart:ffi';

import 'package:miagbo/models/trad.dart';

class Exp {
   int id;
   int cat;
List<Trad> exp;

  Exp({
    this.id,
    this.cat,
    this.exp
  });
   Exp.fromJson(Map<dynamic, dynamic> parsedJson) {
    id= parsedJson['id'];
    cat= parsedJson['cat'];
    List <dynamic> temporaryExp = parsedJson['exp'];
    print(temporaryExp);
exp = [];
 temporaryExp.forEach( (element) {

exp.add(Trad.fromJson(element));


  }
  );
   }
  
}