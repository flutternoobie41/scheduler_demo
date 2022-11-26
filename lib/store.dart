
import 'package:flutter/cupertino.dart';

class Store extends ChangeNotifier{
  List Stored = []; //to store value
  List scheduled = []; //to display value
  updatesheduled(List values){
    Stored = values;
    scheduled = [];
    var regExp = new RegExp(r"\w+(\'\w+)?");
    values.forEach((element) {
      if(element!="null"){
      int wordCount = regExp.allMatches(element.toString()).length;
      print(wordCount.toString()+"counts");
      if(wordCount>1){
        if(wordCount<4)
        scheduled.add(element);
        else
          scheduled.add(element.toString().substring(0,3)+" whole day");
      }
      }
    });
    print(scheduled);
  //  scheduled = values;
    notifyListeners();
  }
}