import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduler_demo/schedule_page.dart';
import 'package:scheduler_demo/store.dart';

class Home_Page extends StatefulWidget {
  final String title;
  const Home_Page({Key? key, required this.title}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Consumer<Store>(
          builder: (context, st, child){
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 10,),
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Hi Jose you are available in "+st.scheduled.toString().replaceAll("SUN", "Sunday").
                      replaceAll("MON", "Monday").replaceAll("TUE", "Tuesday").replaceAll("THU", "Thursday").
                      replaceAll("FRI", "Friday").replaceAll("SAT", "Saturday").replaceAll("[", "").replaceAll("]", "").
                      trim()),
                    ),

                MaterialButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute( builder: (context) =>SchedulePage(title: widget.title)));
                },
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),),
                  color: Colors.blue,
                  child: Text((st.scheduled.isEmpty)?"Add Schedule":"Edit Schedule",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                )

              ],
            );
          },
        ),
      ),
    );
  }
}
