import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opp/models/company_tile_template.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'company_list_tile.dart';
import 'package:intl/intl.dart';

class CompanyInfoPage extends StatefulWidget {
  const CompanyInfoPage({Key? key}) : super(key: key);

  @override
  _CompanyInfoPageState createState() => _CompanyInfoPageState();
}

class _CompanyInfoPageState extends State<CompanyInfoPage>
    with AutomaticKeepAliveClientMixin {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();


  String formatTimestamp(Timestamp timestamp) {
    var format = DateFormat.yMMMMd('en_US'); // 'hh:mm' for hour & min
    return format.format(timestamp.toDate());
  }

  Future<List<CompanyTile>> returnDocuments() async {
    var result = await _firestore.collection('comapanyInfo').get();
    // print(result.docs);
    // if (result.doc) {
    //   return [];
    var companytiles = <CompanyTile>[];
    for (var doc in result.docs) {
      print('*********${doc.data()["Arrival Date"]}');
      doc.data()["Arrival Date"]=formatTimestamp(doc.data()["Arrival Date"]);
          // ((doc.data()["Arrival Date"].seconds+(doc.data()["Arrival Date"].nanoseconds)*0.00000001)*1000).toString();
      print('******#######***${doc.data()["Arrival Date"]}');
      companytiles.add(CompanyTile.fromMap(doc.data()));
      print(doc.data());
    }
    return companytiles;
    _firestore.collection("comapanyInfo").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
      });
    });
  }

  late Future<List<CompanyTile>> myFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firestore = FirebaseFirestore.instance;
    myFuture = returnDocuments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        elevation: 0.0,
        title: const Text(
          'Recruitment Update',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
            splashColor: Colors.purple,
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            color: Colors.black,
            icon: const Icon(Icons.bookmark),
            highlightColor: Colors.black,
            splashColor: Colors.purple,
          )
        ],
      ),
      body: FutureBuilder(
        future: myFuture,
        builder: (BuildContext context, snapshot) {
          // print(snapshot.data!.data());
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data==null) {
            return LiquidPullToRefresh(
              springAnimationDurationInMilliseconds: 1000,
              showChildOpacityTransition: true,
              onRefresh: () async {
                setState(() {
                  myFuture = returnDocuments();
                });
              },
              key: _refreshIndicatorKey,
              child: const Center(
                child: Text('No Data'),
              ),
            );
          }
          if (snapshot.hasData) {
            var list = snapshot.data! as List;
            return LiquidPullToRefresh(
              springAnimationDurationInMilliseconds: 1000,
              showChildOpacityTransition: true,

              /////////////////////////////////////////
              // TODO: Change setState() with Provider
              /////////////////////////////////////////

              onRefresh: () async {
                setState(() {
                  myFuture = returnDocuments();
                });
              },
              key: _refreshIndicatorKey,
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    if (snapshot.data != null) {
                      return Hero(
                          tag: "Different" + index.toString(),
                          child: CompanyListTile(companyTile: list[index],index:index)
                      );
                      // return Text(
                      //     "Full Name: ${(list[index] as CompanyTile)
                      //         .name} ${(list[index] as CompanyTile)
                      //         .package}");
                    } else {
                      return const Text('Data not present');
                    }
                  }),
            );
          }

          return const CircularProgressIndicator();
          // }

          // if (snapshot.connectionState == ConnectionState.done) {
          //   print(snapshot.data!.data());
          // Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          // return Text("Full Name: ${data['Name']} ${data['Package']}");
          // }
          //
          // return Text("loading");
          // if (snapshot.hasError) {
          //   return Text('Something went wrong');
          // }
          //
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return Text("Loading");
          // }
          // if(snapshot.hasData) {
          //   print("**********************************");
          //   print("**********************************");
          //   print("**********************************${snapshot.data!.data()}");
          //   Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          //   return ListTile(
          //     title: Text(data['Name']),
          //     subtitle: Text(data['Package']),
          //   );
          // }

          // return const CircularProgressIndicator();
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
// class UserInformation extends StatefulWidget {
//   @override
//   _UserInformationState createState() => _UserInformationState();
// }
//
// class _UserInformationState extends State<UserInformation> {
//   final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('companyInfo');
//
//   Future<DocumentSnapshot<Object?>> returnDocuments(){
//     return _collectionReference.doc().get();
//   }
//
//   late Future<DocumentSnapshot<Object?>> myFuture;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     myFuture=returnDocuments();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<DocumentSnapshot>(
//       future: myFuture,
//         builder:(BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }
//
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Text("Loading");
//         }
//         print("**********************************");
//         print("**********************************");
//         print("**********************************${snapshot.data!.data()}");
//         Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
//             return ListTile(
//               title: Text(data['Name']),
//               subtitle: Text(data['Package']),
//             );
//       },
//     );
//   }
// }
