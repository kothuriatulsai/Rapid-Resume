import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:scroll_app_bar/scroll_app_bar.dart';

//for future usage
class PostInfo {
  var username;
  var pfp;
  var date;
  var textOnly;
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ScrollController();
  final items = List<String>.generate(30, (i) => "Tile $i");
  // ignore: non_constant_identifier_names
  List<bool> PostList = [
    true,
    false,
    false,
    true,
    true,
    false,
    false,
    true,
    true,
    false,
    true,
    true,
    true,
    true,
    false
  ];
  Widget post(index) {
    return Container(
        margin:
            index == 0 ? EdgeInsets.only(top: 25) : EdgeInsets.only(top: 25),
        height: PostList[index] == true ? 172 : 378,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        AssetImage('lib/assets/hireme.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text('Jonathan'),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Flexible(
                  child: Text(
                      'I am Jonathan, a guy looking for a job')),
            ),
            PostList[index] != true
                ? Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 240,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage('lib/assets/job-searching.jpg'))),
                    ),
                  )
                : Container(), //do nothing
            Padding(
              padding: PostList[index] == true
                  ? EdgeInsets.only(left: 200, top: 54)
                  : EdgeInsets.only(left: 200, top: 10),
              child: Row(
                children: [
                  IconButton(
                      iconSize: 20,
                      splashRadius: 20,
                      constraints: BoxConstraints(maxHeight: 40, maxWidth: 40),
                      onPressed: () {
                        print('hello');
                      },
                      icon: Icon(Icons.keyboard_arrow_up)),
                  SizedBox(
                    height: 20,
                    width: 25,
                    child: Center(
                        child: Text('5', style: GoogleFonts.montserrat())),
                  ),
                  IconButton(
                      iconSize: 20,
                      splashRadius: 20,
                      constraints: BoxConstraints(maxHeight: 40, maxWidth: 40),
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_down)),
                  SizedBox(
                    height: 20,
                    width: 25,
                    child: Center(
                      child: Text(
                        '1',
                        style: GoogleFonts.montserrat(),
                      ),
                    ),
                  ),
                  IconButton(
                      iconSize: 20,
                      splashRadius: 20,
                      constraints: BoxConstraints(maxHeight: 40, maxWidth: 40),
                      onPressed: () {},
                      icon: Icon(Icons.flag_outlined))
                ],
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ScrollAppBar(
          controller: controller,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text("Rapid Resume",
              style: GoogleFonts.montserrat(fontSize: 28, color: Colors.black)),
        ),
        body: ListView.builder(
          key: PageStorageKey("posts"),
          shrinkWrap: true,
          controller: controller,
          itemCount: PostList.length,
          itemBuilder: (context, index) {
            return post(index);
          },
        ));
  }
}
