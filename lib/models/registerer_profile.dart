import 'package:flutter/material.dart';

class RegistererProfile extends StatefulWidget {
  const RegistererProfile({Key? key}) : super(key: key);

  @override
  _RegistererProfileState createState() => _RegistererProfileState();
}

class _RegistererProfileState extends State<RegistererProfile> with AutomaticKeepAliveClientMixin{

  var streamList = ["B.Tech","Biotech","Pharmacy","MBA"];
  var branchList = [["CSE","Mechanical","ECE","Civil"],["Field1","Field2","Field3"]];
  late String _selectedValue;
  // List formControllers=[
    TextEditingController firstnameController =TextEditingController();
   TextEditingController lastnameController=TextEditingController();
   TextEditingController streamController=TextEditingController();
    TextEditingController branchController=TextEditingController();
  // ];
    List<bool> _isOpen = [false,false,false];
  // final TextEditingController loginUsernameController=TextEditingController();
  GlobalKey<FormState> formkey1= GlobalKey<FormState>();
    GlobalKey<FormState> formkey2= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          snap: false,
          pinned: false,
          floating: false,
          // title: Text('Register'),
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
            // title: const Text('Register for '),
            //   centerTitle: true,
              background: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xff643B9B)
                  ),
                // color: const Color(0xff643B9B),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          padding: const EdgeInsets.only(left: 30.0,top: 30.0,right: 160),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const <Widget>[
                              Text('Register',style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0
                              ),),
                              Flexible(
                                child: Text(
                                  "To Sit For Companies",
                                  style: TextStyle(
                                      color: Color(0xffE1BEE7),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40.0
                                  ),
                                ),
                              ),
                              // Text(
                              //   "Selection",
                              //   style: TextStyle(
                              //       color: Color(0xffE1BEE7),
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 40.0
                              //   ),
                              // )
                            ],
                          ),
                          // width: MediaQuery.of(context).size.width/2,
                          decoration: const BoxDecoration(
                            color: Color(0xff643B9B),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0.0,
                      right: 0.0,
                      left: MediaQuery.of(context).size.width/2,
                      bottom: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xff643B9B),
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.elliptical(100, 150)
                            )
                        ),
                        child: Image.asset(
                        "assets/form-drib.gif",
                        scale: 5.0,
                        // width: 50,
                        // fit: BoxFit.fitWidth,
                  ),
                      ),
                    ),
                  ]
                ),
              ) //Images.network
          ), //Fl
          backgroundColor: Colors.purple,
           //IconButton
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.comment),
          //     tooltip: 'Comment Icon',
          //     onPressed: () {},
          //   ), //IconButton
          //   IconButton(
          //     icon: Icon(Icons.settings),
          //     tooltip: 'Setting Icon',
          //     onPressed: () {},
          //   ), //IconButton
          // ], //<Widget>[]
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ExpansionTile(title: const Text('General'),
            initiallyExpanded: true,
            children: [
              Form(
                key: formkey1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    EmailWithIcon(
                      hint: "Enter Your First Name",
                      keyboard: TextInputType.emailAddress,
                      nameController: firstnameController,
                    ),
                    const SizedBox(height: 8.0,),
                    EmailWithIcon(
                      // icon: Iconsu,
                      hint: "Enter Your Last Name",
                      keyboard: TextInputType.emailAddress,
                      nameController: lastnameController,
                    ),
                    // PasswordWithIcon(
                    //   icon: Icons.vpn_key,
                    //   hint: "Enter Password",
                    //   keyboard: TextInputType.text,
                    //   passwordController: signupPasswordController,
                    // ),
                  ],
                ),

              ),
            ],
            ),
            ExpansionTile(title: Text('Education'),
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Form(
                    key: formkey2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // Autocomplete(
                        //   optionsBuilder: (TextEditingValue value) {
                        //     // When the field is empty
                        //     if (value.text.isEmpty) {
                        //       return [];
                        //     }
                        //
                        //     // The logic to find out which ones should appear
                        //     return streamList.where((suggestion) => suggestion
                        //         .toLowerCase()
                        //         .contains(value.text.toLowerCase()));
                        //   },
                        //   onSelected: (value) {
                        //     setState(() {
                        //       _selectedValue = value.toString();
                        //     });
                        //   },
                        // ),
                        const SizedBox(height: 8.0,),
                        EmailWithIcon(
                          hint: "Enter Your Stream",
                          keyboard: TextInputType.emailAddress,
                          nameController: firstnameController,
                        ),
                        const SizedBox(height: 8.0,),
                        EmailWithIcon(
                          // icon: Iconsu,
                          hint: "Enter Your Branch",
                          keyboard: TextInputType.emailAddress,
                          nameController: lastnameController,
                        ),
                        // PasswordWithIcon(
                        //   icon: Icons.vpn_key,
                        //   hint: "Enter Password",
                        //   keyboard: TextInputType.text,
                        //   passwordController: signupPasswordController,
                        // ),
                      ],
                    ),

                  ),
                ),
              ],
            ),
            // ExpansionTile(title: Text('Education'),
            //   children: [
            //     EmailWithIcon(
            //       hint: "Enter Your Name",
            //       keyboard: TextInputType.emailAddress,
            //       nameController: nameController,
            //     ),
            //     EmailWithIcon(
            //       hint: "Enter Your Name",
            //       keyboard: TextInputType.emailAddress,
            //       nameController: nameController,
            //     ),
            //   ],
            // ),
            // TODO: Check below function

            // ExpansionPanelList(
            //       expansionCallback: (int i,bool isOpen){
            //         setState(() {
            //           _isOpen[i]=!isOpen;
            //         });
            //       },
            //       children: [
            //         ExpansionPanel(
            //             headerBuilder: (BuildContext context, bool isExpanded){
            //                 return isExpanded?const Text("General",style: TextStyle(color: Color(0xff643B9B)),):const Text("General");
            //         },
            //           canTapOnHeader: true,
            //         isExpanded: _isOpen[0],
            //         body: Container(
            //           margin: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10.0),
            //           child: Form(
            //             key: formkey1,
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: <Widget>[
            //                 EmailWithIcon(
            //                   hint: "Enter Your Name",
            //                   keyboard: TextInputType.emailAddress,
            //                   nameController: nameController,
            //                 ),
            //                 const SizedBox(height: 8.0,),
            //                 EmailWithIcon(
            //                   // icon: Iconsu,
            //                   hint: "Enter Your Name",
            //                   keyboard: TextInputType.emailAddress,
            //                   nameController: nameController,
            //                 ),
            //                 // PasswordWithIcon(
            //                 //   icon: Icons.vpn_key,
            //                 //   hint: "Enter Password",
            //                 //   keyboard: TextInputType.text,
            //                 //   passwordController: signupPasswordController,
            //                 // ),
            //               ],
            //             ),
            //
            //           ),
            //         ),
            //         ),
            //       ],
            //     ),
            const SizedBox(height: 20.0,),
            Center(child: GestureDetector(
                onTap:(){

            },
                child: Container(height:40.0,width:100.0,child: const Center(child: Text("Submit",style: TextStyle(color: Colors.white70),)),decoration: BoxDecoration(color:Color(0xff643B8A),borderRadius: BorderRadius.circular(50)),)),)
            ],
        )
        )
      ],

    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class EmailWithIcon extends StatefulWidget {
  // final IconData icon;
  final String hint;
  final TextInputType keyboard;
  final TextEditingController nameController;
  EmailWithIcon({required this.hint,required this.keyboard,required this.nameController});

  @override
  _EmailWithIconState createState() => _EmailWithIconState();
}

class _EmailWithIconState extends State<EmailWithIcon> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      controller: widget.nameController,
      // ignore: missing_return
      validator: (String? value){
        if(value!.isEmpty){
          return 'Please fill this field!';
        }
      },
      keyboardType: widget.keyboard,
      style: const TextStyle(
          color:  Colors.black,
          fontSize: 15.0
      ),
      obscureText: false,
      // cursorColor: Color(0xFF29a329),
      decoration: InputDecoration(
          filled: true,
          // prefixIcon: Icon(widget.icon,
          //     color:  Color(0xFFbfbfbf)),
          labelText: widget.hint,
          enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xff643B9B))
          ),
          labelStyle: TextStyle(color:Color(0xff643B9B))
      ),
    );
  }
}