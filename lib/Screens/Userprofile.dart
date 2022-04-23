import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medizine2/globalConst.dart';

class Userprofile extends StatefulWidget {
  const Userprofile({Key? key}) : super(key: key);

  @override
  _UserprofileState createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 155,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('lib/assets/jobbutton.jpg'))),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 155,
                    color: Colors.grey[100])
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 23),
              child: IconButton(
                  padding: EdgeInsets.only(right: 0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: primaryColor,
                  )),
            ),
            Positioned(
              left: 35,
              top: 120,
              child: CircleAvatar(
                radius: 38,
                backgroundImage:
                    AssetImage('lib/assets/hireme.png'),
              ),
            ),
            Positioned(
                left: 120,
                top: 159,
                child: Text(
                  'Jonathan',
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.w300),
                )),
            Positioned(
                top: 230,
                left: 25,
                child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                        height: 180,
                        width: 350,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Education'),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Container(
                                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage('lib/assets/unicrest.png'))),
                                  height: 100,
                                  width: 100,
                                ),
                                SizedBox(width: 60),
                                Text('ABC College')
                              ],
                            ),
                            Text('2011 - 2016')
                          ],
                        )))),
            Positioned(
                top: 460,
                left: 25,
                child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                        height: 180,
                        width: 350,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Skills'),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Container(
                                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage('lib/assets/IBM.jpg'))),
                                  height: 100,
                                  width: 100,
                                ),
                                SizedBox(width: 60),
                                Text('IBM IT Manager')
                              ],
                            ),
                            Text('2017 - 2021')
                          ],
                        ))))
            /*Positioned(
                left: 20,
                top: 230,
                child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    elevation: 5,
                    child: Container(
                      width: 320,
                      height: 90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Followers',
                                  style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300)),
                              Text('0',
                                  style: GoogleFonts.roboto(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w200))
                            ],
                          ),
                          Container(height: 55, child: VerticalDivider()),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('  Posts  ',
                                  style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300)),
                              Text('0',
                                  style: GoogleFonts.roboto(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w200))
                            ],
                          ),
                          Container(height: 55, child: VerticalDivider()),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Joined from',
                                  style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300)),
                              Text('21/11/2020',
                                  style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w200))
                            ],
                          )
                        ],
                      ),
                    ))),
            Positioned(
                left: 30,
                top: 350,
                child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    elevation: 5,
                    child: Container(
                        width: 300,
                        height: 300,
                        child: Center(child: Text('list of user posts???')),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))))))*/
          ],
        ));
  }
}
