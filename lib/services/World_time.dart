import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String  location; //location name for UI
  late String time; //time in that lacation
  late String flag; //url to the asset flag icon
  late String url; //lcation url for API end point
   late bool isDayTime  ;
  //constrater
  WorldTime({required this.location,required this.flag,required this.url});

  Future <void> getTime() async {

    try{
      //Time request zone
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url')); //Asia/Kolkata
      Map data= jsonDecode(response.body);
      //print(data);

      //get data time and offset
      String datatime= data['datetime'];
      String offset=data['utc_offset'];
       String off=offset.substring(1,3);


      DateTime now= DateTime.parse(datatime);
      now = now.add(Duration(hours: int.parse(off)));
      //set the time property
      isDayTime = now.hour >6 && now.hour<20 ? true : false;
      time = DateFormat.jm().format(now);

    }

    catch(e){
      print('caught error $e');
      time="could not Loading data";
    }



  }

}
