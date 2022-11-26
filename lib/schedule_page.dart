import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduler_demo/store.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  List weeks =["SUN","MON","TUE","WED","THU","FRI","SAT"];
  List day = ["Morning","Afternoon","Evening"];
  List choosen = ["null","null","null","null","null","null","null"];

  @override
  void initState() {
    // TODO: implement initState
    if(Provider.of<Store>(context, listen: false).Stored.toString()!='[]')
      choosen = Provider.of<Store>(context, listen: false).Stored;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:Container(
        child: Column(
          children: [
            Text("set your weekly hours",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
            ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: weeks.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){
                        setState(() {
                          if(!choosen[index].toString().contains(weeks[index]))
                            choosen[index]=weeks[index];
                          else
                            choosen[index]="null";
                        });
                        print(choosen);
                      },
                          icon: Icon(Icons.verified_rounded,
                            color: (choosen[index].toString().contains(weeks[index]))?Colors.green:Colors.grey,
                            size: 28,)),
                      Text(weeks[index],style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,),
                      (choosen[index].toString().contains(weeks[index]))?
                      Container(
                        height: 50,
                        width:300,
                        child: ListView.builder(

                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: day.length,
                            itemBuilder: (context,index2){
                              return Row(
                                children: [
                                  MaterialButton(

                                      shape:RoundedRectangleBorder(
                                          side:
                                          BorderSide(color: ((!choosen[index].toString().contains(day[index2])))?
                                          Colors.grey:
                                          Colors.blue),
                                          borderRadius:
                                          BorderRadius.circular(10)
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if(!choosen[index].toString().contains(day[index2]))
                                            choosen[index]=choosen[index].toString()+" "+day[index2];
                                          else
                                            choosen[index] = choosen[index].toString().replaceFirst(day[index2], "").trim();
                                        });
                                        print(choosen);
                                      },
                                      child: Text(day[index2],style: TextStyle(color: ((!choosen[index].toString().contains(day[index2])))?
                                      Colors.grey:
                                      Colors.blue),)),
                                  SizedBox(width: 10,)
                                ],
                              );
                            }),
                      ):Text("Unavailable")
                    ],

                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) {
              return Divider(color: Colors.grey,);
            },
            ),
            MaterialButton(onPressed: (){
              //  setState(() {
              Provider.of<Store>(context, listen: false).updatesheduled(choosen);
              Navigator.pop(context);
              //  });
            },
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),),
              color: Colors.blue,
              child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
            )
          ],
        ),
      ),

    );
  }
}
