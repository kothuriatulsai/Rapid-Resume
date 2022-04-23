import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medizine2/globalConst.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: secondaryColor,
            elevation: 0,
            title: Text('Search for Companies or Colleges',
                style: GoogleFonts.ptSans(fontSize: 20, color: Colors.black))),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(
              elevation: 5,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                color: Colors.white,
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      hintText: 'Enter College / Company name',
                      hintStyle: GoogleFonts.roboto(),
                      contentPadding: EdgeInsets.only(left: 15, top: 5),
                      border: InputBorder.none),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Opacity(
                  opacity: 0.5,
                  child: Text('Search Results here',
                      style: TextStyle(fontSize: 20))),
            )
          ],
        ));
  }
}

Widget searchResult() {
  return Card(
    color: Colors.red,
    elevation: 1,
  );
}
