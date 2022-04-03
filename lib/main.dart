import 'package:flutter/material.dart';
import 'package:opp/models/company_info_page.dart';
import 'package:opp/models/registerer_profile.dart';
import 'package:opp/providers/bottom_bar_navigation_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:opp/utils/connectivity_result.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import 'models/company_tile_template.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //     future: _initialization,
    //     builder: (context, snapshot){
    //       if (snapshot.hasError) {
    //         print('${snapshot.error}');
    //       }
    //
    //       if(snapshot.connectionState == ConnectionState.done){
    //
    //       }
    //   }
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MultiProvider(
        providers: [
          // ChangeNotifierProvider<CompanyTile>(
          //     create:(_)=>CompanyTile()
          // ),
          StreamProvider<ConnectivityResult>.value(
            value: ConnectivityService().connectionStatusController.stream, initialData: ConnectivityResult.none,
          ),
        ],
        child: const MyHomePage(title: 'OPP'),
      ),
      routes: {
        '/companyFeed': (BuildContext context) => new CompanyInfoPage(),
        '/userLogin': (BuildContext context) => new RegistererProfile(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var currentTab = [
    const CompanyInfoPage(),
    const RegistererProfile(),
    // const CompanyInfoPage(),
  ];
  //
  // PageController pageController = PageController();
  // int currentIndex = 0;
  // final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  //
  // Widget showSnackBar(connectivityResult){
  //   connectivityResult==ConnectivityResult.none?
  // }

  @override
  Widget build(BuildContext context) {
    ConnectivityResult connectivityResult = Provider.of<ConnectivityResult>(context);
    return Scaffold(
      body: Swiper(
        loop: false,
        // indicatorLayout: PageIndicatorLayout.NONE,
        itemBuilder:
            (BuildContext context,int index){
          return currentTab[index];
        },
        itemCount: currentTab.length,
        pagination: const SwiperPagination(
          // builder:(BuildContext context, SwiperPluginConfig? config){
          //     return LiquidSwipe(
          //     pages: currentTab,
          //   enableLoop: true,
          //   fullTransitionValue: 300,
          //   // enableSlideIcon: true,
          //   waveType: WaveType.liquidReveal,
          //   positionSlideIcon: 0.5,
          //   );
          // },
        ),
        control: null, //SwipeControl
          // iconPrevious: null,
          // iconNext: false?Icon.:null;
        // ),
      ),
    );
    // var provider = Provider.of<BottomNavigationBarProvider>(context);
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(widget.title),
    //   ),
    //   body: PageView(
    //     children: currentTab,
    //     controller: pageController,
    //     onPageChanged: (int index) {
    //         provider.currentIndex = index;
    //     },
    //   ),
    //   bottomNavigationBar: CurvedNavigationBar(
    //     index: provider.currentIndex,
    //     buttonBackgroundColor:Colors.purple.shade300,
    //     backgroundColor:Colors.white,
    //     height: 60.0,
    //     key: _bottomNavigationKey,
    //     items: const <Widget>[
    //       Icon(Icons.add, size: 30),
    //       Icon(Icons.list, size: 30),
    //       Icon(Icons.compare_arrows, size: 30),
    //     ],
    //     onTap: (index) {
    //       provider.currentIndex=index;
    //       pageController.animateToPage(index,
    //                   duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    //             }
    //   )
    // );
  }
}
