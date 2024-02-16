import 'package:e_utilization/map/WMSLayer.dart';
import 'package:e_utilization/map/WMSLayerDemo.dart';
import 'package:e_utilization/map/WMSLayerMarker.dart';
import 'package:e_utilization/map/myMapPage.dart';
import 'package:e_utilization/screens/EUCGFRForm.dart';
import 'package:e_utilization/screens/ReportScreen.dart';
import 'package:flutter/material.dart';


class ImageData {
  final String imagePath;
  final String name;
  final String description;
final IconData icon;
  ImageData({
    required this.imagePath,
    required this.name,
    required this.description,
  required this.icon});
}




class DashboardScreen extends StatefulWidget
{
  @override
   /*State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();*/

  State<DashboardScreen> createState() => DashboardScreenState();


}
class DashboardScreenState extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
/*   return Scaffold(
     appBar: AppBar(backgroundColor:Colors.red.withOpacity(0.8),title: Center(child: Text("Dashboard")),),*/
    /*body:Container(
      // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),

       child: GridView.count(
         crossAxisCount: 1,
         padding: EdgeInsets.all(3.0),
         children: <Widget>[
           makeDashboardItem("View E-UC Submitted By Agency Maker",Image.asset('assets/images/view_submitted_uc_file.png', width: 40, height: 40)),
           makeDashboardItem("View Rejected Entries",Image.asset('assets/images/view_submitted_uc_file.png', width: 40, height: 40)),
           makeDashboardItem("View Submitted UC",Image.asset('assets/images/view_submitted_uc_file.png', width: 40, height: 40)),
           makeDashboardItem("Reports",Image.asset('assets/images/view_submitted_uc_file.png', width: 40, height: 40)),
           */ /*makeDashboardItem("Alphabet", Icons.alarm),
           makeDashboardItem("Alphabet", Icons.alarm),
           makeDashboardItem("Alphabet", Icons.alarm),
           makeDashboardItem("Alphabet", Icons.alarm),
           makeDashboardItem("Alphabet", Icons.alarm),
           makeDashboardItem("Alphabet", Icons.alarm)*/ /*
         ],
       ),
     ),
*/

    final titles = [
      'View E-UC Submitted By Agency Maker',
      'View Rejected Entries',
      'View Submitted UC',
      'Reports'
    ];
    //  final imageData = imageDataList[index];
    final List icons = [
      Image.asset('assets/images/view_submitted_uc_file.png'),
      Image.asset("assets/images/view_submitted_uc_file.png"),
      Image.asset('assets/images/view_submitted_uc_file.png'),
      Image.asset('assets/images/view_submitted_uc_file.png'),
    ];
    List colors = [Colors.red, Colors.yellow, Colors.blue, Colors.green];

    List<ImageData> imageDataList = [
      ImageData(
          imagePath: "assets/images/view_submitted_uc_file.png",
          name: "View E-UC Submitted By Agency Maker",
          description: "This is the first image.",
          icon: Icons.arrow_forward_ios_rounded),

      ImageData(
          imagePath: "assets/images/rejected_entries.png",
          name: "View Rejected Entries",
          description: "This is the second image.",
          icon: Icons.arrow_forward_ios_rounded),

      ImageData(
          imagePath: "assets/images/view_submitted_uc_file.png",
          name: "View Submitted UC",
          description: "This is the second image.",
          icon: Icons.arrow_forward_ios_rounded),


      ImageData(
          imagePath: "assets/images/reports.png",
          name: "Reports",
          description: "This is the second image.",
          icon: Icons.arrow_forward_ios_rounded),


      ImageData(
          imagePath: "assets/images/reports.png",
          name: "Download GFR Form",
          description: "This is the second image.",
          icon: Icons.arrow_forward_ios_rounded),



      // add more images here...
    ];


    return


      Scaffold(

          appBar: AppBar(backgroundColor: Colors.red.withOpacity(0.8),
              title: Center(child: Text("Dashboard",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)),

              actions: <Widget>[

                IconButton(
                  icon: const Icon(Icons.logout_outlined),

                 onPressed: () {
                    showAlertDialog();

                    /*ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                 content: Text('This is a Appbar Icon example')));*/


                    /*showDialog(
               context: context,
               builder: (context) => AlertDialog(
                 context: context,
                 title: 'Logout',
                 content: 'Are you sure you want to exit!!!',
                 action1: 'cancel',
                 action2: 'yes',
                 function1: () => functionA(),
                 function2: () => functionB(context),
                 div: false,
                 txtAlign: 2,
                 radius: 0.0,
                 boxColor: Colors.green,
                 btnTxtColor: Colors.white,
                 txtColor: Colors.white,
               ),
             )*/


                  },

                ),
              ]),

          body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),

    decoration: const BoxDecoration(
    // color: Colors.red.withOpacity(0.1),
    image: DecorationImage(
    image: NetworkImage(
    // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShp2T_UoR8vXNZXfMhtxXPFvmDWmkUbVv3A40TYjcunag0pHFS_NMblOClDVvKLox4Atw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx7IBkCtYd6ulSfLfDL-aSF3rv6UfmWYxbSE823q36sPiQNVFFLatTFdGeUSnmJ4tUzlo&usqp=CAU'),
    fit: BoxFit.cover,
    opacity: 0.3)),



              child: ListView.builder(

                itemCount: imageDataList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0.0,5.0,0.0,5.0),
                    child: Card( //
                      // shape: BorderRadius.circular(6.0),//
                      // <-- Card widget
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                          onTap: () =>
                          {
                            if(imageDataList[index].name == "Reports")
                              {
                                Navigator.of(context).push(

                                    MaterialPageRoute(builder: (context) =>
                                        ReportScreen(
                                        )
                                    )
                                )

                              }

                            else if(imageDataList[index].name=="Download GFR Form")
                              {

                                Navigator.of(context).push(


                                    MaterialPageRoute(builder: (context) =>
                                        EUCGFRForm(
                                        )


                                    )


                                )

                              }




                            else
                              {
                                Navigator.of(context).push(


                          MaterialPageRoute(builder: (context) =>
                      MyMapPage(
                      )
          /*WMSLayerMarker()*/

                  )


                                )

                              }



                          },

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        tileColor: Colors.red.withOpacity(0.3),
                        leading: Image.asset(
                          imageDataList[index].imagePath, width: 40, height: 40,color: Colors.white,),
                        title: Text(imageDataList[index].name,style: TextStyle(fontWeight: FontWeight.bold),),
                        trailing: Icon(imageDataList[index].icon,color: Colors.white,),
                      ),
                      //  ),
                    ),
                  );
                },
              )

          ));


    //);


    /* final titles = ['bike', 'boat', 'bus', 'car',
     'railway', 'run', 'subway', 'transit', 'walk'];

   final icons = [Icons.directions_bike, Icons.directions_boat,
     Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
     Icons.directions_run, Icons.directions_subway, Icons.directions_transit,
     Icons.directions_walk];

   return ListView.builder(
     itemCount: titles.length,
     itemBuilder: (context, index) {
       return Card( //                           <-- Card widget
         child: ListTile(
           leading: Icon(icons[index]),
           title: Text(titles[index]),
         ),
       );
     },
   );*/
  }

  void showAlertDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Logout?'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('No',style: TextStyle(color:Colors.white),)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () {
                    // Write code to delete item
                  },
                  child: const Text(
                    'Yes',style: TextStyle(color: Colors.white),
                  )),
            ],
          );
        });
  }


  Card makeDashboardItem(String title, Image image) {
    return Card(
        elevation: 1.0,
        margin: EdgeInsets.all(8.0),
        child: Container(
          // height: 20,
          decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(8.0),),
          child: InkWell(
            onTap: () {},
            child: Column(

              /* crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,*/

              children: <Widget>[
                //SizedBox(height: 50.0),
                Center(
                    child: /*Icon(
                      icon,
                      size: 40.0,
                      color: Colors.black,
                    )*/

                    Image.asset(
                        'assets/images/view_submitted_uc_file.png', width: 40,
                        height: 40))
                ,

                SizedBox(height: 20.0),

                Center(
                  child: Text(title,
                      style:
                      TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
    }

}