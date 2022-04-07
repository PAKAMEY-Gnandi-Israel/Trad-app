import 'package:miagbo/models/trad.dart';
import 'package:miagbo/models/traduction.dart';
import 'package:miagbo/service/service.dart';

class Repository {
  Services appApiProvider = Services();



  Future <List<Trad>> fetchTrad() => appApiProvider.getTrad();
    Future <List<Traduction>> fetchCat() => appApiProvider.getCat();
 


}