import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_todolist/UI/AddTodo.dart';
import 'package:final_project_todolist/UI/SigUpPage.dart';
import 'package:final_project_todolist/UI/ToDoCard.dart';
import 'package:flutter/material.dart';
import '../services/Auth_Service.dart';
import 'package:final_project_todolist/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthGoogle authGoogle = AuthGoogle();
  final Stream<QuerySnapshot> _stream =
      FirebaseFirestore.instance.collection("Todo").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1d1e26),
      appBar: AppBar(
        backgroundColor: Color(0xff1d1e26),
        title: Text(
          "To do List",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/profile.png"),
          ),
          SizedBox(
            width: 25,
          ),
        ],
        bottom: PreferredSize(
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "Hallo, Name Here",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(35),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff1d1e26),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.white,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => AddToDoPage()));
              },
              child: Container(
                child: Icon(Icons.add),
              ),
            ),
            label: 'Add',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'About',
            backgroundColor: Colors.white,
          ),
        ],
      ),
      body: StreamBuilder(
          stream: _stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                return ToDoCard(
                  title: "Wake up Bro",
                  check: true,
                  iconBgColor: Colors.white,
                  iconData: Icons.alarm,
                  time: "10 AM",
                );
              },
            );
          }),
    );
  }
}

//  bottomNavigationBar: Container(
//         height: 60,
//         color: Colors.black12,
//         child: InkWell(
//           onTap: () => print('tap on close'),
//           child: Padding(
//             padding: EdgeInsets.only(top: 8.0),
//             child: Column(
//               children: <Widget>[
//                 Icon(
//                   Icons.close,
//                   color: Theme.of(context).accentColor,
//                 ),
//                 Text('close'),
//               ],
//             ),
//           ),
//         ),
//       ),
 
// actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () async {
//               await authGoogle.logout();
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (builder) => SignUpPage()),
//                   (route) => false);
//             },
//           )
//         ],
