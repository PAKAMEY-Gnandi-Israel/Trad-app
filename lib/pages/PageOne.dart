import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:miagbo/Widget/buildHomeItem.dart';
import 'package:miagbo/data/data.dart';
import 'package:miagbo/models/exp.dart';
import 'package:miagbo/models/trad.dart';
import 'package:miagbo/models/traduction.dart';
import 'package:miagbo/service/repository.dart';

class PageOne extends StatefulWidget {
  const PageOne({ Key key }) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> with TickerProviderStateMixin{
  Repository rep = Repository();
  Color primary = Color(0xff6462DC);
  int id;
  int init=0;
   Future <List<Trad>> futureData;
    Future <List<Traduction>> futureCat;
    Future <List<Trad>> futureExp;
      var url = "https://traduction.getsandbox.com";
    List<Trad> _generalWidgets =  List<Trad>.empty();
       Future <Exp> getExp(int id) async{
    
    final response = await http.get(Uri.parse('https://traduction.getsandbox.com/trads?cat=$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
      
        });

    if (response.statusCode == 200) {
 
        final jsonResponse = json.decode(utf8.decode(response.bodyBytes))[0];
      
return  Exp.fromJson(jsonResponse);

     
    }else
    {

// If that call was not successful, throw an error.
      throw Exception('Impossible de charger vos informations');

    }
  }
  @override
    void initState() {
    GlobalKey<ScaffoldState> _scaffoldKey;
    super.initState();
    futureData = rep.fetchTrad();
    futureCat = rep.fetchCat();
  id=1;
  
  
  }
  Widget build(BuildContext context) {
    return FutureBuilder <List<Traduction>>(
           future:futureCat,
          builder:  (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                   List<Traduction> data = snapshot.data;
                  
            
                   
                   
      return  Scaffold(
        backgroundColor: Color(0xffEBF3FF),
        appBar: PreferredSize(
           preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color(0xffD0E0F7),
                  offset: Offset(0, 12),
                  blurRadius: 20.0,
                )
              ]),
            child: AppBar(
backgroundColor: Color(0xffEBF3FF),
 elevation: 15.0,
 bottom: TabBar(
   controller: new TabController( initialIndex: init, vsync: this, length: data.length),
                isScrollable: true,
                labelColor: Color(0xff332FD0),
                unselectedLabelColor:Color(0xff6F728D),
                indicatorColor: Color(0xffEC6881),
             overlayColor:MaterialStateProperty.all(primary),
                indicatorWeight: 6.0, 
                 onTap: (index){
                   setState(() { 
  init=index;
    if (index < data.length) {
      id = data[index].id;
      print(' id est $id');
         
    }      }
              );
                },
                tabs: List<Widget>.generate(data.length, (int index){

print('enter 1');
                          return new Tab(text: data[index].cat,
                        );

                        }),
 
              ),
            ),
          ),
        ),
        
        body:  (id!=null || id!=0) ? (FutureBuilder <Exp>(
           future:getExp(id),
          builder:  (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
         Exp data = snapshot.data;
          print('enter 2');
print(data.exp) ;
                  return  Container(
            margin: EdgeInsets.only(top: 0.0),
            child: ListView.builder( 
               physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index ) {
                if (data!=null) {
              List <Trad> tr =data.exp;
                  print(tr) ;
                   print('a');
                  return BuildHomeItem(tr[index]);
                }
                return SizedBox(
                  height: 300.0,
                );
              },
              itemCount: trad.length ,
            ),
          );
        
           } else if (snapshot.hasError) {
              print('b00');
                  return Text(snapshot.error.toString());
                  
                }
                print(snapshot.hasData.toString());
                return Center(child: CircularProgressIndicator());
              })) :  Center(child: CircularProgressIndicator())
      );
      
           } else if (snapshot.hasError) {
              print('b2');
                  return Text(snapshot.error.toString());
                  
                }
                print(snapshot.hasData.toString());
                return Center(child: CircularProgressIndicator());
              });
    
  }
}
