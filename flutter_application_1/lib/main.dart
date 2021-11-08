import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/ui_kit.dart';
import 'package:flutter_application_1/widgets/logo_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'network/network.dart';
import 'widgets/product_widget.dart';
import 'widgets/top_button.dart';
import 'widgets/category_title.dart';
import 'widgets/galery_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Test'),
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
  bool loading = true;
  List<PokemonModel> pokemonData = [];

  @override
  void initState() {
    setState(() {
      loading = true;
    });
    fetch();
    // TODO: implement initState
    super.initState();
  }

  @override
  void fetch() async {
    pokemonData = await getHttp(
      from: '20',
      count: '2',
    );
    loading = false;
    setState(() {});
  }

  List<String> galeryItem = [
    'assets/image/galery1.jpg',
    'assets/image/galery2.jpg',
    'assets/image/galery3.jpg',
    'assets/image/galery4.jpg',
    'assets/image/galery5.jpg',
  ];
  PageController controller = PageController(
    initialPage: 0,
  );
  int selectedIndex = 0;

  void onItemTapped(int index) {
    // controller.jumpToPage(index);
    controller.animateToPage(
      index,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LogoButton(
                    imageName: 'assets/button/pawprint.png',
                  ),
                  TopButton(
                    imageName: 'assets/button/profile_image.png',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: controller,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      child: GalerySlider(
                        galeryItem: galeryItem,
                      ),
                      margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: CategoryTitle(
                        categoryName: 'Adoption',
                        titleColor: Colors.red[300],
                      ),
                      margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 94,
                  ),
                  child: loading ? loadPage() : card(),
                ),
                Row(
                  children: [
                    Container(
                      child: CategoryTitle(
                        categoryName: 'Accessories For Pet',
                        titleColor: Colors.blue[700],
                      ),
                      margin: EdgeInsets.fromLTRB(0, 26, 0, 28),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Center(
              child: GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Text('UI Kit'),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UiKit()),
                  );
                },
              ),
            ),
            color: Colors.pink[300],
          ),
          Container(
            color: Colors.grey[400],
          ),
          Container(
            color: Colors.blue[800],
          ),
          Container(
            color: Colors.green[300],
          ),
        ],
      ),
      // bottomNavigationBar: Row(
      //   children: [
      //     BottomNavBar(),
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg_icon/Home.svg',
              color: Colors.grey[900],
            ),
            label: 'Home',
            activeIcon: SvgPicture.asset(
              'assets/svg_icon/Home.svg',
              color: Colors.amber[800],
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg_icon/Discovery.svg',
              color: Colors.grey[900],
            ),
            label: 'Discovery',
            activeIcon: SvgPicture.asset(
              'assets/svg_icon/Discovery.svg',
              color: Colors.amber[800],
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg_icon/Search.svg',
              color: Colors.grey[900],
            ),
            label: 'Search',
            activeIcon: SvgPicture.asset(
              'assets/svg_icon/Search.svg',
              color: Colors.amber[800],
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg_icon/Activity.svg',
              color: Colors.grey[900],
            ),
            label: 'Activity',
            activeIcon: SvgPicture.asset(
              'assets/svg_icon/Activity.svg',
              color: Colors.amber[800],
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg_icon/Notification.svg',
              color: Colors.grey[900],
            ),
            label: 'Notification',
            activeIcon: SvgPicture.asset(
              'assets/svg_icon/Notification.svg',
              color: Colors.amber[800],
            ),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onItemTapped,
      ),
    );
  }

  Widget card() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: pokemonData
          .map(
            (PokemonModel element) => ProductWidget(
              image: element.iconFront,
              name: element.name,
              gender: 'Female',
              subName: 'German Shorth',
              backgroundColor: Colors.red[200],
            ),
          )
          .toList()
          .sublist(0, 2),
    );
  }

  Widget loadPage() {
    return Container(
      margin: EdgeInsets.only(
        top: 24,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: Colors.white70,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              width: 300.0,
              height: 200.0,
              alignment: AlignmentDirectional.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: CircularProgressIndicator(
                        value: null,
                        strokeWidth: 7.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25.0),
                    child: Center(
                      child: Text(
                        "loading.. wait...",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
