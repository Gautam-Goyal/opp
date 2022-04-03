import 'package:flutter/material.dart';

import 'company_tile_template.dart';


class CompanyDetailedPage extends StatefulWidget {

  final int index;
  final CompanyTile companyTile;
  const CompanyDetailedPage({Key? key, required this.index, required this.companyTile}) : super(key: key);

  @override
  _CompanyDetailedPageState createState() => _CompanyDetailedPageState();
}

class _CompanyDetailedPageState extends State<CompanyDetailedPage> {
  // final List<Events> listOfEvents = [
  //   Events(eventName: "New Icon", description: "Mobile App"),
  //   Events(eventName: "Design Stand Up", description: "Hangouts"),
  //   Events(time: "12pm", eventName: "Lunch Break", description: "Main Room"),
  //   Events(time: "9 - 11am", eventName: "Finish Home Screen", description: "Web App"),
  // ];

  TextStyle style =  const TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Company Info",style: TextStyle(
          color: Colors.black
        ),),
        elevation: 0.0,
        backgroundColor: Colors.white54,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back), onPressed: () {
            Navigator.of(context).pop();
        },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(bottom:20.0,top: 20.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft:  Radius.circular(6)
                  )
                )
                  ,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // color:Colors.grey,
                      child: Hero(
                      tag:"Different"+widget.index.toString(),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              'assets/download.jpeg',
                              width: 150.0,
                              height: 190.0,
                              fit: BoxFit.fill,
                            ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.companyTile.name,
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 2.0,
                          color: Colors.black12,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Estimated Package: ",
                              style: TextStyle(color: Color(0xff643B9B), fontSize: 18),
                            ),
                            Text(
                              widget.companyTile.package.toString(),
                              style: const TextStyle(color: Color(0xff643B9B), fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Department: ",
                              style: TextStyle(color: Color(0xff643B9B), fontSize: 18),
                            ),
                            Text(
                              widget.companyTile.department,
                              style: const TextStyle(color: Colors.black87, fontSize: 18),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Rounds Info: ",
                          style: TextStyle(color: Color(0xff643B9B), fontSize: 18),
                        ),
                        SingleChildScrollView(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: widget.companyTile.roundsInfo.length,
                              itemBuilder: (context, i) {
                                return Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        children: [
                                          SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                                          SizedBox(child: Text(widget.companyTile.roundsInfo[i]),
                                            // width: MediaQuery.of(context).size.width * 0.2,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      child: Container(
                                        height: MediaQuery.of(context).size.height * 0.7,
                                        width: 1.0,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    Positioned(
                                      top: 16,
                                      left: 10,
                                      child: Container(
                                        // height: 20.0,
                                        // width: 20.0,
                                        child: const Icon(Icons.info,color: Color(0xff643B9B),),
                                        // decoration: new BoxDecoration(
                                        //   color: listOfColors[random.nextInt(3)],
                                        //   borderRadius: BorderRadius.circular(20),
                                        // ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                  ],
                )
            ],
          ),
        ),
        ]
      ),
    ),
    ),
    );
  }
}


class Events {
  final String eventName;


  Events({required this.eventName});

}
