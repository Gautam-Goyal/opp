import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opp/models/company_detailed_page.dart';
import 'package:opp/models/company_tile_template.dart';

class CompanyListTile extends StatefulWidget {
  final CompanyTile companyTile;
  final int index;
  const CompanyListTile({Key? key, required this.companyTile,required this.index})
      : super(key: key);

  @override
  _CompanyListTileState createState() => _CompanyListTileState();
}

class _CompanyListTileState extends State<CompanyListTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
              child: Image.asset(
                'assets/download.jpeg',
                width: 150.0,
                height: 190.0,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  height: 150.0,
                  // color: Colors.amber,
                  child: Column(
                    // mainAxisSize: ,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      //TODO: Wrap Text for longer company name

                      Text(
                        widget.companyTile.name,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0),
                      ),
                      Text(
                        "Arrival Date: ${widget.companyTile.name}",
                        style:
                        const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold,fontSize: 15.0),
                      ),
                      Text(
                        "Estimated Package: ${widget.companyTile.package}",
                        style:
                        const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold, fontSize: 15.0),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    ButtonBar(
                      children: [
                        TextButton(
                          child: const Text('View Details',style: TextStyle(color: Color(0xff643B9B)),),
                          onPressed: () {
                            Navigator.push(context, PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 1000),
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation) => CompanyDetailedPage(
                                index: widget.index,
                                companyTile: widget.companyTile,
                              ),
                              transitionsBuilder: (
                                  BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation,
                                  Widget child) {
                                return Align(
                                  child: FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  ),
                                );
                              },
                            ),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                )
              ],
            )

            // ListTile(
            //   title: Text(com),
            //   subtitle: Text(subheading),
            //   trailing: Icon(Icons.favorite_outline),
            // ),
            // Container(
            //   height: 200.0,
            //   child: Ink.image(
            //     image: cardImage,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.all(16.0),
            //   alignment: Alignment.centerLeft,
            //   child: Text(supportingText),
            // ),
            // ButtonBar(
            //   children: [
            //     TextButton(
            //       child: const Text('CONTACT AGENT'),
            //       onPressed: () {/* ... */},
            //     ),
            //     TextButton(
            //       child: const Text('LEARN MORE'),
            //       onPressed: () {/* ... */},
            //     )
            //   ],
            // )
          ],
        ));
    //   Container(
    //   margin: const EdgeInsets.symmetric(vertical: 10),
    //   child: Row(
    //     children: [
    //       Container(
    //         padding:const EdgeInsets.symmetric(horizontal: 10.0),
    //         child: Text(widget.companyTile.name,style: const TextStyle(
    //           fontWeight: FontWeight.bold,
    //         ),),),
    //       Container(
    //         padding:const EdgeInsets.symmetric(horizontal: 10.0),
    //         child: Text(widget.companyTile.package.toString(),style: const TextStyle(
    //         ),),),
    //       Container(
    //         padding:const EdgeInsets.symmetric(horizontal: 10.0),
    //         child: Text(widget.companyTile.timestamp.toString(),style: const TextStyle(
    //           fontWeight: FontWeight.bold,
    //         ),),),
    //       Container(
    //         padding:const EdgeInsets.symmetric(horizontal: 10.0),
    //         child: Text(widget.companyTile.name,style: const TextStyle(
    //           fontWeight: FontWeight.bold,
    //         ),),),
    //       Container(
    //         padding:const EdgeInsets.symmetric(horizontal: 10.0),
    //         child: Text(widget.companyTile.name,style: const TextStyle(
    //           fontWeight: FontWeight.bold,
    //         ),),),
    //     ],
    //   ),
    // );
  }
}
