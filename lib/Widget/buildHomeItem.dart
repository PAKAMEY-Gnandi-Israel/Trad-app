  import 'package:flutter/material.dart';
import 'package:miagbo/models/trad.dart';

class BuildHomeItem extends StatelessWidget {
 final Trad trad;
BuildHomeItem(this.trad);
  @override
  Widget build(BuildContext context) {
     return Padding(
         padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
      child: Container(
        height: 90.0,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Color(0xffB0E0F7).withOpacity(0.1),
                offset: Offset(12, 12),
                blurRadius: 24.0,
              
              ),
               BoxShadow(
                color: Color(0xffF8FBFD),
                offset: Offset(-12, -12),
                blurRadius: 24.0,
              
              )
            ]),
            child: Stack(
               alignment: Alignment.centerLeft,
              children: [
Padding(
  padding: EdgeInsets.only(left: 20.0,top: 20.0),
  child:   Column(
  
    crossAxisAlignment: CrossAxisAlignment.start,
  
    children: [
  
      Text(trad.fr,
  
       style: 
  
       TextStyle(
  
      fontWeight: FontWeight.bold,
  
        fontSize: 15.0,
  
             ),
  
      overflow: TextOverflow.ellipsis,
  
      ),
  
      SizedBox(height: 10,),
  
      Text(trad.ewe,
  
      style: TextStyle(fontSize: 13,
  
      )
  
      )
  
  
  
    ],
  
  ),
)

              ],
              
              ),
      ),
      );
  }
}
