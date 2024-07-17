import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home:  MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
    const MyHomePage ({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   bool tog=true;
   bool start=false;
   int count=0;
   bool tmp=true;
   String output="Let Start the Game";
   Map bt={0:{"user":"0","img":"empty"},1:{"user":"0","img":"empty"}, 2:{"user":"0","img":"empty"},
    3:{"user":"0","img":"empty"},4:{"user":"0","img":"empty"},5:{"user":"0","img":"empty"},
    6:{"user":"0","img":"empty"},7:{"user":"0","img":"empty"},8:{"user":"0","img":"empty"},};

   void set_def(){
    bt={0:{"user":"0","img":"empty"},1:{"user":"0","img":"empty"}, 2:{"user":"0","img":"empty"},
      3:{"user":"0","img":"empty"},4:{"user":"0","img":"empty"},5:{"user":"0","img":"empty"},
      6:{"user":"0","img":"empty"},7:{"user":"0","img":"empty"},8:{"user":"0","img":"empty"},};

   }
   check(int a , int b , int c ){
       if(tmp){
         if((bt[a]["user"]==bt[b]["user"] && bt[a]["user"]==bt[c]["user"])&&bt[a]["user"]!="0"){
           setState(() {
               output="Winner is : ${bt[a]["user"]}";
               start=false;
               tmp=false;
           });
         }

       }
   }
    btnclick (int id ){
      if(start && bt[id]["user"]=="0"){

        //  user game input logic
        if (tog){
          bt[id]["img"]="cross";
          bt[id]["user"]="x";
          tog=false;
        }
        else{
          bt[id]["img"]="zero";
          bt[id]["user"]="O";
          tog=true;
        }
        // game win and loose logic

        // horizontal check
        check(0, 1, 2);
        check(3, 4, 5);
        check(6, 7, 8);

        // vertical check
        check(0, 3, 6);
        check(1, 4, 7);
        check(2, 5, 8);
        // diagonal check
        check(0, 4, 8);
        check(2, 4, 6);

      }
    }
    @override

    Widget build (BuildContext context){
        return  Center(
          child: Container(
               margin: EdgeInsets.all(10),
               padding: EdgeInsets.all(10),
               width: 500,
            child: Scaffold(
                  appBar: AppBar(
                     title: const  Text("Tic Tac Toe",
                       style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                       ),
                     ),
                     backgroundColor: Colors.blue,
                  ),

                 // background image of the app
                  body: Container(

                      decoration: const  BoxDecoration(
                         image: DecorationImage(image: AssetImage("assets/floor.jpg"),fit: BoxFit.cover),

                      ),

                      //  game board image
                     child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [

                              //result window
                            Expanded(child: Container(),),
                            Container(
                             height: 70,
                             width: double.infinity,
                             alignment: Alignment.center,
                             margin: const EdgeInsets.fromLTRB(25, 30, 25, 30),
                             decoration: BoxDecoration(
                               boxShadow: const [BoxShadow(
                                 color: Colors.black26,
                                 spreadRadius: 8,
                                 blurRadius: 15,
                                 offset: Offset(10,10),
                               )],
                               borderRadius: BorderRadius.circular(50),
                               image: const DecorationImage(image: AssetImage("assets/bar.jpg"),fit: BoxFit.fill),

                             ),
                             child: Text(output,style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                           ),
                              Expanded(child: Container(),),
                              // game board
                              Container(
                               height: 350,
                               width: 350,
                               margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                               padding: const EdgeInsets.all(10),
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(50),
                                 image: const DecorationImage(image: AssetImage("assets/table1.png"),fit: BoxFit.fill),
                                 boxShadow: const [BoxShadow(
                                   color: Colors.black26,
                                   spreadRadius: 8,
                                   blurRadius: 15,
                                   offset: Offset(10,10),
                                 )],
                               ),
                               child: Center(
                                 child:GridView.builder(
                                   gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
                                       crossAxisCount: 3,
                                       mainAxisSpacing: 10,

                                       crossAxisSpacing: 10
                                   ),
                                   itemBuilder: (context , index){
                                     return GestureDetector(onTap: (){

                                       setState(() {
                                         btnclick(index);
                                       });
                                     },
                                       child: Container(
                                         height: 90,
                                         width: 90,
                                         decoration:  BoxDecoration(
                                             image: DecorationImage(image: AssetImage("assets/${bt[index]["img"]}.png"))
                                         ),
                                       ) ,
                                     );
                                   },itemCount: 9,),
                               )
                           ),
                              Expanded(child: Container(),),
                              // control buttons
                              Container(
                             height: 70,
                             width: double.infinity,
                             margin: const EdgeInsets.fromLTRB(25, 30, 25, 30),
                             decoration: BoxDecoration(
                               boxShadow: const [BoxShadow(
                                 color: Colors.black26,
                                 spreadRadius: 8,
                                 blurRadius: 15,
                                 offset: Offset(10,10),
                               )],
                               borderRadius: BorderRadius.circular(50),
                               image: const DecorationImage(image: AssetImage("assets/bar.jpg"),fit: BoxFit.fill),
                             ),

                             child: Row (
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Start button

                                  Expanded(
                                    child: TextButton(

                                      onPressed: (){
                                        setState(() {
                                          output="Game Started";
                                          start=true;
                                          tog=true;
                                          tmp=true;
                                        });
                                      },
                                      child: const Text("Start",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.red,)),
                                    ),
                                  ),

                                  // reset button
                                  Expanded(
                                    child: TextButton(
                                      onPressed: (){
                                        setState(() {
                                          output="Let Start the Game";
                                          start=false;
                                          set_def();
                                        });
                                      },
                                      child: const Text("Reset",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
                                    ),
                                  ),

                                ],
                             )
                           ),
                              Expanded(child: Container(),),
                         ],
                     )

                     ),
                  ),
          ),
        );
    }
}













