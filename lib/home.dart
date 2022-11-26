import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduler_demo/schedule_page.dart';
import 'package:scheduler_demo/store.dart';

class Landing_Page extends StatefulWidget {
  final String title;
  const Landing_Page({Key? key, required this.title}) : super(key: key);

  @override
  State<Landing_Page> createState() => _Landing_PageState();
}

class _Landing_PageState extends State<Landing_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 10,),
            Consumer<Store>(
              builder: (context, st, child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hi Jose you are available in "+st.scheduled.toString().replaceAll("SUN", "Sunday").
                      replaceAll("MON", "Monday").replaceAll("TUE", "Tuesday").replaceAll("THU", "Thursday").
                      replaceAll("FRI", "Friday").replaceAll("SAT", "Saturday").replaceAll("[", "").replaceAll("]", "").
                  trim()),
                );
              },
            //    child: Text(Provider.of<Store>(context, listen: false).scheduled.toString())
            ),
            MaterialButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute( builder: (context) =>SchedulePage(title: widget.title)));
            },
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),),
              color: Colors.blue,
              child: Text("Schedule",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
            )

          ],
        ),
      ),
    );
  }
}
