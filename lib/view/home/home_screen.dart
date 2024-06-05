// import 'dart:convert';

// import 'package:bloc_flutter/config/routes/routes_name.dart';
// import 'package:bloc_flutter/models/news/news_model.dart';
// import 'package:bloc_flutter/services/storage/storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' as rootBundle;

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   LocalStorage localStorage = LocalStorage();

//   initstate() {
//     ReadJsonData();
//   }

//   Future<List<NewsModel>> ReadJsonData() async {
//     //read json file
//     final jsondata = await rootBundle.rootBundle.loadString('json/news.json');
//     //decode json data as list
//     final list = json.decode(jsondata) as List<dynamic>;

//     print(list);

//     //map json and initialize using DataModel
//     return list.map((e) => newsModelFromJson(e)).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           InkWell(
//             onTap: () {
//               localStorage.clearValue("token").then((value) {
//                 localStorage.clearValue("isLogin").then((value) {
//                   Navigator.pushNamed(context, RoutesName.loginScreen);
//                 });
//               });
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Icon(Icons.logout),
//             ),
//           )
//         ],
//       ),
//       body: Column(
//         children: [Center(child: Text(" home  page"))],
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:bloc_flutter/models/news/news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    ReadJsonData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(categories![0].title.toString())));
    //     FutureBuilder(
    //   future: ReadJsonData(),
    //   builder: (context, data) {
    //     if (data.hasError) {
    //       return Center(child: Text("${data.error}"));
    //     } else if (data.hasData) {
    //       var items = data.data as List<NewsModel>;
    //       return ListView.builder(
    //           itemCount: items == null ? 0 : items.length,
    //           itemBuilder: (context, index) {
    //             return Card(
    //               elevation: 5,
    //               margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    //               child: Container(
    //                 padding: EdgeInsets.all(8),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     Container(
    //                       width: 50,
    //                       height: 50,
    //                       child: Text(items[index].encoding.toString()),

    //                       // Image(
    //                       //   image:
    //                       //       NetworkImage(items[index].version.toString()),
    //                       //   fit: BoxFit.fill,
    //                       // ),
    //                     ),
    //                     // Expanded(
    //                     //     child: Container(
    //                     //   padding: EdgeInsets.only(bottom: 8),
    //                     //   child: Column(
    //                     //     mainAxisAlignment: MainAxisAlignment.center,
    //                     //     crossAxisAlignment: CrossAxisAlignment.start,
    //                     //     children: [
    //                     //       Padding(
    //                     //         padding: EdgeInsets.only(left: 8, right: 8),
    //                     //         child: Text(
    //                     //           items[index].name.toString(),
    //                     //           style: TextStyle(
    //                     //               fontSize: 16,
    //                     //               fontWeight: FontWeight.bold),
    //                     //         ),
    //                     //       ),
    //                     //       Padding(
    //                     //         padding: EdgeInsets.only(left: 8, right: 8),
    //                     //         child: Text(items[index].price.toString()),
    //                     //       )
    //                     //     ],
    //                     //   ),
    //                     // ))
    //                   ],
    //                 ),
    //               ),
    //             );
    //           });
    //     } else {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //   },
    // ));
  }

  List<Category>? categories = [];
  ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle.loadString('json/news.json');
    final list = json.decode(jsondata);
    NewsModel newsModel = NewsModel.fromJson(list);
    categories!.addAll(newsModel.dashboard!.categories as Iterable<Category>);
    setState(() {});
  }
}
