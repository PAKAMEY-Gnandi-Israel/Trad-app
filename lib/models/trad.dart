
import 'dart:ffi';

class Trad {
   String fr;
   String ewe;
 

  Trad({
    this.fr,
    this.ewe,

  });
   Trad.fromJson(Map<dynamic, dynamic> parsedJson) {
    fr= parsedJson['fr'];
    ewe= parsedJson['ewe'];
  }
}