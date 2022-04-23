import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:medizine2/globalConst.dart';

class Pathogen {
  var name;
  var image;
}

class LearnPage extends StatefulWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  _LearnPageState createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: SystemUiOverlay.values);
      },
      child: Scaffold(
          backgroundColor: Colors.grey[100],
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Stack(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 110,
                    color: secondaryColor,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, top: 40),
                      child: Text('Database',
                          style: GoogleFonts.ptSans(
                              fontSize: 25, fontWeight: FontWeight.w600)),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 90),
                  child: ListSearch(),
                ),
              ],
            ),
          )),
    );
  }
}

class ListSearch extends StatefulWidget {
  const ListSearch({Key? key}) : super(key: key);

  @override
  _ListSearchState createState() => _ListSearchState();
}

class _ListSearchState extends State<ListSearch> {
  TextEditingController searchBarController = TextEditingController();
  static List<String> nameList = [
    'Folder 1',
    'Folder 2',
    'Folder 3',
    'Folder 4'
  ];

  List<String> updatedNameList = nameList;
  textChange(value) {
    setState(() {
      updatedNameList = nameList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  // ignore: non_constant_identifier_names
  Widget PathogenSelect({text}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Material(
        elevation: 0,
        color: Colors.grey[100],
        child: Stack(
          children: [
            Opacity(
              opacity: 0.8,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('lib/assets/folder.png')),
                ),
              ),
            ),
            Center(
                child: Text(
              text,
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w300),
            )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 5,
          child: Container(
            width: 300,
            height: 40,
            color: Colors.white,
            child: TextField(
                controller: searchBarController,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search, color: Colors.black),
                    hintText: 'Search here...',
                    hintStyle: GoogleFonts.roboto(),
                    contentPadding: EdgeInsets.only(left: 15, top: 5),
                    border: InputBorder.none),
                onChanged: textChange),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: SizedBox(
            height: 490,
            child: GridView.count(
              childAspectRatio: 1,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: ScrollPhysics(),
              crossAxisCount: 2,
              children: updatedNameList.map((data) {
                return PathogenSelect(
                  text: data,
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}
